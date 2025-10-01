# SmashCenter - Base de données - Magasin de Tennis 🎾 (PostgreSQL)
Ce projet a pour but de modéliser et gérer la base de données d’une application de gestion de commandes, approvisionnements et produits pour un magasin de sport fictif.
Ma base de données a été conçue pour gérer les informations transmises via 8 fichiers Excel, à savoir : 
1. **client.xls 👤**
2. **fournisseur.xls 🚚**
3. **marque.xls 🏷️**
4. **produit.xls 🎾**
5. **commande.xls 📦**
6. **ligne_commande.xls 🧾**
7. **approvisionnement.xls 📥**
8. **ligne_approvisionnement.xls 🧾**

## 1_Objectifs du projet 🎯
- Créer une base de données relationnelle sous **PostgreSQL (pgAdmin)**.
- Gérer les entités principales d’un système de vente.

## 2_Contenu du dépôt attendu 📁 

**01_Creation_db.sql** : création de la base la base de données (smashCenterDB) + rôle utilisateur (user_tennis).

**02_Schema_tables.sql** : script de création des tables et contraintes (à créer dans l'ordre indiqué).

**03_Test_queries.sql** : les 10 requêtes d’évaluation

**assets** : dossier contenant les 8 fichiers .csv

## 3_ Lancement du projet 🚀
Pour utiliser cette base de données en local, suivez les étapes ci-dessous :

- **Clonez le dépôt GitHub :**
git clone https://github.com/tarik-benabbou-mac-veigh/db_smashCenter.git

- **Ouvrez pgAdmin** (si vous ne disposez-pas encore de cette interface graphique, vous pouvez la télécharger ici : https://www.pgadmin.org/download/)

Dans VSCode : 
- **Exécutez le script de création de la base de données :** ouvrez et exécutez le fichier **01_Creation_db.sql**.

- **Exécutez le script du schéma :** ouvrez et exécutez le fichier **02_Schema_tables.sql**.

- **Exécutez les requêtes de test :** ouvrez et exécutez le fichier **03_Test_queries.sql** pour vérifier le bon fonctionnement de la base de données.

## 4_ Projet évolutif
N'hésitez pas à me faire part de **vos recommandations pour améliorer la structure du code**, la conception de la base de données ou l'efficacité des requêtes. 🙂
