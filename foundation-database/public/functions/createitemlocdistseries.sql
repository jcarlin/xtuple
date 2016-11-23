CREATE OR REPLACE FUNCTION createItemlocdistSeries( pItemsiteid INTEGER, pQty NUMERIC, pOrderType TEXT, pOrderNumber TEXT) RETURNS INTEGER AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  _itemlocdistseries  INTEGER;
  _itemlocdistid      INTEGER;
  _r                  RECORD;
  _debug              BOOLEAN := false;
BEGIN

  IF (_debug) THEN
    RAISE NOTICE 'createItemlocdistSeries';
    RAISE NOTICE 'itemsite_id=%', pItemsiteid;
    RAISE NOTICE 'qty=%', pQty;
  END IF;

    --  Cache item and itemsite info  
  SELECT itemsite_costmethod,
         itemsite_qtyonhand, 
         itemsite_warehous_id,
         ( (item_type = 'R') OR (itemsite_controlmethod = 'N') ) AS nocontrol,
         (itemsite_controlmethod IN ('L', 'S')) AS lotserial,
         (itemsite_loccntrl) AS loccntrl,
         itemsite_freeze AS frozen INTO _r
  FROM itemsite JOIN item ON (item_id=itemsite_item_id)
  WHERE (itemsite_id=pItemsiteid);

  IF (_r.nocontrol) THEN
    RETURN -1; -- non-fatal error so dont throw an exception?
  END IF;

  --  Distribute this if this itemsite is controlled
  IF ( _r.lotserial OR _r.loccntrl ) THEN
    _itemlocdistseries := nextval('itemloc_series_seq');
    _itemlocdistid := nextval('itemlocdist_itemlocdist_id_seq'); 
    INSERT INTO itemlocdist
    ( itemlocdist_id,
      itemlocdist_itemsite_id,
      itemlocdist_source_type,
      itemlocdist_reqlotserial,
      itemlocdist_distlotserial,
      itemlocdist_expiration,
      itemlocdist_qty,
      itemlocdist_series,
      itemlocdist_invhist_id,
      itemlocdist_order_type,
      itemlocdist_order_id )
    SELECT _itemlocdistid,
           pItemsiteid,
           'O',
           ((pQty > 0)  AND _r.lotserial),
           (pQty < 0),
           endOfTime(),
           pQty,
           _itemlocdistseries,
           NULL, --invhist_id
           pOrderType,
           CASE WHEN pOrderType='SO' THEN getSalesLineItemId(pOrderNumber)
                ELSE NULL
           END;
  END IF;   -- end of distributions

  RETURN _itemlocdistseries;

END;
$$ LANGUAGE plpgsql;
