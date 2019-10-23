   # Travail pratique 1

   ## Description

   Modélisation d'un schéma afin de créer une base de données pour une compagnie de transport avec plusieurs camions.

   INF3080 A2019 UQAM

   ## Auteur

   Remi Nanthavong NANS24118900

   ## Fonctionnement

   1 - Charger le schema dans sqlplus (@01_schema.sql)
   
   2 - Charger les entres dans sqlplus (@02_charger.sql)
   
   3 -  Exemple a) Pour afficher tous les demande de soumission fait par les clients en affichant seulement Origine et Destination
                  
                    SELECT pclient,origine,destination FROM tp1DemandeSoumission;
                    PCLIENT    ORIGINE              DESTINATION
                    ---------- -------------------- --------------------
                    1          Toronto              Ottawa
                    1          Calgary              Montreal
                    2          Vancouver            Ottawa
                    3          Quebec               Toronto
                    4          Montreal             Toronto
                    
        Exemple b) Pour afficher liste les camions qui sont presentement en voyage
                  SELECT tp1Compagnie.nomcompagnie, tp1camion.pcamion, tp1position.cposition, tp1position.ndisponible 
                  FROM ((tp1Compagnie
                  INNER JOIN tp1camion ON tp1Compagnie.pcompagnie = tp1camion.pcompagnie)
                  INNER JOIN tp1position ON tp1camion.pcamion = tp1position.pcamion)
                  WHERE tp1position.ndisponible = 0
                  
                  ou
                  
                  @04a_query.sql

               NOMCOMPAGNIE            PCAMION CPOSITION                      NDISPONIBLE
               -------------------- ---------- ------------------------------ -----------
                  Earenam                       7 AWAY                                     0
                  Senoine                       8 AWAY                                     0


   ## Contenu du projet

   00_modele.pdf : un modèle entité-association et un modèle entité-association relationnel normalisé.
   
   01_schema.sql : Un script qui crée la BD.
   
   02_charger.sql : Un script qui remplie la BD.
   
   03_tester.sql : Des requêtes qui test la qualité BD.
   
   04a_query.sql : Une requête qui retourne les soumissions générées par le client #4 du 2019-09-30.
   
   04b_query.sql : Une requête qui liste les camions qui sont présentement en voyage.
   
   04c_query.sql : Une requête qui retourne le nom des tables en minuscule du schéma en ordre décroissant
   
   04d_query.sql : Une requête qui retourne les attributs des entités E = { Tracteur, Camion, Equipement }
   
   05_algebre-tp1.pdf : L'algèbre relationnelle des requetes 04a et 04b

   ## Références

  https://www.w3schools.com/sql/
  
  https://www.oracletutorial.com/oracle-basics/

   ## Statut

   Le projet est complété.
   
   ## Auto-évaluation de votre travail
   
   J'évalue mon livrable à 10 points / 15
