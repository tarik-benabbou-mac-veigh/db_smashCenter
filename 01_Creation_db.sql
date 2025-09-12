-- Suppression automatique de la BDD pour nouvel utilisateur : 
DROP DATABASE IF EXISTS smashCenter;

-- Création BDD smashCenter :
CREATE DATABASE smashCenter;

-- Sélection BDD :
USE smashCenter;

-- Création utilisateur : 
CREATE USER 'user_tennis'@'localhost' IDENTIFIED BY 'smashCenterDB';

-- Droit utilisateur : 
GRANT ALL PRIVILEGES ON smashCenter TO 'user_Tennis'@'localhost' WITH GRANT OPTION;

-- Application des changements :
FLUSH PRIVILEGES;