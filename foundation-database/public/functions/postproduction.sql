-- Function: postproduction(integer, numeric, boolean, integer, timestamp with time zone)

DROP FUNCTION IF EXISTS postproduction(integer, numeric, boolean, integer, timestamp with time zone);
DROP FUNCTION IF EXISTS postproduction(integer, numeric, boolean, integer, timestamp with time zone, boolean);
CREATE OR REPLACE FUNCTION postproduction(pWoid integer,
                                          pQty numeric,
                                          pBackflush boolean,
                                          pItemlocSeries integer,
                                          pGlDistTS timestamp with time zone,
                                          pPreDistributed boolean DEFAULT FALSE,
                                          pPostDistDetail boolean DEFAULT TRUE)
RETURNS integer AS
$BODY$
-- Copyright (c) 1999-2017 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  _whsId         INTEGER;
  _invhistid     INTEGER;
  _itemlocSeries INTEGER := COALESCE(pItemlocSeries, NEXTVAL('itemloc_series_seq'));
  _parentQty     NUMERIC;
  _r             RECORD;
  _sense         TEXT;
  _wipPost       NUMERIC;
  _woNumber      TEXT;
  _ucost         NUMERIC;
  _prevItemsite  INTEGER;
  _prevQty       NUMERIC;
  _controlled    BOOLEAN := FALSE;
  _hasControlledMaterialItems BOOLEAN := FALSE;

BEGIN
  IF (pPreDistributed AND COALESCE(pItemlocSeries, 0) = 0) THEN 
    RAISE EXCEPTION 'pItemlocSeries is Required when pPreDistributed [xtuple: postProduction, -4]';
  -- TODO - find why/how passing 0 instead of null for pItemlocSeries
  ELSIF (_itemlocSeries = 0) THEN
    _itemlocSeries := NEXTVAL('itemloc_series_seq');
  END IF;

  IF (pQty = 0) THEN
    RETURN 0;
  ELSIF (pQty > 0) THEN
    _sense = 'from';
  ELSE
    _sense = 'to';
  END IF;

  IF ( ( SELECT wo_status
         FROM wo
         WHERE (wo_id=pWoid) ) NOT IN  ('R','E','I') ) THEN
    RETURN -1;
  END IF;

--  Make sure that all Component Item Sites exist
  SELECT itemsite_warehous_id INTO _whsId
  FROM wo, bomitem, itemsite
  WHERE ( (wo_itemsite_id=itemsite_id)
   AND (itemsite_item_id=bomitem_parent_item_id)
   AND (woEffectiveDate(wo_startdate) BETWEEN bomitem_effective AND (bomitem_expires - 1))
   AND (wo_id=pWoid)
   AND (bomitem_rev_id=wo_bom_rev_id)
   AND (bomitem_item_id NOT IN
        ( SELECT component.itemsite_item_id
          FROM itemsite AS component, itemsite AS parent
          WHERE ( (wo_itemsite_id=parent.itemsite_id)
           AND (parent.itemsite_item_id=bomitem_parent_item_id)
           AND (bomitem_item_id=component.itemsite_item_id)
           AND (woEffectiveDate(wo_startdate) BETWEEN bomitem_effective AND (bomitem_expires - 1))
           AND (bomitem_rev_id=wo_bom_rev_id)
           AND (component.itemsite_active)
           AND (component.itemsite_warehous_id=parent.itemsite_warehous_id) ) ) ) )
  LIMIT 1;
  IF (FOUND AND pBackflush) THEN
    RETURN -2;
  END IF;

  _woNumber := formatWoNumber(pWoid);

  SELECT roundQty(item_fractional, pQty) INTO _parentQty
  FROM wo, itemsite, item
  WHERE ((wo_itemsite_id=itemsite_id)
   AND (itemsite_item_id=item_id)
   AND (wo_id=pWoid));

  IF (pBackflush) THEN
    _prevItemsite := 0;
    _prevQty := 0.0;
    FOR _r IN SELECT itemsite_id, isControlledItemsite(itemsite_id) AS controlled, womatl_id, womatl_qtyiss +
		     (CASE
		       WHEN (womatl_qtywipscrap >  ((womatl_qtyfxd + (_parentQty + wo_qtyrcv) * womatl_qtyper) * womatl_scrap)) THEN
                         (womatl_qtyfxd + (_parentQty + wo_qtyrcv) * womatl_qtyper) * womatl_scrap
		       ELSE
		         womatl_qtywipscrap
		      END) AS consumed,
		     (womatl_qtyfxd + ((_parentQty + wo_qtyrcv) * womatl_qtyper)) * (1 + womatl_scrap) AS expected,
         _parentQty * womatl_qtyper AS return_qty
	      FROM womatl, wo, itemsite, item
	      WHERE ((womatl_issuemethod IN ('L', 'M'))
		AND  (womatl_wo_id=pWoid)
		AND  (womatl_wo_id=wo_id)
		AND  (womatl_itemsite_id=itemsite_id)
		AND  (itemsite_item_id=item_id))
    ORDER BY womatl_id LOOP
      -- Don't issue more than should have already been consumed at this point
      IF (pQty > 0) THEN
        IF (noNeg(_r.expected - _r.consumed) > 0) THEN
          IF (_r.itemsite_id != _prevItemsite) THEN
            _prevQty := 0.0;
          END IF;
          SELECT issueWoMaterial(_r.womatl_id, noNeg(_r.expected - _r.consumed), _itemlocSeries,
            pGlDistTS, NULL, _prevQty, pPreDistributed, FALSE) INTO _itemlocSeries;
          
          _prevItemsite := _r.itemsite_id;
          _prevQty := _prevQty+noNeg(_r.expected - _r.consumed);
        END IF;
      ELSE
        -- Used by postMiscProduction of disassembly, postProduction with negative qty, postProduction when disassembly
        _itemlocSeries := returnWoMaterial(_r.womatl_id, _r.return_qty * -1, _itemlocSeries, CURRENT_TIMESTAMP, true, pPreDistributed, FALSE);
      END IF;

      UPDATE womatl
      SET womatl_issuemethod='L'
      WHERE ( (womatl_issuemethod='M')
       AND (womatl_id=_r.womatl_id) );

      IF (_r.controlled) THEN
        _hasControlledMaterialItems := true;
      END IF;
      
    END LOOP;
  END IF;

