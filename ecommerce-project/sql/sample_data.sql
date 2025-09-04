-- Insert customers
INSERT INTO customers (name, email, created_at) VALUES
('Alice Smith', 'alice@example.com', '2023-01-01'),
('Bob Lee', 'bob@example.com', '2023-02-14');

-- Insert products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Coffee Maker', 'Home Appliances', 100.00);

-- Insert orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-03-10'),
(2, '2023-03-15');

-- Insert order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),  -- Alice bought 1 Laptop
(1, 3, 2, 100.00),   -- Alice bought 2 Coffee Makers
(2, 2, 1, 800.00);   -- Bob bought 1 Smartphone

-- Insert payments
INSERT INTO payments (order_id, payment_date, amount, payment_method) VALUES
(1, '2023-03-11', 1400.00, 'Credit Card'),
(2, '2023-03-16', 800.00, 'PayPal');
