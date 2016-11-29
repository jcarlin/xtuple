select xt.create_table('recur', 'public');

select xt.add_column('recur','recur_id', 'SERIAL', 'PRIMARY KEY', 'public');
select xt.add_column('recur','recur_parent_id', 'INTEGER', 'NOT NULL', 'public');
select xt.add_column('recur','recur_parent_type', 'TEXT', 'NOT NULL', 'public');
select xt.add_column('recur','recur_period', 'TEXT', 'NOT NULL', 'public');
select xt.add_column('recur','recur_freq', 'INTEGER', 'DEFAULT 1 NOT NULL', 'public');
select xt.add_column('recur','recur_start', 'TIMESTAMP WITH TIME ZONE', 'DEFAULT now()', 'public');
select xt.add_column('recur','recur_end', 'TIMESTAMP WITH TIME ZONE', '', 'public');
select xt.add_column('recur','recur_max', 'INTEGER', '', 'public');
select xt.add_column('recur','recur_data', 'TEXT', '', 'public');
select xt.add_column('recur','recur_style', 'TEXT', 'DEFAULT ''KeepNone'' NOT NULL', 'public');

select xt.add_constraint('recur', 'recur_recur_period_check', 'CHECK ((recur_period = ANY (ARRAY[''m''::text, ''H''::text, ''D''::text, ''W''::text, ''M''::text, ''Y''::text, ''C''::text])))', 'public');

ALTER TABLE public.recur OWNER TO admin;

COMMENT ON TABLE recur IS 'Track recurring events and objects.';
COMMENT ON COLUMN recur.recur_id IS 'Internal ID of this recurrence record.';
COMMENT ON COLUMN recur.recur_parent_id IS 'The internal ID of the event/object that recurs.';
COMMENT ON COLUMN recur.recur_parent_type IS 'The table in which the parent event or object is stored.';
COMMENT ON COLUMN recur.recur_period IS 'With recur_freq, how often this event recurs. Values are "m" for every minute, "H" for every hour, "D" for daily, "W" for weekly, "M" for monthly, "Y" for yearly, and "C" for customized or complex.';
COMMENT ON COLUMN recur.recur_freq IS 'With recur_period, how often this event recurs. Values are integers counts of recur_periods. For example, if recur_freq = 2 and recur_period = w then the event recurs every 2 weeks.';
COMMENT ON COLUMN recur.recur_start IS 'The first date/time when the event should occur.';
COMMENT ON COLUMN recur.recur_end IS 'The last date/time when the event should occur. NULL means there is no end date/time and the event should recur forever.';
COMMENT ON COLUMN recur.recur_max IS 'The maximum number of recurrence events to create at one time. If this is NULL then when new events are created, a system-wide default will limit the number.';
COMMENT ON COLUMN recur.recur_data IS 'Not yet used and format still undetermined. Additional data to describe how to apply the period and frequency, particularly when period = "C".';

select xt.add_constraint('recur', 'recur_recur_parent_id_key', 'foreign key (recur_parent_id) references recur(recur_id)', 'public');

REVOKE ALL ON TABLE recur FROM PUBLIC;
REVOKE ALL ON TABLE recur FROM admin;
GRANT ALL ON TABLE recur TO admin;
GRANT ALL ON TABLE recur TO xtrole;
