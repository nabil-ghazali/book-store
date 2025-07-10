-- 1. Affichez la somme totale des stocks de livres.
SELECT SUM(stock) AS somme_stock_livres FROM book 

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS nombres_livres
FROM author a
JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id

-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT b.title, a.first_name, a.last_name, t.theme_name 
FROM book b
JOIN author a ON a.author_id = b.author_id
JOIN theme t ON   b.theme_id = t.theme_id
GROUP BY b.book_id

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT b.title, co.order_date,c.customer_id
FROM customer c
JOIN customer_order co, book b ON co.customer_id = c.customer_id
WHERE c.customer_id = 1

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT 
    b.title,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS number_of_reviews
FROM book b
JOIN review r ON b.book_id = r.book_id
GROUP BY b.book_id
HAVING COUNT(r.review_id) >= 3;

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT c.email, COUNT(co.order_id) AS nombres_commandes
FROM customer_order co
JOIN customer c ON c.customer_id = co.customer_id
GROUP BY c.email, c.customer_id

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT b.title
FROM book b
LEFT JOIN customer_order co ON b.book_id = co.book_id
WHERE co.customer_id IS NULL

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT a.first_name, a.last_name, SUM(b.price) AS total_by_author
FROM author a 
JOIN book b ON a.author_id = b.author_id
JOIN customer_order co ON co.book_id = b.book_id
GROUP BY a.author_id
