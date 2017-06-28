SELECT xt.create_table('coitem', 'public');

ALTER TABLE public.coitem DISABLE TRIGGER ALL;

SELECT
  xt.add_column('coitem', 'coitem_id',                               'SERIAL', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_cohead_id',                       'INTEGER', NULL,        'public'),
  xt.add_column('coitem', 'coitem_linenumber',                      'INTEGER', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_itemsite_id',                     'INTEGER', NULL,        'public'),
  xt.add_column('coitem', 'coitem_status',                     'CHARACTER(1)', NULL,        'public'),
  xt.add_column('coitem', 'coitem_scheddate',                          'DATE', NULL,        'public'),
  xt.add_column('coitem', 'coitem_promdate',                           'DATE', NULL,        'public'),
  xt.add_column('coitem', 'coitem_qtyord',                    'NUMERIC(18,6)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_unitcost',                  'NUMERIC(16,6)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_price',                     'NUMERIC(16,4)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_custprice',                 'NUMERIC(16,4)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_qtyshipped',                'NUMERIC(18,6)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_order_id',                        'INTEGER', NULL,        'public'),
  xt.add_column('coitem', 'coitem_memo',                               'TEXT', NULL,        'public'),
  xt.add_column('coitem', 'coitem_imported',                        'BOOLEAN', 'DEFAULT false', 'public'),
  xt.add_column('coitem', 'coitem_qtyreturned',               'NUMERIC(18,6)', NULL,        'public'),
  xt.add_column('coitem', 'coitem_closedate',      'TIMESTAMP WITH TIME ZONE', NULL,        'public'),
  xt.add_column('coitem', 'coitem_custpn',                             'TEXT', NULL,        'public'),
  xt.add_column('coitem', 'coitem_order_type',                 'CHARACTER(1)', NULL,        'public'),
  xt.add_column('coitem', 'coitem_close_username',                     'TEXT', NULL,        'public'),
  xt.add_column('coitem', 'coitem_substitute_item_id',              'INTEGER', NULL,        'public'),
  xt.add_column('coitem', 'coitem_creator',                            'TEXT', 'DEFAULT geteffectivextuser()', 'public'),
  xt.add_column('coitem', 'coitem_prcost',                    'NUMERIC(16,6)', NULL,        'public'),
  xt.add_column('coitem', 'coitem_qty_uom_id',                      'INTEGER', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_qty_invuomratio',          'NUMERIC(20,10)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_price_uom_id',                    'INTEGER', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_price_invuomratio',        'NUMERIC(20,10)', 'NOT NULL',  'public'),
  xt.add_column('coitem', 'coitem_warranty',           'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('coitem', 'coitem_cos_accnt_id',       'INTEGER', NULL,                     'public'),
  xt.add_column('coitem', 'coitem_qtyreserved',  'NUMERIC(18,6)', 'DEFAULT 0.0 NOT NULL',   'public'),
  xt.add_column('coitem', 'coitem_subnumber',          'INTEGER', 'DEFAULT 0 NOT NULL',     'public'),
  xt.add_column('coitem', 'coitem_firm',               'BOOLEAN', 'DEFAULT false NOT NULL', 'public'),
  xt.add_column('coitem', 'coitem_taxtype_id',         'INTEGER', NULL,                     'public'),
  xt.add_column('coitem', 'coitem_rev_accnt_id',       'INTEGER', NULL,                     'public'),
  xt.add_column('coitem', 'coitem_pricemode',     'CHARACTER(1)', $$DEFAULT 'D' NOT NULL$$, 'public'),
  xt.add_column('coitem', 'coitem_qtyreserved_uom_id', 'INTEGER', NULL,                     'public'),
  xt.add_column('coitem', 'coitem_listprice',    'NUMERIC(16,4)', NULL,                     'public'),
  xt.add_column('coitem', 'coitem_dropship',           'BOOLEAN', 'DEFAULT FALSE',          'public'),
  xt.add_column('coitem', 'coitem_lastupdated', 'TIMESTAMP WITHOUT TIME ZONE', $$DEFAULT ('now'::text)::timestamp(6) with time zone NOT NULL$$, 'public'),
  xt.add_column('coitem', 'coitem_created',     'TIMESTAMP WITHOUT TIME ZONE', $$DEFAULT ('now'::text)::timestamp(6) with time zone$$,          'public');

SELECT
  xt.add_constraint('coitem', 'coitem_pkey', 'PRIMARY KEY (coitem_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_cohead_id_linenumber_unique',
                    'UNIQUE (coitem_cohead_id, coitem_linenumber, coitem_subnumber)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_cohead_id_fkey',
                    'FOREIGN KEY (coitem_cohead_id) REFERENCES cohead(cohead_id) ON DELETE CASCADE', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_cos_accnt_id_fkey',
                    'FOREIGN KEY (coitem_cos_accnt_id) REFERENCES accnt(accnt_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_itemsite_id_fkey',
                    'FOREIGN KEY (coitem_itemsite_id) REFERENCES itemsite(itemsite_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_price_uom_id_fkey',
                    'FOREIGN KEY (coitem_price_uom_id) REFERENCES uom(uom_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_qty_uom_id_fkey',
                    'FOREIGN KEY (coitem_qty_uom_id) REFERENCES uom(uom_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_rev_accnt_id_fkey',
                    'FOREIGN KEY (coitem_rev_accnt_id) REFERENCES accnt(accnt_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_substitute_item_id_fkey',
                    'FOREIGN KEY (coitem_substitute_item_id) REFERENCES item(item_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_taxtype_id_fkey',
                    'FOREIGN KEY (coitem_taxtype_id) REFERENCES taxtype(taxtype_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_qtyreserved_uom_id_fkey',
                    'foreign key (coitem_qtyreserved_uom_id) references uom(uom_id)', 'public'),
  xt.add_constraint('coitem', 'coitem_coitem_status_check',
                    $$CHECK (coitem_status IN ('O', 'C', 'X'))$$, 'public'),
  xt.add_constraint('coitem', 'valid_coitem_pricemode',
                    $$CHECK (coitem_pricemode IN ('D', 'M'))$$, 'public');

ALTER TABLE public.coitem ENABLE TRIGGER ALL;

COMMENT ON TABLE coitem IS 'Sales Order Line Item information';

COMMENT ON COLUMN coitem.coitem_pricemode IS 'Pricing mode for sales order item.  Valid values are D-discount, and M-markup';
COMMENT ON COLUMN public.coitem.coitem_qtyreserved_uom_id IS 'UOM of qtyreserved (same as Item Inv UOM).';
comment on column public.coitem.coitem_listprice is 'List price of Item.';
