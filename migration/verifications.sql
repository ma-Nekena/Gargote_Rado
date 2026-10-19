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

//etape 8:
SELECT 
    i.libelle AS ingredient,
    SUM(ip.quantite * cp.quantite) AS consommation_totale,
    u.libelle AS unite
FROM commandes c
JOIN commande_plat cp ON c.id = cp.id_commande
JOIN ingredient_plat ip ON cp.id_plat = ip.id_plat
JOIN ingredients i ON ip.id_ingredient = i.id
JOIN unite u ON ip.id_unite = u.id
WHERE DATE(c.date) = '2026-10-12'
GROUP BY i.libelle, u.libelle;

//etape 9:
SELECT 
    m.nom AS nom_menu,
    m.prix AS prix_menu,
    SUM(p.prix * cm.quantite) AS prix_a_la_carte,
    (SUM(p.prix * cm.quantite) - m.prix) AS economie_realisee
FROM plats m
JOIN composition_menu cm ON m.id = cm.id_menu
JOIN plats p ON cm.id_plats_inclu = p.id
WHERE m.est_menu = TRUE
GROUP BY m.id, m.nom, m.prix;

