SET ECHO ON
-- Script Oracle SQL*plus de creation du schema travail pratique 1 - Modélisation et Conception d'une BD
-- 
-- Test de la BD
-- 
SET ECHO ON
DROP TABLE tp1Client CASCADE CONSTRAINTS
/
DROP TABLE tp1TestDemandeSoumission CASCADE CONSTRAINTS
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
CREATE TABLE tp1TestDemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 origine 		VARCHAR(20) 	NOT NULL,
 destination 		VARCHAR(20) 	NOT NULL,
 dateSoumission 	DATE 	NOT NULL,
 refrigerated 		INTEGER	NOT NULL,
 dock 		INTEGER 	NOT NULL,
 hazardous 	INTEGER 	NOT NULL,
 rush 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 quantity 	INTEGER  	NOT NULL,
 hours 	FLOAT  	NOT NULL,
 valeur 	INTEGER  	NOT NULL,
 pClient 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumission),
 FOREIGN KEY 	(pClient) REFERENCES tp1Client
)
/
-- 
-- Devrait fonctionner
-- 
INSERT INTO tp1TestDemandeSoumission
 	VALUES(000001,'Toronto','Ottawa','2019/10/18',0,0,0,0,6.0,3.0,7.0,1,1.0,200.00,1)
/
-- 
-- Devrait pas fonctionner car refrigerated doit etre en format INT non String
-- 
INSERT INTO tp1TestDemandeSoumission
 	VALUES(000002,'Toronto','Ottawa','2019/10/18','Oui',0,0,0,6.0,3.0,7.0,1,1.0,200.00,1)
/
COMMIT
/
