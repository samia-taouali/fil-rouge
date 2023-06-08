CREATE DATABASE  HomeMade;
USE HomeMade;

CREATE TABLE IF NOT EXISTS client (
  id_client INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  numero_telephone VARCHAR(20),
  mot_de_passe VARCHAR(255)
);

CREATE TABLE  IF NOT EXISTS prestataire (
  id_prestataire INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  image VARCHAR(255),
  numero_telephone VARCHAR(20),
  mot_de_passe VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS services (
  id_service INT PRIMARY KEY AUTO_INCREMENT,
  image VARCHAR(255),
  titre VARCHAR(255),
  description TEXT,
  categorie VARCHAR(255),
  min_prix DECIMAL(10,2),
  max_prix DECIMAL(10,2),
  url_reseaux_sociaux VARCHAR(255),
  id_prestataire INT,
  id_image INT,
  FOREIGN KEY (id_prestataire) REFERENCES prestataire(id_prestataire)
);


CREATE TABLE IF NOT EXISTS gallerie (
  id_image INT PRIMARY KEY AUTO_INCREMENT,
  image VARCHAR(255),
  type VARCHAR(255),
  id_service INT,
  FOREIGN KEY (id_service) REFERENCES services(id_service)
);



CREATE TABLE IF NOT EXISTS commentaire (
  id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
  contenu VARCHAR(255),
  date_creation DATE,
  id_client INT,
  id_service INT,
  FOREIGN KEY (id_client) REFERENCES client(id_client),
  FOREIGN KEY (id_service) REFERENCES services(id_service)
);


CREATE TABLE  IF NOT EXISTS commande (
  id_commande INT PRIMARY KEY AUTO_INCREMENT,
  titre VARCHAR(255),
  details TEXT,
  statut_commande VARCHAR(255),
  date_debut DATE,
  date_livraison DATE,
  date_validation DATE,
  adresse_livraison VARCHAR(255),
  id_client INT,
  id_service INT,
  FOREIGN KEY (id_client) REFERENCES client(id_client),
  FOREIGN KEY (id_service) REFERENCES services(id_service)
);


