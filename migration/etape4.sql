
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

INSERT INTO clients (nom, adresse) VALUES ('Alice Rakoto', 'Analakely');

INSERT INTO commandes (date, id_client) VALUES ('2026-10-18 12:30:00', 1);

INSERT INTO commandes (date, id_client) VALUES ('2026-10-18 13:00:00', NULL);