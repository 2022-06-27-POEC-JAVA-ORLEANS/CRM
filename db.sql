/*Création de la table client*/
CREATE TABLE client
    (id SERIAL,
    nom varchar(50) NOT NULL,
    prenom varchar(50) NOT NULL,
    entreprise varchar(200),
    email varchar(200) NOT NULL UNIQUE,
    telephone varchar(50),
    actif BOOLEAN NOT NULL DEFAULT True,
    notes TEXT,
    CONSTRAINT pk_client PRIMARY KEY(id),
    CONSTRAINT email_valid CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'));


/*Création de la table commande*/
CREATE TABLE commande
    (id SERIAL,
    label varchar(200) NOT NULL,
    tjmHT DECIMAL(10,2) NOT NULL,
    duree_jours INTEGER NOT NULL DEFAULT 1,
    tva DECIMAL(10,2) NOT NULL,
    statut varchar(200) NOT NULL,
    type_commande varchar(200) NOT NULL,
    notes TEXT,
    id_client INTEGER NOT NULL,
    CONSTRAINT pk_commande PRIMARY KEY(id),
    CONSTRAINT duree_jours_non_null CHECK(duree_jours>0),
    CONSTRAINT tva_valid CHECK(tva>0 AND tva<100),
    CONSTRAINT fk_client FOREIGN KEY(id_client) REFERENCES client(id));


/*Création de la table utilisateur*/
CREATE TABLE utilisateur
    (id SERIAL,
    login varchar(200) NOT NULL,
    password varchar(200) NOT NULL,
    email varchar(200) NOT NULL UNIQUE,
    CONSTRAINT pk_utilisateur PRIMARY KEY(id),
    CONSTRAINT email_valid CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'));
    