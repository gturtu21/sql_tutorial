/* DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATE NOT NULL
);

-- products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price NUMERIC(10,2) NOT NULL
);

-- orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE NOT NULL
);

-- orders_item table
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL, 
    unit_price NUMERIC(10,2) NOT NULL
);

-- payments table
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    payment_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_method TEXT
)
*/

-- ----------------------------------------
-- DROP EXISTING TABLES (in dependency order)
-- ----------------------------------------
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ----------------------
-- CREATE TABLES
-- ----------------------

-- Customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATE NOT NULL
);

-- Products
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price NUMERIC(10,2) NOT NULL
);

-- Orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE NOT NULL
);

-- Order Items
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

-- Payments
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    payment_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_method TEXT
);

-- --------------------------
-- INSERT SAMPLE DATA
-- --------------------------

-- Customers
INSERT INTO customers (name, email, created_at) VALUES
('Alice Smith', 'alice@example.com', '2024-01-01'),
('Bob Johnson', 'bob@example.com', '2024-01-15'),
('Charlie Lee', 'charlie@example.com', '2024-02-10'),
('Diana King', 'diana@example.com', '2024-03-05'),
('Ethan Black', 'ethan@example.com', '2024-04-12');

-- Products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 999.99),
('Smartphone', 'Electronics', 699.00),
('Headphones', 'Accessories', 149.95),
('Office Chair', 'Furniture', 199.50),
('Standing Desk', 'Furniture', 450.00);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-05-01'),
(2, '2024-05-03'),
(1, '2024-05-10'),
(3, '2024-05-15'),
(4, '2024-05-20');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 3, 2, 149.95),
(2, 2, 1, 699.00),
(3, 4, 1, 199.50),
(4, 5, 1, 450.00),
(5, 2, 2, 699.00);

-- Payments
INSERT INTO payments (order_id, payment_date, amount, payment_method) VALUES
(1, '2024-05-02', 1299.89, 'Credit Card'),
(2, '2024-05-03', 699.00, 'PayPal'),
(3, '2024-05-11', 199.50, 'Credit Card'),
(4, '2024-05-16', 450.00, 'Debit Card'),
(5, '2024-05-21', 1398.00, 'Credit Card');
