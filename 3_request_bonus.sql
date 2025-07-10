-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.
SELECT a.first_name, a.last_name, SUM(b.price) AS total_by_author
FROM author a 
JOIN book b ON a.author_id = b.author_id
JOIN customer_order co ON co.book_id = b.book_id
GROUP BY a.author_id
ORDER BY total_by_author DESC LIMIT 3
-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).
SELECT t.theme_name, SUM(b.price) AS total_ventes
FROM theme t
JOIN book b ON  t.theme_id = b.theme_id
JOIN customer_order co ON b.book_id = co.book_id
GROUP BY t.theme_name
ORDER BY total_ventes DESC
-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.
SELECT strftime('%Y-%m', co.order_date) AS month, SUM(co.total_amount) AS chiffre_affaIre, COUNT(co.order_id) nombre_ordre
FROM customer_order co
WHERE strftime('%Y', co.order_date) = '2024'
GROUP BY month
ORDER BY month;

-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).
SELECT a.author_id, a.first_name, a.last_name,
    AVG(r.rating) AS average_rating
FROM book b
JOIN author a ON a.author_id = b.author_id
LEFT JOIN review r ON b.book_id = r.book_id
GROUP BY a.author_id;

-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
