
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

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50)
);

CREATE TABLE stock(
    id SERIAL PRIMARY KEY,
    id_ingredient INT REFERENCES ingredients(id),
    quantite NUMERIC(10,2),
    dernier_maj TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE unite(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50)
);


CREATE TABLE ingredient_plat(
    id SERIAL PRIMARY KEY,
    id_plat INT REFERENCES plats(id),
    id_ingredient INT REFERENCES ingredients(id),
    quantite NUMERIC(10,2),
    id_unite INT REFERENCES unite(id)
);

ALTER TABLE plats ADD COLUMN est_menu BOOLEAN DEFAULT FALSE;

CREATE TABLE composition_menu(
    id SERIAL PRIMARY KEY,
    id_menu INT REFERENCES plats(id),
    id_plats_inclu INT REFERENCES plats(id),
    quantite NUMERIC(10,2)
);

INSERT INTO categories(nom) VALUES ('menu');
INSERT INTO plats (nom, prix, id_categorie, est_menu) 
VALUES ('Menu Romazava', 8000, 6, TRUE); 
INSERT INTO composition_menu (id_menu, id_plats_inclu, quantite) VALUES 
(10, 1, 1),  
(10, 7, 1),  
(10, 6, 2); 