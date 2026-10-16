
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

INSERT INTO commandes(date) VALUES
('2026-10-16 10:30:00'),
('2026-10-16 11:15:00'),
('2026-10-16 12:00:00'),
('2026-10-16 13:45:00');

INSERT INTO commande_plat(id_commande, id_plat, quantite) VALUES
(1, 1, 2),
(1, 2, 1),
(1, 7, 0.5),

(2, 3, 1),
(2, 4, 2),
(2, 6, 3),

(3, 1, 0.5),
(3, 5, 2),

(4, 2, 2),
(4, 3, 1),
(4, 7, 1.5);
