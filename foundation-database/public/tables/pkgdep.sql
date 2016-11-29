select xt.create_table('pkgdep', 'public');

select xt.add_column('pkgdep', 'pkgdep_id',                'serial',  'primary key NOT NULL',                    'public');
select xt.add_column('pkgdep', 'pkgdep_pkghead_id',        'integer', 'NOT NULL references pkghead(pkghead_id)', 'public');
select xt.add_column('pkgdep', 'pkgdep_parent_pkghead_id', 'integer', 'NOT NULL references pkghead(pkghead_id)', 'public');

COMMENT ON TABLE pkgdep IS 'Package Dependencies list describing which packages are dependent on which other packages.';

COMMENT ON COLUMN pkgdep.pkgdep_pkghead_id IS 'This is the internal ID of a package which requires at least one other package to be installed first to operate successfully';
COMMENT ON COLUMN pkgdep.pkgdep_parent_pkghead_id IS 'This is the internal ID of a package which must be installed for the package pointed to by pkgdep_pkghead_id to operate successfully.';

REVOKE ALL ON SEQUENCE pkgdep_pkgdep_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE pkgdep_pkgdep_id_seq FROM admin;
GRANT ALL ON SEQUENCE pkgdep_pkgdep_id_seq TO admin;
GRANT ALL ON SEQUENCE pkgdep_pkgdep_id_seq TO xtrole;





