-- 01 - Afficher la liste des produits triés par prix croissant :

SELECT nom, prix FROM produit
ORDER BY prix;


-- 02 - Afficher le nombre total de produits en stock :

SELECT COUNT(*) FROM produit;


-- 03 - Afficher le chiffre d’affaires total (somme des prix × quantités vendues) :

SELECT SUM(p.prix * lc.quantite) AS chiffre_affaires FROM produit AS p
INNER JOIN ligne_commande AS lc
ON lc.id_produit = p.id
INNER JOIN commande AS c
ON lc.id_commande = c.id
WHERE c.etat = 'Livrée';


-- 04 - Afficher la liste des commandes avec le nom du client et la date :

SELECT cd.id, cd.date_commande, clt.nom, clt.prenom FROM commande as cd
INNER JOIN client as clt
ON cd.id_client = clt.id;


-- 05 - Afficher le top 10 des clients qui ont dépensé le plus :

SELECT clt.id, clt.nom, clt.prenom, SUM(lcd.quantite * lcd.prix_unitaire) as total  FROM commande as cd
INNER JOIN client as clt
ON cd.id_client = clt.id
INNER JOIN ligne_commande as lcd
ON cd.id = lcd.id_commande
WHERE cd.etat = 'Livrée'
GROUP BY clt.id, clt.nom, clt.prenom
ORDER BY SUM(lcd.quantite * lcd.prix_unitaire) DESC
LIMIT 10;


-- 06 - Afficher la moyenne des quantités vendues par type de produit :

SELECT p.type, AVG(lcd.quantite)::NUMERIC(10,2) AS moyenne_quantite FROM ligne_commande AS lcd
INNER JOIN produit AS p
ON lcd.id_produit = p.id
INNER JOIN commande AS cd
ON cd.id = lcd.id_commande
WHERE cd.etat = 'Livrée'
GROUP BY p.type;


-- 07 - Afficher les produits qui n’ont jamais été commandés :

SELECT * FROM produit AS p
LEFT OUTER JOIN ligne_commande AS lcd
ON p.id = lcd.id_produit
WHERE lcd.id_produit IS NULL;


-- 08 - Afficher les fournisseurs qui n’ont pas approvisionné depuis plus de 6 mois :

SELECT f.id, f.nom, MAX(app.date_approvisionnement) FROM fournisseur AS f
LEFT JOIN approvisionnement AS app
ON f.id = app.id_fournisseur
GROUP BY f.id, f.nom
HAVING MAX(app.date_approvisionnement) < CURRENT_DATE - INTERVAL '6 months';

-- 09 - Afficher les produits dont le stock est inférieur à 10 unités :

SELECT id, nom, stock FROM produit
WHERE stock < 10;

-- 10 - Afficher le nombre de produits vendus par marque :

SELECT m.nom, SUM(lcd.quantite) AS total_produits_vendus FROM produit AS p
INNER JOIN marque as m
ON p.id_marque = m.id
INNER JOIN ligne_commande AS lcd
ON lcd.id_produit = p.id
INNER JOIN commande AS cd
ON cd.id = lcd.id_commande
WHERE cd.etat = 'Livrée'
GROUP BY m.nom
ORDER BY SUM(lcd.quantite)