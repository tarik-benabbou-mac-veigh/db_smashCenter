-- Suppression automatique de la BDD pour nouvel utilisateur : 
DROP DATABASE IF EXISTS "smashCenter";

-- Création BDD smashCenter :
CREATE DATABASE "smashCenter";

-- Création utilisateur : 
DROP ROLE IF EXISTS user_tennis;
CREATE ROLE user_tennis WITH LOGIN PASSWORD 'smashCenterDB';

-- Droit utilisateur : 
GRANT ALL PRIVILEGES ON DATABASE "smashCenter" TO user_Tennis;