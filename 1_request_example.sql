-- 1. Sélectionner tous les livres avec leur titre et prix
SELECT title, price FROM book;

-- 2. Sélectionner les livres dont le prix est entre 15 et 20 euros
SELECT title, price FROM book WHERE price BETWEEN 15 AND 20;

-- 3. Sélectionner les livres dont le titre contient le mot 'Harry'
SELECT title FROM book WHERE title LIKE '%Harry%';

-- 4. Sélectionner les 5 livres les plus chers
SELECT title, price FROM book ORDER BY price DESC LIMIT 5;

-- 5. Sélectionner les titres des livres et renommer la colonne 'title' en 'Nom du Livre'
SELECT title AS "Nom du Livre" FROM book;
