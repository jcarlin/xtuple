select xt.add_column('bankaccnt','bankaccnt_ach_prefix', 'TEXT', '', 'public');
select xt.add_column('bankaccnt','bankaccnt_prnt_check', 'BOOLEAN', 'NOT NULL DEFAULT TRUE', 'public');
