-- 1- Récupérez les 2 derniers clients par ordre alphabétique (AZ) - excluez 'id' des résultats.
SELECT first_name, last_name
FROM customers
ORDER BY last_name DESC
LIMIT 2;

-- 2- Utilisez SQL pour supprimer tous les achats effectués par Scott.
DELETE FROM purchases
WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Scott');

-- 3- Scott existe-t-il toujours dans la table des clients, même s'il a été supprimé ? Essayez de le trouver.
-- OUI
-- 4- Utilisez SQL pour trouver tous les achats. Joignez les achats à la table des clients , de sorte que la commande de Scott apparaisse, bien qu'au lieu du prénom et du nom du client, vous ne devriez voir que vide/vide.
SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
LEFT JOIN customers c ON p.customer_id = c.id
LEFT JOIN items i ON p.item_id = i.id;

-- 5-
SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id AND c.first_name != 'Scott'
INNER JOIN items i ON p.item_id = i.id;

