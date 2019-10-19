SET ECHO ON
-- Écrire une requête qui retourne les soumissions générées
-- seulement les datées du 2019-09-30;
-- pour le pClient { 4 };
SET ECHO ON
select pSoumission,origine,destination from tp1DemandeSoumission where pclient = 4 and datesoumission = '2019/09/30';
/
