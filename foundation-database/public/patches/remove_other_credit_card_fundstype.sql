DELETE FROM fundstype
WHERE fundstype_code= 'R';

UPDATE cashrcpt SET cashrcpt_fundstype = 'O'
WHERE cashrcpt_fundstype = 'R';

UPDATE arapply SET arapply_fundstype = 'O'
WHERE arapply_fundstype = 'R';
