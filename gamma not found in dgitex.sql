UPDATE trc_dtx t
SET t.dtx_sent = 0
WHERE t.dtx_table = 'TGL'
  AND EXISTS (
    SELECT 1
    FROM tgl tg
    WHERE tg.tgl_nomgamme = t.dtx_pk2
      AND tg.tgl_nomgamme = '3308'
      AND tg.tgl_tie_cod = t.dtx_pk1
      AND tg.tgl_tie_cod = '0137'
  );

-- puit excute update TGL dans le serveur 10.100