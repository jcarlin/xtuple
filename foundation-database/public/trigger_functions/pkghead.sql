DROP TRIGGER IF EXISTS pkgheadbeforetrigger       ON pkghead; -- legacy
DROP TRIGGER IF EXISTS pkgheadbeforedeletetrigger ON pkghead;
DROP TRIGGER IF EXISTS pkgheadbeforeupserttrigger ON pkghead;

CREATE OR REPLACE FUNCTION _pkgheadbeforeupserttrigger() RETURNS "trigger" AS $$
-- Copyright (c) 1999-2016 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
  BEGIN
    IF (TG_OP = 'UPDATE') THEN
      NEW.pkghead_created := OLD.pkghead_created;
      NEW.pkghead_updated := CURRENT_TIMESTAMP;

    ELSIF (TG_OP = 'INSERT') THEN
      NEW.pkghead_created := CURRENT_TIMESTAMP;
      NEW.pkghead_updated := NEW.pkghead_created;
    END IF;

    IF (NEW.pkghead_indev AND NOT userCanCreateUsers(getEffectiveXtUser())) THEN
      NEW.pkghead_indev = FALSE;
    END IF;

    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pkgheadbeforeupserttrigger BEFORE INSERT OR UPDATE ON pkghead
  FOR EACH ROW EXECUTE PROCEDURE _pkgheadbeforeupserttrigger();

CREATE OR REPLACE FUNCTION _pkgheadbeforedeletetrigger() RETURNS "trigger" AS $$
-- Copyright (c) 1999-2016 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
  BEGIN
    DELETE FROM pkgdep WHERE pkgdep_pkghead_id=OLD.pkghead_id;
    EXECUTE format('DROP SCHEMA %I CASCADE;', OLD.pkghead_name);
    RETURN OLD;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pkgheadbeforedeletetrigger BEFORE DELETE ON pkghead
  FOR EACH ROW EXECUTE PROCEDURE _pkgheadbeforedeletetrigger();
