SET ECHO ON
-- Écrire une requête qui liste les camions qui sont présentement en voyage
SET ECHO ON
SELECT tp1Compagnie.nomcompagnie, tp1camion.pcamion, tp1position.cposition, tp1position.ndisponible 
FROM ((tp1Compagnie
INNER JOIN tp1camion ON tp1Compagnie.pcompagnie = tp1camion.pcompagnie)
INNER JOIN tp1position ON tp1camion.pcamion = tp1position.pcamion)
WHERE tp1position.ndisponible = 0
/
