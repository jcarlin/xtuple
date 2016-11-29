select xt.add_column('item', 'item_created',      'TIMESTAMP WITH TIME ZONE', NULL, 'public');
select xt.add_column('item', 'item_lastupdated',  'TIMESTAMP WITH TIME ZONE', NULL, 'public');


-- Clean up UPC code prior to making UNIQUE
UPDATE item SET item_upccode = NULL WHERE (item_upccode = '');
