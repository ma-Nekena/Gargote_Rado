## Etape 1: -La carte
1- Pour le prix, j'ai choisi **INT** comme type puisque c'est ca qu'on nous a dit
2- identifiant pour le plats : id_plat

## Etape 2: -Les categories
1-Créer une table categories séparée permet d'éviter la répétition des noms et les erreurs de saisie. Par exemple, si 200 plats appartiennent à la catégorie « Plats malgaches », stocker ce nom dans chaque ligne augmente le risque d'incohérences. Avec une table categories, le nom est enregistré une seule fois et chaque plat référence sa catégorie grâce à id_categorie, une clé étrangère. On peut ainsi modifier le nom d'une catégorie en un seul endroit, créer une catégorie sans plat et garantir que chaque plat fait référence à une catégorie existante.

## Etape 3: -Les commandes
1- j'ai creE 2 table commande(**id_commande**, date) et commande_plat(**id**, #id_plat, #id_commande, quantite) et c'etait dans ce dernier que j'ai mis la quantite.

## Etape 4: -Les habitués

