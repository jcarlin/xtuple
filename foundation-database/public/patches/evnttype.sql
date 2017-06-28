DO $$
DECLARE
  _eventType TEXT[];
BEGIN
  _eventtype = ARRAY[ 'W/O', 'PostProductionDistributionWarning',
                      'Post Production was called with a lot/serial- or location-controlled item but there was no distribution detail to post'
                    ];
  FOR _i IN 1..array_length(_eventtype, 1) BY 3 LOOP
    INSERT INTO evnttype (evnttype_module, evnttype_name,      evnttype_descrip)
                   SELECT _eventtype[_i],  _eventtype[_i + 1], _eventtype[_i + 2]
                    WHERE NOT EXISTS(SELECT 1 FROM evnttype
                                      WHERE evnttype_name = _eventtype[_i + 1]);
  END LOOP;
END$$ LANGUAGE plpgsql;