--  ROB Increase this W/O's WIP value for custom costing
  SELECT SUM(
  CASE WHEN itemsite_costmethod = 'S' THEN itemcost_stdcost ELSE itemcost_actcost END
  * _parentQty) INTO _ucost
  FROM wo JOIN itemsite ON (itemsite_id=wo_itemsite_id)
          JOIN itemcost ON (itemcost_item_id=itemsite_item_id AND itemcost_lowlevel = false)
          JOIN costelem ON ((costelem_id=itemcost_costelem_id) AND
                            (costelem_exp_accnt_id IS NOT NULL) AND
                            (NOT costelem_sys))
  WHERE (wo_id=pWoid);

  UPDATE wo
  SET wo_wipvalue = (wo_wipvalue + coalesce(_ucost,0))
  WHERE (wo_id=pWoid);



  SELECT CASE WHEN (pQty < 0 AND itemsite_costmethod='S') THEN stdcost(itemsite_item_id) * pQty
              WHEN (pQty < 0) THEN avgcost(itemsite_id) * pQty
              WHEN (wo_cosmethod = 'D') THEN wo_wipvalue
              ELSE  round((wo_wipvalue - (wo_postedvalue / wo_qtyord * (wo_qtyord -
                    CASE WHEN (wo_qtyord < wo_qtyrcv + pQty) THEN wo_qtyord
                         ELSE wo_qtyrcv + pQty
                    END ))),2)
         END INTO _wipPost
  FROM wo
    JOIN itemsite ON (wo_itemsite_id=itemsite_id)
  WHERE (wo_id=pWoid);

  SELECT postInvTrans( itemsite_id, 'RM', _parentQty,
                       'W/O', 'WO', _woNumber, '', ('Receive Inventory ' || item_number || ' ' || _sense || ' Manufacturing'),
                       costcat_asset_accnt_id, getPrjAccntId(wo_prj_id, costcat_wip_accnt_id), _itemlocSeries, pGlDistTS,
                       -- the following is only actually used when the item is average or job costed
                       _wipPost, NULL, 0.0, pPreDistributed ), isControlledItemsite(itemsite_id) INTO _invhistid, _controlled
  FROM wo, itemsite, item, costcat
  WHERE ( (wo_itemsite_id=itemsite_id)
   AND (itemsite_item_id=item_id)
   AND (itemsite_costcat_id=costcat_id)
   AND (wo_id=pWoid) );

  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'Missing cost category [xtuple: postProduction, -6]';
  END IF;

  IF (pQty < 0 ) THEN
    _wipPost := _wipPost * -1;
  END IF;

--  Increase this W/O's received qty decrease its WIP value
  UPDATE wo
  SET wo_qtyrcv = (wo_qtyrcv + _parentQty),
      wo_wipvalue = (wo_wipvalue - (CASE WHEN (itemsite_costmethod IN ('A','J'))
                                               THEN _wipPost
                                         WHEN (itemsite_costmethod='S')
                                               THEN (stdcost(itemsite_item_id) * _parentQty)
                                         ELSE 0.0  END))
  FROM itemsite, item
  WHERE ((wo_itemsite_id=itemsite_id)
   AND (itemsite_item_id=item_id)
   AND (wo_id=pWoid));

  PERFORM insertGLTransaction( 'W/O', 'WO', _woNumber,
                               ('Post Other Cost ' || item_number || ' ' || _sense || ' Manufacturing'),
                               getPrjAccntId(wo_prj_id, costelem_exp_accnt_id),
                               getPrjAccntId(wo_prj_id,costcat_wip_accnt_id), _invhistid,
			       (CASE WHEN itemsite_costmethod = 'S' THEN itemcost_stdcost ELSE itemcost_actcost END * _parentQty),
                                pGlDistTS::DATE )
  FROM wo, costelem, itemcost, costcat, itemsite, item
  WHERE
    ((wo_id=pWoid) AND
    (wo_itemsite_id=itemsite_id) AND
    (itemsite_item_id=item_id) AND
    (costelem_id = itemcost_costelem_id) AND
    (itemcost_item_id = itemsite_item_id) AND
    (itemsite_costcat_id = costcat_id) AND
    (costelem_exp_accnt_id) IS NOT NULL  AND
    (costelem_sys = false));

  UPDATE wo
  SET wo_status='I'
  WHERE (wo_id=pWoid);

  IF (pPreDistributed AND (pPostDistDetail OR _controlled)) THEN
    IF (postDistDetail(_itemlocSeries) <= 0 AND (_controlled OR _hasControlledMaterialItems)) THEN
      PERFORM postEvent('PostProductionDistributionWarning', 'W',
                        pWoid, _whsId, _woNumber,
                        NULL, NULL, NULL, NULL);
    END IF;
  END IF;

  RETURN _itemlocSeries;

END;
$BODY$ LANGUAGE plpgsql;
ALTER FUNCTION postproduction(integer, numeric, boolean, integer, timestamp with time zone, boolean, boolean)
  OWNER TO admin;
