SELECT xt.create_table('checkhead', 'public');

ALTER TABLE public.checkhead DISABLE TRIGGER ALL;

SELECT
  xt.add_column('checkhead', 'checkhead_id',             'SERIAL', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_recip_id',      'INTEGER', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_recip_type',       'TEXT', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_bankaccnt_id',  'INTEGER', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_printed',       'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_checkdate',        'DATE', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_number',        'INTEGER', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_amount',  'NUMERIC(20,2)', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_void',          'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_replaced',      'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_posted',        'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_rec',           'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_misc',          'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_expcat_id',     'INTEGER', NULL,       'public'),
  xt.add_column('checkhead', 'checkhead_for',              'TEXT', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_notes',            'TEXT', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_journalnumber', 'INTEGER', NULL,       'public'),
  xt.add_column('checkhead', 'checkhead_curr_id',       'INTEGER', 'DEFAULT basecurrid() NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_deleted',       'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_ach_batch',        'TEXT', NULL,       'public'),
  xt.add_column('checkhead', 'checkhead_curr_rate',     'NUMERIC', 'NOT NULL', 'public'),
  xt.add_column('checkhead', 'checkhead_alt_curr_rate', 'NUMERIC', NULL,       'public'),
  xt.add_column('checkhead', 'checkhead_taxzone_id',    'INTEGER', NULL,       'public'),
  xt.add_column('checkhead', 'checkhead_taxtype_id',    'INTEGER', NULL,       'public');

SELECT
  xt.add_constraint('checkhead', 'checkhead_pkey', 'PRIMARY KEY (checkhead_id)', 'public'),
  xt.add_constraint('checkhead', 'checkhead_checkhead_amount_check',
                    'CHECK (checkhead_amount > 0.0)', 'public'),
  xt.add_constraint('checkhead', 'checkhead_checkhead_recip_type_check',
                    $$CHECK (checkhead_recip_type IN ('C', 'V', 'T'))$$, 'public'),
  xt.add_constraint('checkhead','checkhead_taxzone_id_fkey',
                    'FOREIGN KEY (checkhead_taxzone_id) REFERENCES taxzone(taxzone_id)', 'public'),
  xt.add_constraint('checkhead','checkhead_taxtype_id_fkey',
                    'FOREIGN KEY (checkhead_taxtype_id) REFERENCES taxtype(taxtype_id)', 'public'),
  xt.add_constraint('checkhead', 'checkhead_checkhead_bankaccnt_id_fkey',
                    'FOREIGN KEY (checkhead_bankaccnt_id) REFERENCES bankaccnt(bankaccnt_id)', 'public'),
  xt.add_constraint('checkhead', 'checkhead_checkhead_curr_id_fkey',
                    'FOREIGN KEY (checkhead_curr_id) REFERENCES curr_symbol(curr_id)', 'public'),
  xt.add_constraint('checkhead', 'checkhead_checkhead_expcat_id_fkey',
                    'FOREIGN KEY (checkhead_expcat_id) REFERENCES expcat(expcat_id)',  'public');

ALTER TABLE public.checkhead ENABLE TRIGGER ALL;

COMMENT ON TABLE checkhead IS 'Accounts Payable Check Information';
