SET ECHO ON
-- Une requête qui retourne les attributs des entités E = { Tracteur, Camion, Equipement }
SET ECHO ON
CREATE OR REPLACE VIEW entites AS
SELECT tp1camion.tracteur, tp1camion.pcamion, tp1camion.pcompagnie,tp1camion.lenght,tp1camion.width,tp1camion.height,tp1camion.capacity,tp1typeequipement.ctypeequipement 
FROM tp1camion
FULL OUTER JOIN tp1typeequipement ON tp1camion.pcamion = tp1typeequipement.pcamion;
/
SELECT * FROM entites
/
