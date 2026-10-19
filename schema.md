### Gargote Rado

PLATS (**id_plat**, nom, prix, #id_categorie)

CATEGORIES (**id_categorie**, nom)

COMMANDES (**id_commande**, date, #id_client, #id_serveur, #id_table)

COMMANDE_PLAT(**id**, #id_plat, #id_commande, quantite, prix_unitaire)

CLIENTS(**id_client**, nom, adresse)

SERVEURS(**id_serveur**, nom)

TABLES_SALLE(**id_table**, numero)

MODE_PAIEMENT(**id**, libelle)

PAIEMENTS(**id**, montant, reference_transaction, date_paiement, #id_commande, #id_mode_paiement)

HISTORIQUE_PLAT(**id**, prix, date_modif, #id_plat)

INGREDIENTS(**id**, libelle)

STOCK(**id**, quantite, dernier_maj, #id_ingredient)

UNITE(**id**, libelle)

INGREDIENT_PLAT(**id**, quantite, #id_plat, #id_ingredient, #id_unite)




