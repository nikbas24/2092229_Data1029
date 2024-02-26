SELECT
  u.full_name AS 'Nom complet',
  r.name AS 'Rôle'
FROM
  user u
INNER JOIN role r ON u.role_id = r.id;

SELECT
  p.name AS 'Désignation',
  ol.quantity AS 'Quantité'
FROM
  user u
JOIN invoice i ON u.id = i.customer_id
JOIN orders o ON i.order_id = o.id
JOIN OrderLine ol ON o.id = ol.order_id
JOIN product p ON ol.product_id = p.id
WHERE
  u.full_name = 'Oumar Moussa';

SELECT
  p.name
FROM
  product p
JOIN supplier s ON p.supplier_id = s.id
WHERE
  s.city = 'Moncton';
  
SELECT
  u.full_name,
  MAX(ch.onsite_time) AS 'Temps passé'
FROM
  user u
JOIN connection_history ch ON u.id = ch.user_id
GROUP BY
  u.full_name
ORDER BY
  MAX(ch.onsite_time) DESC
LIMIT 1;

SELECT
  u.full_name,
  ch.logout_date AS 'Date de déconnexion'
FROM
  user u
JOIN connection_history ch ON u.id = ch.user_id
ORDER BY
  ch.logout_date DESC
LIMIT 1;
