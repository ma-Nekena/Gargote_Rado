## Etape 1: -La carte
1- Pour le prix, j'ai choisi **INT** comme type puisque c'est ca qu'on nous a dit
2- identifiant pour le plats : id_plat

## Etape 2: -Les categories
1-Créer une table categories séparée permet d'éviter la répétition des noms et les erreurs de saisie. Par exemple, si 200 plats appartiennent à la catégorie « Plats malgaches », stocker ce nom dans chaque ligne augmente le risque d'incohérences. Avec une table categories, le nom est enregistré une seule fois et chaque plat référence sa catégorie grâce à id_categorie, une clé étrangère. On peut ainsi modifier le nom d'une catégorie en un seul endroit, créer une catégorie sans plat et garantir que chaque plat fait référence à une catégorie existante.

## Etape 3: -Les commandes
1- j'ai creE 2 table commande(**id_commande**, date) et commande_plat(**id**, #id_plat, #id_commande, quantite) et c'etait dans ce dernier que j'ai mis la quantite.

## Etape 4: -Les habitués
1- Les cles etrangeres pourrait etre null pour les cas des clients de passage. On a utilisé LEFT JOIN 

## Etape 5: -Serveurs et tables
1- Le nom table pose un probleme en sql puisqu'il y a deja une table dans "CREATE TABLE" et quand on va creer une table nommee table, ca va etre : CREATE TABLE table... et ca va poser un probleme en sql.

## Etape 6: -Les paiements
1- une colonne montant_paye dans la table commandes ne suffit pas car une commande peut etre payE par 2 differentes mode de paiement.

## Etape 7: -Les prix changent
1- Pour la commande 1, on constate que le prix a augmentE

## Etape 8: -Les ingredients
1- La colonne ingredients VARCHAR(500) n'est pas conseille car stocker plusieurs valeur dans une chaine de caractere viole les regles de base de BDDR et c'est impossible de faire des calculs ou des jointures.

## Etape 9: -Les menus du jour
1- On ne cree pas une table menu separe pour eviter la complexite des commandes. Puisque le menu se commande comme un plat donc id_menu = id_plat. Et en plus, un menu n'est qu'un plat special.
Contrainte: Puisqu'un menu est un plat composé d'autres plats (grâce à une table de composition, un peu comme les ingrédients), un risque logique apparaît : la récursivité infinie (par exemple, un menu "Maxi" qui se contient lui-même, ou un menu A qui contient le menu B qui contient le menu A).



