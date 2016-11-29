select xt.create_table('pkghead', 'public');

select xt.add_column('pkghead', 'pkghead_id',        'serial', 'primary key not null',   'public');
select xt.add_column('pkghead', 'pkghead_name',      'text',   'NOT NULL',               'public');
select xt.add_column('pkghead', 'pkghead_descrip',   'text',   '',                       'public');
select xt.add_column('pkghead', 'pkghead_version',   'text',   'NOT NULL',               'public');
select xt.add_column('pkghead', 'pkghead_developer', 'text',   'NOT NULL',               'public');
select xt.add_column('pkghead', 'pkghead_notes',     'text',   '',                       'public');
select xt.add_column('pkghead', 'pkghead_created', 'timestamp with time zone', '',       'public');
select xt.add_column('pkghead', 'pkghead_updated', 'timestamp with time zone', '',       'public');
select xt.add_column('pkghead', 'pkghead_indev',   'boolean',  'DEFAULT false NOT NULL', 'public');

select xt.add_constraint('pkghead', 'pkghead_pkghead_name_check', $$CHECK (pkghead_name <> '')$$, 'public');
select xt.add_constraint('pkghead', 'pkghead_pkghead_name_key',  'UNIQUE (pkghead_name)',         'public');

COMMENT ON TABLE pkghead IS 'Information about non-core Packages added to the database';
COMMENT ON COLUMN pkghead.pkghead_indev IS 'Flag indicating whether the contents of this package may be modified in-place - this package is /in dev/elopment.';

ALTER TABLE public.pkghead_pkghead_id_seq OWNER TO admin;
