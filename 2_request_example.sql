/*
-- Qu'est-ce qu'une jointure ?

-- Une jointure permet de lier deux tables grâce à une colonne commune.
-- Cela combine les données pour obtenir des informations complètes.
-- Exemple : relier un livre à son auteur via l'auteur_id.
-- Types courants :
--   INNER JOIN : affiche uniquement les lignes correspondantes dans les deux tables.
--   LEFT JOIN  : affiche toutes les lignes de la première table, même sans correspondance dans la deuxième.
-- Pour comprendre le fonctionnement des jointures, tester les requêtes suivantes.
*/




-- ===== JOINTURES SIMPLES =====

-- 1. Lister tous les livres avec le nom de leur auteur
SELECT b.title, a.first_name, a.last_name
FROM book b
JOIN author a ON b.author_id = a.author_id;

-- 2. Afficher toutes les commandes avec le mail du client
SELECT co.order_id, c.email, co.total_amount
FROM customer_order co
JOIN customer c ON co.customer_id = c.customer_id;

-- 3. Lister les avis avec le titre du livre correspondant
SELECT r.rating, r.comment, b.title
FROM review r
JOIN book b ON r.book_id = b.book_id;

-- ===== FONCTIONS D’AGRÉGATION SIMPLES =====

-- 4. Compter le nombre total de livres
SELECT COUNT(*) AS total_books FROM book;

-- 5. Calculer la moyenne des prix des livres
SELECT AVG(price) AS avg_price FROM book;

-- 6. Compter le nombre de commandes par client
SELECT customer_id, COUNT(order_id) AS nb_orders
FROM customer_order
GROUP BY customer_id;

-- ===== JOINTURES + AGRÉGATION (GROUP BY) =====

-- 7. Nombre de livres par auteur
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS nb_books
FROM author a
JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id;

-- 8. Montant total des commandes par client
SELECT c.email, SUM(co.total_amount) AS total_spent
FROM customer c
JOIN customer_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id;
