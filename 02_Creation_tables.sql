-- Table client :
CREATE TABLE client(
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
prenom VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
telephone VARCHAR(100) NOT NULL,
date_inscription TIMESTAMPS NOT NULL
);

-- Table fournisseur : 
CREATE TABLE fournisseur(
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
contact VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
telephone VARCHAR(100) NOT NULL,
pays VARCHAR(100) NOT NULL
);

-- Table marque : 
CREATE TABLE marque(
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
pays_origine VARCHAR(100) NOT NULL
);

-- Table produit : 
CREATE TABLE produit(
id SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
type VARCHAR(100) NOT NULL,
prix DECIMAL(5,2) NOT NULL,
stock INT NOT NULL,
id_marque INT NOT NULL,
description VARCHAR(250) NOT NULL,
FOREIGN KEY (id_marque) REFERENCES marque(id)
);	

-- Table commande : 
CREATE TABLE commande(
id INT PRIMARY KEY,
date_commande TIMESTAMP NOT NULL,
id_client INT NOT NULL,
etat VARCHAR(100) NOT NULL,
FOREIGN KEY (id_client) REFERENCES client(id)
);

-- Table ligne_commande : 
CREATE TABLE ligne_commande(
id SERIAL PRIMARY KEY,
id_commande INT NOT NULL,
id_produit INT NOT NULL,
quantite INT NOT NULL,
prix_unitaire DECIMAL(5,2) NOT NULL,
FOREIGN KEY (id_commande) REFERENCES commande(id),
FOREIGN KEY (id_produit) REFERENCES produit(id)
);

-- Table approvisionnement : 
CREATE TABLE approvisionnement(
id INT PRIMARY KEY,
date_approvisionnement TIMESTAMP NOT NULL,
id_fournisseur INT NOT NULL,
notes VARCHAR(250) NOT NULL,
FOREIGN KEY (id_fournisseur) REFERENCES fournisseur(id)
);

-- Table ligne_approvisionnement : 
CREATE TABLE ligne_approvisionnement(
id INT PRIMARY KEY,
id_approvisionnement INT NOT NULL,
id_produit INT NOT NULL,
quantite INT NOT NULL,
prix_achat DECIMAL(5,2) NOT NULL,
FOREIGN KEY (id_approvisionnement) REFERENCES approvisionnement(id),
FOREIGN KEY (id_produit) REFERENCES produit(id)
);