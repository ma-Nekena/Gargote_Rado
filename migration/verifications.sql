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

//etape 5:
SELECT 
    s.nom AS serveur,
    COUNT(DISTINCT c.id) AS nombre_commandes,
    SUM(cp.quantite * p.prix) AS chiffre_affaires
FROM 
    serveurs s
LEFT JOIN 
    commandes c ON s.id = c.id_serveur
LEFT JOIN 
    commande_plat cp ON c.id = cp.id_commande
LEFT JOIN 
    plats p ON cp.id_plat = p.id
GROUP BY 
    s.id, s.nom;

//etape 6:
SELECT 
    c.id AS id_commande, 
    c.date AS date_commande,
    COALESCE(SUM(p.prix * cp.quantite),0) AS montant_du,
    COALESCE(SUM(pay.montant),0) AS montant_paye,
    (COALESCE(SUM(p.prix * cp.quantite),0)- COALESCE(SUM(pay.montant),0), 0) AS reste_a_paye
FROM commandes c
LEFT JOIN commande_plat cp 
ON c.id = cp.id_commande
LEFT JOIN plats p
ON p.id = cp.id_plat
LEFT JOIN paiements pay 
ON c.id = pay.id_commande
GROUP BY c.id, c.date
HAVING COALESCE(SUM(p.prix * cp.quantite),0) > COALESCE(SUM(pay.montant),0);

