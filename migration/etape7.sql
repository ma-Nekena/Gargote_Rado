
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

CREATE TABLE mode_paiement(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100)
);

CREATE TABLE paiement(
    id SERIAL PRIMARY KEY,
    id_commande INT REFERENCES commandes(id),
    id_mode_paiement INT REFERENCES mode_paiement(id),
    montant NUMERIC (10,2),
    reference_transaction VARCHAR(50),
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE historique_plat(
    id SERIAL PRIMARY KEY,
    id_plat INT REFERENCES plats(id),
    prix INT,
    date_modif TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE commande_plat ADD COLUMN prix_unitaire INT ;

INSERT INTO historique_plat (id_plat, prix, date_modif)
VALUES (1, 7500, '2026-10-15');

INSERT INTO commande_plat (id_commande, id_plat, quantite, prix_unitaire) 
VALUES (1, 3, 2, 7000);