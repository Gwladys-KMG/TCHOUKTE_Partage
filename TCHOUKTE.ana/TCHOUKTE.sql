-- Script généré par WINDEV le 31/03/2021 10:35:53
-- Tables de l'analyse TCHOUKTE.wda
-- pour SQL générique (ANSI 92)

-- Création de la table Bilan_Seance
CREATE TABLE "Bilan_Seance" (
    "IDBilan_Seance" NUMERIC(19,0)  PRIMARY KEY ,
    "Date_Seance" DATE ,
    "Entrée" NUMERIC(24,6) ,
    "Sorties" NUMERIC(24,6) ,
    "Solde" NUMERIC(24,6) ,
    "IDMembre" NUMERIC(19,0) );
CREATE INDEX "WDIDX_Bilan_Seance_IDMembre" ON "Bilan_Seance" ("IDMembre");

-- Création de la table Bilan_Tontine
CREATE TABLE "Bilan_Tontine" (
    "IDBilan_Tontine" NUMERIC(19,0)  PRIMARY KEY ,
    "Nom_Tontine" VARCHAR(50) ,
    "Montant_cautisé" NUMERIC(24,6) ,
    "Montant_Distribué" NUMERIC(24,6) ,
    "Retour_En_Caisse" NUMERIC(24,6) ,
    "Retrait_En_Caisse" NUMERIC(24,6) ,
    "Solde" NUMERIC(24,6) ,
    "Beneficiaires" SMALLINT ,
    "Nombre_De_Beneficaires" VARCHAR(50) ,
    "IDTontine" NUMERIC(19,0) );
CREATE INDEX "WDIDX_Bilan_Tontine_IDTontine" ON "Bilan_Tontine" ("IDTontine");

-- Création de la table Epargne
CREATE TABLE "Epargne" (
    "IDEpargne" NUMERIC(19,0)  PRIMARY KEY ,
    "Niom_Membre" VARCHAR(50) ,
    "Montant_Versé" NUMERIC(24,6) ,
    "Date_Versement" DATE ,
    "Solde" NUMERIC(24,6) ,
    "IDMembre" NUMERIC(19,0)  UNIQUE );

-- Création de la table Membre
CREATE TABLE "Membre" (
    "IDMembre" NUMERIC(19,0)  PRIMARY KEY ,
    "Civilite" SMALLINT ,
    "Nom" VARCHAR(50) ,
    "Prenom" VARCHAR(50) ,
    "Adresse" VARCHAR(50) ,
    "Télephone" INTEGER ,
    "Email" VARCHAR(50) );

-- Création de la table Membre_Tontine
CREATE TABLE "Tontine_Membre" (
    "IDMembre" NUMERIC(19,0)  NOT NULL ,
    "IDTontine" NUMERIC(19,0)  NOT NULL );
CREATE INDEX "WDIDX_Membre_Tontine_IDMembre" ON "Tontine_Membre" ("IDMembre");
CREATE INDEX "WDIDX_Membre_Tontine_IDTontine" ON "Tontine_Membre" ("IDTontine");
CREATE INDEX "WDIDX_Membre_Tontine_IDTontine_IDMembre" ON "Tontine_Membre" ("IDTontine","IDMembre");

-- Création de la table Prets
CREATE TABLE "Prets" (
    "IDPrets" NUMERIC(19,0)  PRIMARY KEY ,
    "Nom_Membre" VARCHAR(50) ,
    "Montant_Prets" NUMERIC(24,6) ,
    "Interets" INTEGER ,
    "Net_A_Rembourser" NUMERIC(24,6) ,
    "Date_Remboursement" DATE ,
    "IDMembre" NUMERIC(19,0) );
CREATE INDEX "WDIDX_Prets_IDMembre" ON "Prets" ("IDMembre");

-- Création de la table Reboursement
CREATE TABLE "Reboursement" (
    "IDReboursement" NUMERIC(19,0)  PRIMARY KEY ,
    "Nom_Membre" VARCHAR(50) ,
    "Montant_Versé" NUMERIC(24,6) ,
    "Reste" NUMERIC(24,6) ,
    "Observations" SMALLINT ,
    "IDMembre" NUMERIC(19,0) );
CREATE INDEX "WDIDX_Reboursement_IDMembre" ON "Reboursement" ("IDMembre");

-- Création de la table Tontine
CREATE TABLE "Tontine" (
    "IDTontine" NUMERIC(19,0)  PRIMARY KEY ,
    "Nom_Tontine" VARCHAR(50) ,
    "Type" SMALLINT ,
    "Devise" SMALLINT ,
    "Montant" NUMERIC(24,6) ,
    "Categorie" SMALLINT ,
    "Taux_Interets_Prets" INTEGER ,
    "Prix_Minimal_Vente" NUMERIC(24,6) ,
    "date_Debut" DATE ,
    "Nombre_Echeance" INTEGER ,
    "Date_Fin" DATE );
-- Contraintes d'intégrité
ALTER TABLE "Prets" ADD FOREIGN KEY ("IDMembre") REFERENCES "Membre" ("IDMembre");
ALTER TABLE "Reboursement" ADD FOREIGN KEY ("IDMembre") REFERENCES "Membre" ("IDMembre");
ALTER TABLE "Tontine_Membre" ADD FOREIGN KEY ("IDTontine") REFERENCES "Tontine" ("IDTontine");
ALTER TABLE "Tontine_Membre" ADD FOREIGN KEY ("IDMembre") REFERENCES "Membre" ("IDMembre");
ALTER TABLE "Epargne" ADD FOREIGN KEY ("IDMembre") REFERENCES "Membre" ("IDMembre");
ALTER TABLE "Bilan_Tontine" ADD FOREIGN KEY ("IDTontine") REFERENCES "Tontine" ("IDTontine");
ALTER TABLE "Bilan_Seance" ADD FOREIGN KEY ("IDMembre") REFERENCES "Membre" ("IDMembre");
