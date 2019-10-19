SET ECHO ON
-- Écrire une requête qui retourne le nom des tables en minuscule de mon schéma en ordre décroissant
SET ECHO ON
SELECT
  LOWER(table_name), owner
FROM
  all_tables
WHERE
  table_name LIKE 'TP1%'
ORDER BY
  owner, table_name DESC
/
