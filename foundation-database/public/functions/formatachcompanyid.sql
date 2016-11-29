CREATE OR REPLACE FUNCTION formatACHCompanyId(pbankaccntid INTEGER) RETURNS TEXT AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  _prefix TEXT;

BEGIN
  SELECT bankaccnt_ach_prefix INTO _prefix
  FROM bankaccnt
  WHERE bankaccnt_id=pbankaccntid;

  RETURN CASE WHEN _prefix IS NOT NULL THEN _prefix
              WHEN fetchMetricText('ACHCompanyIdType') = 'D' THEN '3'
              WHEN fetchMetricText('ACHCompanyIdType') = 'E' THEN '1'
              WHEN fetchMetricText('ACHCompanyIdType') = 'O' THEN '9'
         END ||
         CASE WHEN fetchMetricText('ACHCompanyIdType') = 'D' OR
                   fetchMetricText('ACHCompanyIdType') = 'E' THEN
                 REPLACE(fetchMetricText('ACHCompanyId'), '-', '')
              ELSE fetchMetricText('ACHCompanyId')
         END;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION formatACHCompanyId() RETURNS TEXT AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
BEGIN
  RETURN CASE WHEN fetchMetricText('ACHCompanyIdType') = 'D' THEN '3'
              WHEN fetchMetricText('ACHCompanyIdType') = 'E' THEN '1'
              WHEN fetchMetricText('ACHCompanyIdType') = 'O' THEN '9'
         END ||
         CASE WHEN fetchMetricText('ACHCompanyIdType') = 'D' OR
                   fetchMetricText('ACHCompanyIdType') = 'E' THEN
                 REPLACE(fetchMetricText('ACHCompanyId'), '-', '')
              ELSE fetchMetricText('ACHCompanyId')
         END;
END;
$$
LANGUAGE 'plpgsql';
