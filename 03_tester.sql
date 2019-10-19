SET ECHO ON
-- Script Oracle SQL*plus de creation du schema travail pratique 1 - Modélisation et Conception d'une BD
-- 
-- Test de la BD
-- 
SET ECHO ON
DROP TABLE tp1Client CASCADE CONSTRAINTS
/
CREATE TABLE tp1TestClient
(pClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 prenomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(50) 	NOT NULL,
 PRIMARY KEY 	(pClient)
)
/
SET ECHO ON
-- 
-- Devrait fonctionner
-- 
INSERT INTO tp1TestClient
 	VALUES(1,'Luc','Samson','(999)999-9999','luc.samson@email.ca')
/
SET ECHO ON
-- 
-- Devrait pas fonctionner car noTelephone depasse la contrainte
-- 
INSERT INTO tp1TestClient
 	VALUES(2,'Luc','Samson','(999)999-9999999999','luc.samson@email.ca')
/
COMMIT
/
