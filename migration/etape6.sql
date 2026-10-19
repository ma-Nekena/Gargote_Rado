
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

INSERT INTO mode_paiement(libelle)
VALUES ('especes'),('Mvola'),('Mobile Money'),('Airtel Money');


INSERT INTO paiements (id_commande, id_mode_paiement, montant, reference_transaction) 
VALUES (1, 1, 10000.00, NULL);

INSERT INTO paiements (id_commande, id_mode_paiement, montant, reference_transaction) 
VALUES (1, 2, 5000.00, 'MVOLA-REF-987654');

INSERT INTO paiements (id_commande, id_mode_paiement, montant, reference_transaction)
VALUES (2,3,6000,'ORANGE-MONEY-REF-0002');