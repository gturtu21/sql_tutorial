SELECT id, SUM(quantity*unit_price) FROM order_items
GROUP BY id;


SELECT p.name, SUM(oi.quantity) AS sum FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY sum ASC;

SELECT c.id, c.name,
SUM(oi.quantity*oi.unit_price) AS total_spent,
RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS rank
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.name
ORDER BY rank;

