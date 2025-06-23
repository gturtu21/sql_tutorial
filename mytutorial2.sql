DROP TABLE IF EXISTS employees;
-- Create table and populate it with some data
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT,
    salary NUMERIC(10, 2), -- 10 is the total digits, 2 are the maximum decimal digits
    hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'Engineering', 95000, '2021-01-15'),
('Bob', 'Sales', 70000.50, '2020-06-01'),
('Carol', 'Engineering', 115000, '2019-09-23'),
('Dave', 'HR', 65000, '2022-02-10'),
('Eve', 'Sales', 72000, '2021-03-03');

-- Select and filtering
SELECT * FROM employees;
SELECT name, salary FROM employees WHERE salary > 80000;
SELECT * FROM employees WHERE department = 'Engineering' ORDER BY salary ASC;

-- Aggregation operation
SELECT department, AVG(salary) FROM employees GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM  employees
GROUP BY department
HAVING AVG(salary) > 75000;

-- Joins operation
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
    name TEXT PRIMARY KEY,
    manager TEXT
);

INSERT INTO departments(name, manager) VALUES
('Engineering', 'Grace'),
('Sales', 'Heidi'),
('HR', 'Ivan');

SELECT e.name, e.department, d.manager
FROM employees e
JOIN departments d ON e.department = d.name;

-- subqueries
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(SALARY) FROM employees);

-- CTE (Common Table Expression)
WITH high_paid AS (
    SELECT * FROM employees WHERE salary > 80000
)
SELECT * FROM high_paid;

-- window functions
--Use window functions when you want to analyze data across rows without grouping.
--Combine them with PARTITION BY (optional) to define groups.
--Add ORDER BY (optional) to define order within the group.

SELECT name, department, salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
FROM employees;

-- Constraints and Indexes
--Yes, indexing columns like department is very common and recommended when:
--The column is queried frequently.
--The table is medium to large in size.
--You care about performance and scalability.

CREATE INDEX idx_department ON employees(department);

-- transactions
BEGIN;
UPDATE employees SET salary = salary * 1.1 WHERE department = 'Sales';
ROLLBACK; -- Undoes all changes made since BEGIN;, leaving the table unchanged.(Use COMMIT; instead if you want to make the changes permanent.)

-- bonus: String functions
SELECT name, UPPER(name) AS name_upper, LENGTH(name) AS name_length FROM employees;