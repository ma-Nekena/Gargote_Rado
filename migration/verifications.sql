//etape 1:
SELECT * FROM plats ORDER BY prix DESC;

//etape 2:
SELECT
c.nom AS categorie,
COUNT(p.id) AS nombre_plats
FROM plats p
JOIN categories c
ON p.id_categorie = c.id
GROUP BY c.nom;