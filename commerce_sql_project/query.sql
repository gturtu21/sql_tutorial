SELECT COUNT(*) FROM customers;

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM order_items;

-- Count orders per customer
SELECT customer_id, COUNT(*) FROM orders
GROUP BY customer_id
ORDER BY customer_id ASC;

/* Join products with order_items,
Goal: Show order items with product names and prices
*/
SELECT order_items.id, products.name, products.price
FROM order_items
JOIN products ON order_items.product_id = products.id;


/*When in doubt btw JOIN and LEFT JOIN, always ask:

“Do I want to keep all rows from the left table, even if there’s no match on the right?”

If yes, use LEFT JOIN.

If no, use JOIN (which is the same as INNER JOIN).
*/

SELECT 
    c.name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.name;
