
\c gargote_rado;

CREATE TABLE plats(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prix INT
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

ALTER TABLE plats 
ADD COLUMN id_categorie INT,
ADD CONSTRAINT fk_categorie
FOREIGN KEY (id_categorie)
REFERENCES categories(id);

CREATE TABLE commandes(
    id SERIAL PRIMARY KEY,
    date TIMESTAMP
);

CREATE TABLE commande_plat(
    id SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commandes(id),
    id_plat INTEGER REFERENCES plats(id),
    quantite NUMERIC
);

CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(50)
);

ALTER TABLE commandes ADD COLUMN id_client INT,
ADD CONSTRAINT fk_client 
FOREIGN KEY (id_client)
REFERENCES clients(id); 

CREATE TABLE serveurs(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE tables_salle(
    id SERIAL PRIMARY KEY,
    numero INT
);

ALTER TABLE commandes 
ADD COLUMN id_serveur INT REFERENCES serveurs(id),
ADD COLUMN id_table INT REFERENCES tables_salle(id);

INSERT INTO serveurs (nom) VALUES ('Njaka Rakoto'), ('Lalao Rasoa');

INSERT INTO tables_salle (numero) VALUES (1), (2), (3), (4), (5), (6), (7), (8);