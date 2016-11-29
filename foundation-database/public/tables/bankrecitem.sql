select xt.add_column('bankrecitem','bankrecitem_effdate', 'DATE', NULL, 'public');

-- #28170 Create foreign key between bankrec tables.
-- First clean out possible orphaned records

DELETE FROM bankrecitem WHERE bankrecitem_id IN 
(SELECT bankrecitem_id
  FROM bankrecitem LEFT JOIN bankrec ON bankrec_id = bankrecitem_bankrec_id
  WHERE bankrec_id IS NULL);

select xt.add_constraint('bankrecitem', 'bankrecitem_bankrec_id_fkey', 
       'FOREIGN KEY (bankrecitem_bankrec_id) REFERENCES public.bankrec (bankrec_id)
        ON UPDATE NO ACTION ON DELETE CASCADE;', 'public');

