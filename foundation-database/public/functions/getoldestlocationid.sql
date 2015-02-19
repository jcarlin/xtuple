
CREATE OR REPLACE FUNCTION getOldestLocationId(INTEGER) RETURNS TEXT STABLE AS '
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  pItemsiteid ALIAS FOR $1;
  _locId TEXT;
  
BEGIN

  SELECT itemloc_id INTO _locId
  FROM itemloc
    LEFT JOIN lsdetail ON itemloc_ls_id = lsdetail_ls_id
  WHERE (itemloc_itemsite_id = pItemSiteId)
  ORDER BY itemloc_expiration, lsdetail_created
  LIMIT 1;

  RETURN _locId;

END;
'LANGUAGE 'plpgsql';

