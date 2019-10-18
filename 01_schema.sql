SET ECHO ON
-- Script Oracle SQL*plus de creation du schema VentesPleinDeFoin 
-- Version sans accents

-- Creation des tables
SET ECHO ON
CREATE TABLE Client
(pClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 prenomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(15) 	NOT NULL,
 PRIMARY KEY 	(pClient)
)
/
CREATE TABLE DemandeSoumission
(pSoumission 		INTEGER 		NOT NULL,
 origine 		VARCHAR(20) 	NOT NULL,
 destination 		VARCHAR(20) 	NOT NULL,
 dateSoumission 	DATE 	DEFAULT GETDATE(),
 pClient 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pSoumission)
 FOREIGN KEY 	(pClient) REFERENCES Client
)
/
CREATE TABLE Requis
(pSoumission 		INTEGER 		NOT NULL,
 refrigerated 		BOOLEAN 	NOT NULL,
 dock 		BOOLEAN 	NOT NULL,
 hazardous 	BOOLEAN 	NOT NULL,
 rush 		BOOLEAN 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES DemandeSoumission
)
/
CREATE TABLE Varias
(pSoumission 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 quantity 	FLOAT  	NOT NULL,
 hours 	TIME  	NOT NULL,
 valeur 	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES DemandeSoumission
)
/
CREATE TABLE Route
(pSoumission 		INTEGER 		NOT NULL,
 pRoute 		VARCHAR(30) 	NOT NULL,
 cRoute 		VARCHAR(30) 	NOT NULL,
 nLatOri 	FLOAT(8,5) 	NOT NULL,
 nLatDes 		FLOAT(8,5) 		NOT NULL,
 nLongOri 	FLOAT(8,5) 	NOT NULL,
 nLongDes 		FLOAT(8,5) 		NOT NULL,
 nDistance 		FLOAT(8,5) 		NOT NULL,
 FOREIGN KEY 	(pSoumission) REFERENCES DemandeSoumission
)
/
CREATE TABLE FacteurPrix
(pSoumission 		INTEGER 		NOT NULL,
 prixCarburant 	FLOAT(8,5) 	NOT NULL,
 consommation 		FLOAT(8,5) 		NOT NULL,
 margeProfit		FLOAT(3,2) 		DEFAULT 1.18,
 FOREIGN KEY 	(pSoumission) REFERENCES DemandeSoumission
)
/
CREATE TABLE Proposition
(pProposition 		INTEGER 		NOT NULL,
 pSoumission 		INTEGER 		NOT NULL,
 datePickup 	DATE 	NOT NULL,
 dateDelivery 		DATE 		NOT NULL,
 estimation		FLOAT(3,2) 		NOT NULL,
 tCamion		VARCHAR(20) 		NOT NULL,
 PRIMARY KEY 	(pProposition)
 FOREIGN KEY 	(pSoumission) REFERENCES DemandeSoumission
)
/
CREATE TABLE Compagnie
(pCompagnie 		INTEGER 		NOT NULL,
 nomCompagnie 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 email 	VARCHAR(15) 	NOT NULL,
 nbCamion INTEGER NOT NULL,
 PRIMARY KEY 	(pCompagnie)
)
/
CREATE TABLE Camion
(pCamion 		INTEGER 		NOT NULL,
 pCompagnie 		INTEGER 		NOT NULL,
 PRIMARY KEY 	(pCamion)
 FOREIGN KEY 	(pCompagnie) REFERENCES Compagnie
)
/
CREATE TABLE TypeEquipement
(pCamion 		INTEGER 		NOT NULL,
 pTypeEquipement ENUM('Drybox', 'Flatbed'),
 cTypeEquipement VARCHAR(30) NOT NULL,
 nCout FLOAT(8,2) NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES Camion
)
/
CREATE TABLE Position
(pCamion 		INTEGER 		NOT NULL,
 pPosition		VARCHAR(30) 	NOT NULL,
 cPosition 		VARCHAR(30) 	NOT NULL,
 nLat 	FLOAT(8,5) 	NOT NULL,
 nLong 	FLOAT(8,5) 	NOT NULL,
 nDisponible		BOOLEAN		NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES Camion
)
/
CREATE TABLE Remorque
(pCamion 		INTEGER 		NOT NULL,
 lenght		FLOAT 	NOT NULL,
 width 		FLOAT  	NOT NULL,
 height 	FLOAT  	NOT NULL,
 capacity	FLOAT  	NOT NULL,
 FOREIGN KEY 	(pCamion) REFERENCES Camion
)
/
COMMIT
/
