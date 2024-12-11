CREATE DATABASE ITThink;
USE ITThink;

CREATE TABLE Utilisateur(
	id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    autres_informations_pertinentes TEXT
);

CREATE TABLE categories (
	id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(50) NOT NULL
);

CREATE TABLE sous_categorie (
	id_sous_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_sous_categorie VARCHAR(255) NOT NULL,
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES categories (id_categorie)
);

CREATE TABLE projet (
	id_projet INT AUTO_INCREMENT PRIMARY KEY,
    titre_projet VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    id_categorie INT,
    id_sous_categorie INT,
    id_utilisateur INT,
    FOREIGN KEY (id_categorie) REFERENCES categories (id_categorie),
    FOREIGN KEY (id_sous_categorie) REFERENCES sous_categorie (id_sous_categorie),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur (id_utilisateur)
);

CREATE TABLE freelance (
	id_freelance INT AUTO_INCREMENT PRIMARY KEY,
    nom_freelance VARCHAR(50) NOT NULL,
    competences TEXT NOT NULL,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE offres (
	id_offre INT AUTO_INCREMENT PRIMARY KEY,
    montant DECIMAL(10, 2) NOT NULL,
    delai DATE NOT NULL,
    id_freelance INT,
    id_projet INT,
    FOREIGN KEY (id_freelance) REFERENCES freelance (id_freelance),
    FOREIGN KEY (id_projet) REFERENCES projet (id_projet)
);

CREATE TABLE temoignages (
	id_temoignage INT AUTO_INCREMENT PRIMARY KEY,
    commentaire TEXT,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);


ALTER TABLE projet
ADD COLUMN date_creation DATE;