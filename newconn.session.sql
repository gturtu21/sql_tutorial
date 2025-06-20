SELECT version();

CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT
);

INSERT INTO people (name, age) VALUES
('Alice', 30),
('Bob', 25),
('Charlie', 35);

SELECT * FROM people;
