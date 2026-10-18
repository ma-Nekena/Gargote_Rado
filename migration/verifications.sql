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

//etape 3:
SELECT
    commandes.id AS commande,
    SUM(plats.prix * commande_plat.quantite) AS prix_total
FROM plats
JOIN commande_plat
    ON plats.id = commande_plat.id_plat
JOIN commandes
    ON commandes.id = commande_plat.id_commande
GROUP BY commandes.id
ORDER BY commandes.id;

//etape 4:
SELECT 
    c.id AS commande_id,
    c.date,
    COALESCE(cl.nom, 'client de passage') AS nom_client
FROM 
    commandes c         
LEFT JOIN 
    clients cl          
    ON c.id_client = cl.id;