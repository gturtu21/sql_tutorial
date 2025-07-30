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

/* Calculate total revenue per order
Goal: Sum of (quantity * unit_price) for each order
Rule of Thumb:
In the SELECT clause, every column that is not inside an aggregate function
must be listed in the GROUP BY.
*/
SELECT order_id, SUM(quantity*unit_price) 
FROM order_items
GROUP BY order_id

/* Find the top 5 best-selling products
Goal: Products with the highest total quantity sold
*/
SELECT p.name, SUM(oi.quantity) AS total_quantity_sold 
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name ORDER BY total_quantity_sold DESC
LIMIT 5;

/*
 Window functions: ranking customers by total spend
Goal: Rank customers by total money spent across all orders
*/
SELECT c.id, c.name, 
SUM(oi.quantity*oi.unit_price) AS total_spent,
RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank

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
