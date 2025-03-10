SET NAMES 'utf8';
SET CHARACTER SET utf8;

-- Création de la base de données

DROP DATABASE IF EXISTS `crud`;
CREATE DATABASE `crud`;
USE `crud`;

-- Création des tables

CREATE TABLE personnes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(125) NOT NULL,
    mot_de_passe VARCHAR(120),
    telephone VARCHAR(50),
    admin BOOLEAN,
    etudiant BOOLEAN,
    professeur BOOLEAN
);

CREATE TABLE cours(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE inscriptions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_personne INT,
    id_cours INT,
    FOREIGN KEY(id_personne) REFERENCES personnes(id),
    FOREIGN KEY(id_cours) REFERENCES cours(id)
);

-- Insertion des données

INSERT INTO personnes (nom, prenom, email, mot_de_passe, telephone, admin, etudiant, professeur)
VALUES
    ('Dupont', 'Jean', 'jean.dupont@example.com', 'motdepasse123', '0123456789', 0, 1, 0),
    ('Martin', 'Alice', 'alice.martin@example.com', 'alice1234', '0987654321', 0, 1, 0),
    ('Durand', 'Pierre', 'pierre.durand@example.com', 'pierre123', '0234567890', 0, 0, 1),
    ('Lemoine', 'Sophie', 'sophie.lemoine@example.com', 'sophiepass', '0345678901', 1, 0, 0);

INSERT INTO cours (nom)
VALUES
    ('Mathématiques'),
    ('Physique'),
    ('Informatique'),
    ('Histoire');

INSERT INTO inscriptions (id_personne, id_cours)
VALUES
    (1, 1),  -- Jean Dupont s'inscrit à Mathématiques
    (1, 3),  -- Jean Dupont s'inscrit à Informatique
    (2, 2),  -- Alice Martin s'inscrit à Physique
    (3, 1),  -- Pierre Durand s'inscrit à Mathématiques
    (4, 4);  -- Sophie Lemoine s'inscrit à Histoire