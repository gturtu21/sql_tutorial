SELECT version();


CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    grade VARCHAR(2)
);

-- Insert some sample student records
INSERT INTO students (name, age, grade) VALUES
('Alice Johnson', 14, 'A'),
('Bob Smith', 15, 'B'),
('Carol White', 14, 'A+');

SELECT * FROM students;

SELECT name, grade FROM students;

SELECT * FROM students WHERE age = 14;

SELECT * FROM students WHERE name LIKE 'A%'; -- Names starting with A

-- Updata students grade
UPDATE students
SET grade = 'A' WHERE name = 'Carol White'


-- delete a students based on id
DELETE FROM students
WHERE id = 2;

SELECT * FROM students;

--Count how many students got an A grade
SELECT COUNT(*) FROM students WHERE grade = 'A';
--Order by age
SELECT * FROM students ORDER BY age DESC;
--Get unique grade
SELECT DISTINCT grade FROM students;
--Permanently delete table
DROP TABLE students;

