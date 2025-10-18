-- Create a new database
CREATE DATABASE my_db;

-- Use the database
USE my_db;

-- Create a table
CREATE TABLE employees (
    id INT,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- INSERT: Add records into the table
INSERT INTO employees (id, name, age, department, salary)
VALUES 
    (1, 'Preethu', 19, 'DSA', 20000),
    (2, 'Swethu', 19, 'Civil', 25000);

-- Display all data
SELECT * FROM employees;

-- UPDATE: Modify an existing record
UPDATE employees
SET department = 'ECE', salary = 22000
WHERE id = 1;

-- Display updated data
SELECT * FROM employees;

-- DELETE (ROW): Remove a specific record
DELETE FROM employees
WHERE id = 2;

-- Display remaining records
SELECT * FROM employees;

-- DELETE (TABLE): Remove the entire table
DROP TABLE employees;

-- DELETE (DATABASE): Remove the entire database
DROP DATABASE my_db;
