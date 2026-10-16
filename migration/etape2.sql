
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

INSERT INTO categories (nom) VALUES
('plats malagasy'), 
('plats chinois'),
('soupes'),
('desserts'),
('boissons');

UPDATE plats SET id_categorie = 1 WHERE id = 1;
UPDATE plats SET id_categorie = 1 WHERE id = 2;
UPDATE plats SET id_categorie = 1 WHERE id = 3;
UPDATE plats SET id_categorie = 2 WHERE id = 4;
UPDATE plats SET id_categorie = 3 WHERE id = 5;
UPDATE plats SET id_categorie = 4 WHERE id = 6;
UPDATE plats SET id_categorie = 5 WHERE id = 7;

ALTER TABLE plats
ALTER COLUMN id_categorie SET NOT NULL;
