/*
====================================================
Task 3: Filtering Data Using WHERE, AND, OR, LIKE
Internship: SQL Developer Internship
Database: MySQL (Compatible with PostgreSQL & SQLite)
====================================================
*/

-- -------------------------------------------------
-- 1. Create Database & Table
-- -------------------------------------------------

CREATE DATABASE IF NOT EXISTS internship_db;
USE internship_db;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    city VARCHAR(50),
    enrollment_date DATE
);

-- -------------------------------------------------
-- 2. Insert Sample Data
-- -------------------------------------------------

INSERT INTO students (name, age, email, city, enrollment_date) VALUES
('Amit Sharma', 21, 'amit.sharma@gmail.com', 'Delhi', '2023-01-15'),
('Neha Verma', 22, 'neha.verma@yahoo.com', 'Mumbai', '2023-02-10'),
('Rahul Singh', 20, 'rahul.singh@gmail.com', 'Pune', '2023-03-05'),
('Priya Patel', 23, NULL, 'Ahmedabad', '2023-01-25'),
('Ankit Kumar', 21, 'ankit.kumar@gmail.com', 'Delhi', '2023-04-12'),
('Sneha Joshi', 19, 'sneha_j@gmail.com', 'Jaipur', '2023-05-20'),
('Rohit Mehta', 24, 'rohit.mehta@outlook.com', 'Mumbai', '2023-06-01');

-- -------------------------------------------------
-- 3. Filter Using WHERE Clause
-- -------------------------------------------------

-- Students older than 21
SELECT *
FROM students
WHERE age > 21;

-- -------------------------------------------------
-- 4. Using AND / OR Conditions
-- -------------------------------------------------

-- Students from Delhi AND age above 20
SELECT *
FROM students
WHERE city = 'Delhi' AND age > 20;

-- Students from Mumbai OR Delhi
SELECT *
FROM students
WHERE city = 'Mumbai' OR city = 'Delhi';

-- -------------------------------------------------
-- 5. Using LIKE with Wildcards
-- -------------------------------------------------

-- Names starting with 'A'
SELECT *
FROM students
WHERE name LIKE 'A%';

-- Emails containing 'gmail'
SELECT *
FROM students
WHERE email LIKE '%gmail%';

-- Names with exactly 5 characters
SELECT *
FROM students
WHERE name LIKE '_____';

-- -------------------------------------------------
-- 6. Using IN Operator
-- -------------------------------------------------

-- Students from selected cities
SELECT *
FROM students
WHERE city IN ('Delhi', 'Mumbai', 'Pune');

-- -------------------------------------------------
-- 7. Using BETWEEN Operator
-- -------------------------------------------------

-- Students aged between 20 and 22
SELECT *
FROM students
WHERE age BETWEEN 20 AND 22;

-- Enrollment between specific dates
SELECT *
FROM students
WHERE enrollment_date BETWEEN '2023-01-01' AND '2023-03-31';

-- -------------------------------------------------
-- 8. Handling NULL Values
-- -------------------------------------------------

-- Students with missing email
SELECT *
FROM students
WHERE email IS NULL;

-- Students with available email
SELECT *
FROM students
WHERE email IS NOT NULL;

-- -------------------------------------------------
-- 9. Using Aliases for Readability
-- -------------------------------------------------

SELECT 
    s.student_id AS ID,
    s.name AS Student_Name,
    s.age AS Age,
    s.city AS City
FROM students s
WHERE s.age > 20;

-- -------------------------------------------------
-- 10. Real-Life Scenario: Email Search
-- -------------------------------------------------

-- Find students using Gmail from Delhi
SELECT *
FROM students
WHERE email LIKE '%gmail%' AND city = 'Delhi';

-- -------------------------------------------------
-- 11. Understanding Query Execution Order
-- -------------------------------------------------
/*
Execution Order:
1. FROM
2. WHERE
3. SELECT
4. ORDER BY
*/

SELECT name, age, city
FROM students
WHERE age > 20
ORDER BY age DESC;

-- -------------------------------------------------
-- End of Task 3
-- -------------------------------------------------
