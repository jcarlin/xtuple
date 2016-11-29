-- Function: woplancost(integer)

-- DROP FUNCTION woplancost(integer);

CREATE OR REPLACE FUNCTION woplancost(pwoid integer)
  RETURNS numeric AS
$BODY$
-- Copyright (c) 1999-2016 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  _pwocost NUMERIC;
  _returnVal NUMERIC;
BEGIN

SELECT  SUM(wo_lo) INTO _pwocost
FROM (
--get labor and overhead value for run time
SELECT wo_id AS wocst, 
(round(xtmfg.workCenterRunCost(wooper_wrkcnt_id, wooper_rntime, wo_qtyord), 2)) AS wo_lo
FROM wo 
JOIN xtmfg.wooper ON wooper_wo_id = wo_id
WHERE wo_id = pwoid

UNION ALL
-- Get set up  time
SELECT wo_id, 
(round(xtmfg.workCenterSetupCost(wooper_wrkcnt_id, wooper_sutime), 2)) AS wo_lo
FROM wo 
JOIN xtmfg.wooper ON wooper_wo_id = wo_id
WHERE wo_id = pwoid

UNION ALL
-- get user defined costs
SELECT  wo_id, ROUND(coalesce(itemcost_stdcost, 0) * wo_qtyord,2)
  FROM item
  JOIN itemsite ON itemsite_item_id = item_id
  JOIN wo ON itemsite_id = wo_itemsite_id
  LEFT JOIN itemcost ON item_id = itemcost_item_id
  AND itemcost_costelem_id IN (SELECT costelem_id FROM costelem WHERE NOT costelem_sys)
  AND NOT itemcost_lowlevel 
  WHERE wo_id = pwoid

  UNION ALL
--get material costs
SELECT wo_id, ROUND(womatl_qtyreq * 
CASE WHEN itemsite_costMethod = 'S' THEN stdcost(item_id)
ELSE CASE WHEN itemsite_qtyonhand = 0 THEN actcost(itemsite_id) 
ELSE itemsite_value / itemsite_qtyonhand
END END
,2) 
FROM womatl
JOIN wo ON wo_id = womatl_wo_id
JOIN itemsite ON itemsite_id = womatl_itemsite_id
JOIN item ON item_id = itemsite_item_id
WHERE womatl_wo_id = pwoid) as wopcst
JOIN wo ON wo_id = wocst
JOIN itemsite ON itemsite_id = wo_itemsite_id

GROUP BY wocst, itemsite_item_id, wo_qtyord;
            
_returnVal = _pwocost;

  RETURN _returnVal;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION woplancost(integer)
  OWNER TO admin;
