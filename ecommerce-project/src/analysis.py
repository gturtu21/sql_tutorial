from db import run_query

query = """
SELECT c.id, c.name, 
       SUM(oi.quantity * oi.unit_price) AS total_spent,
       RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.name
ORDER BY spending_rank;
"""

df = run_query(query)
print(df.head())
