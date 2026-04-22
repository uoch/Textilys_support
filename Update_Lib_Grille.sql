
-- SELECT : Récupérer le libellé d'une catégorie de taille


SELECT cat_lib 
FROM cat 
WHERE cat_tie_cod = '0115' 
  AND cat_cod = '70-95D';
  
--   Actuellement, '70-95D' affiche 'T65D-95D' (incorrect car T65
--   n'appartient pas à la grille 70-95D)

--   Après correction, affichera '70D-95D' (correct)
UPDATE cat 
SET cat_lib = '70D-95D' 
WHERE cat_tie_cod = '0115' 
  AND cat_cod = '70-95D'


