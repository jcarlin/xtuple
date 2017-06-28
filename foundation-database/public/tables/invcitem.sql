SELECT xt.create_table('invcitem', 'public');

ALTER TABLE public.invcitem DISABLE TRIGGER ALL;

SELECT
  xt.add_column('invcitem', 'invcitem_id',               'SERIAL', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_invchead_id',     'INTEGER', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_linenumber',      'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_item_id',         'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_warehous_id',     'INTEGER', 'DEFAULT (-1)', 'public'),
  xt.add_column('invcitem', 'invcitem_custpn',             'TEXT', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_number',             'TEXT', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_descrip',            'TEXT', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_ordered',   'NUMERIC(20,6)', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_billed',    'NUMERIC(20,6)', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_custprice', 'NUMERIC(20,4)', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_price',     'NUMERIC(20,4)', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_notes',              'TEXT', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_salescat_id',     'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_taxtype_id',      'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_qty_uom_id',      'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_qty_invuomratio',   'NUMERIC(20,10)', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_price_uom_id',             'INTEGER', NULL,       'public'),
  xt.add_column('invcitem', 'invcitem_price_invuomratio', 'NUMERIC(20,10)', 'NOT NULL', 'public'),
  xt.add_column('invcitem', 'invcitem_coitem_id',       'INTEGER', NULL,            'public'),
  xt.add_column('invcitem', 'invcitem_updateinv',       'BOOLEAN', 'DEFAULT false', 'public'),
  xt.add_column('invcitem', 'invcitem_rev_accnt_id',    'INTEGER', NULL,            'public'),
  xt.add_column('invcitem', 'invcitem_listprice', 'NUMERIC(16,4)', NULL,            'public'),
  xt.add_column('invcitem', 'invcitem_subnumber', 'INTEGER', 'NOT NULL DEFAULT 0', 'public');

ALTER TABLE invcitem DROP CONSTRAINT IF EXISTS invcitem_invchead_id_linenumber_unique;

SELECT
  xt.add_constraint('invcitem', 'invcitem_pkey', 'PRIMARY KEY (invcitem_id)', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invchead_id_linenumber_subnumber_unique',
                'UNIQUE (invcitem_invchead_id, invcitem_linenumber, invcitem_subnumber)', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invchead_id_fkey',
                    'FOREIGN KEY (invcitem_invchead_id) REFERENCES invchead(invchead_id)
                     ON UPDATE CASCADE ON DELETE CASCADE', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invcitem_price_uom_id_fkey',
                    'FOREIGN KEY (invcitem_price_uom_id) REFERENCES uom(uom_id)', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invcitem_qty_uom_id_fkey',
                    'FOREIGN KEY (invcitem_qty_uom_id) REFERENCES uom(uom_id)', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invcitem_rev_accnt_id_fkey',
                    'FOREIGN KEY (invcitem_rev_accnt_id) REFERENCES accnt(accnt_id)', 'public'),
  xt.add_constraint('invcitem', 'invcitem_invcitem_taxtype_id_fkey',
                    'FOREIGN KEY (invcitem_taxtype_id) REFERENCES taxtype(taxtype_id)', 'public');

ALTER TABLE public.invcitem ENABLE TRIGGER ALL;

COMMENT ON TABLE invcitem IS 'Invoice Line Item information';

COMMENT ON COLUMN public.invcitem.invcitem_listprice IS 'List price of Item.';
