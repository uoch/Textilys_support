--- udate PIP_QTE_LOF
UPDATE PIP set PIP_QTE_LOF = PIP_QTE_INI
WHERE PIP_OFD = 'numero_of';
commit;

-- update  -- pat_tip
UPDATE PAT_TIP pt
SET pt.PAT_TIP_QTE_PAQ =
(
    SELECT p.PIP_QTE_INI
    FROM TGP t
    JOIN PIP p
      ON p.PIP_NUM = t.TGP_PIP_NUM
    WHERE t.TGP_NUM_SEQ = pt.PAT_TIP_NUM_SEQ
      AND p.PIP_OFD = 'numero_of'
)
WHERE pt.PAT_TIP_QTE_PAQ IS NULL
  AND EXISTS
(
    SELECT 1
    FROM TGP t
    JOIN PIP p
      ON p.PIP_NUM = t.TGP_PIP_NUM
    WHERE t.TGP_NUM_SEQ = pt.PAT_TIP_NUM_SEQ
      AND p.PIP_OFD = 'numero_of'
);

commit ; 
