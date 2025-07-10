-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.
SELECT a.first_name, a.last_name, SUM(b.price) AS total_by_author
FROM author a 
JOIN book b ON a.author_id = b.author_id
JOIN customer_order co ON co.book_id = b.book_id
GROUP BY a.author_id
ORDER BY total_by_author DESC LIMIT 3
-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).


-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.


-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).


-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
