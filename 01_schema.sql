SET ECHO ON
-- Script Oracle SQL*plus de creation du schema travail pratique 1 - Modélisation et Conception d'une BD
-- Version sans accents
-- Enlever les tables existantes
-- Creation des tables
SET ECHO ON
DROP TABLE tp1Client CASCADE CONSTRAINTS
/
DROP TABLE tp1DemandeSoumission CASCADE CONSTRAINTS
/
DROP TABLE tp1Requis CASCADE CONSTRAINTS
/
DROP TABLE tp1Varias CASCADE CONSTRAINTS
/
DROP TABLE tp1Route CASCADE CONSTRAINTS
/
DROP TABLE tp1FacteurPrix CASCADE CONSTRAINTS
/
DROP TABLE tp1Proposition CASCADE CONSTRAINTS
/
DROP TABLE tp1Compagnie CASCADE CONSTRAINTS
/
DROP TABLE tp1Camion CASCADE CONSTRAINTS
/
DROP TABLE tp1TypeEquipement CASCADE CONSTRAINTS
/
DROP TABLE tp1Position CASCADE CONSTRAINTS
/
DROP TABLE tp1Remorque CASCADE CONSTRAINTS
/
CREATE TABLE tp1Client
(pClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 prenomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR 	NOT NULL,
 PRIMARY KEY 	(pClient)
)
/
CREATE TABLE tp1DemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 origine 		VARCHAR(20) 	NOT NULL,
 destination 		VARCHAR(20) 	NOT NULL,
 dateSoumission 	DATE 	NOT NULL,
 pClient 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumission),
 FOREIGN KEY 	(pClient) REFERENCES tp1Client
)
/
CREATE TABLE tp1Requis
(pSoumission 		INTEGER 		NOT NULL,
 refrigerated 		INTEGER	NOT NULL,
 dock 		INTEGER 	NOT NULL,
 hazardous 	INTEGER 	NOT NULL,
 rush 		INTEGER 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Varias
(pSoumission 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 quantity 	FLOAT  	NOT NULL,
 hours 	FLOAT  	NOT NULL,
 valeur 	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Route
(pSoumission 		INTEGER 		NOT NULL,
 pRoute 		VARCHAR(30) 	NOT NULL,
 cRoute 		VARCHAR(30) 	NOT NULL,
 nLatOri 	FLOAT(8) 	NOT NULL,
 nLatDes 		FLOAT(8) 		NOT NULL,
 nLongOri 	FLOAT(8) 	NOT NULL,
 nLongDes 		FLOAT(8) 		NOT NULL,
 nDistance 		FLOAT(8) 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1FacteurPrix
(pSoumission 		INTEGER 		NOT NULL,
 prixCarburant 	FLOAT(8) 	NOT NULL,
 consommation 		FLOAT(8) 		NOT NULL,
 margeProfit		FLOAT(3) 		DEFAULT 1.18,
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Proposition
(pProposition 		INTEGER 		NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 datePickup 	DATE 	NOT NULL,
 dateDelivery 		DATE 		NOT NULL,
 estimation		FLOAT(3) 		NOT NULL,
 tCamion		VARCHAR(20) 		NOT NULL,
 PRIMARY KEY 	(pProposition),
 FOREIGN KEY 	(pSoumission) REFERENCES tp1DemandeSoumission
)
/
CREATE TABLE tp1Compagnie
(pCompagnie 		INTEGER 		NOT NULL,
 nomCompagnie 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(15) 	NOT NULL,
 nbCamion INTEGER NOT NULL,
 PRIMARY KEY 	(pCompagnie)
)
/
CREATE TABLE tp1Camion
(pCamion 		INTEGER 		NOT NULL,
 pCompagnie 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pCamion),
 FOREIGN KEY 	(pCompagnie) REFERENCES tp1Compagnie
)
/
CREATE TABLE tp1TypeEquipement
(pCamion 		INTEGER 		NOT NULL,
 pTypeEquipement INTEGER NOT NULL,
 cTypeEquipement VARCHAR(30) NOT NULL,
 nCout FLOAT(8) NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Position
(pCamion 		INTEGER 		NOT NULL,
 pPosition		VARCHAR(30) 	NOT NULL,
 cPosition 		VARCHAR(30) 	NOT NULL,
 nLat 	FLOAT(8) 	NOT NULL,
 nLong 	FLOAT(8) 	NOT NULL,
 nDisponible		INTEGER		NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
CREATE TABLE tp1Remorque
(pCamion 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 capacity	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES tp1Camion
)
/
COMMIT
/
