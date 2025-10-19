-- Create and use a database
CREATE DATABASE retrieve;

-- Use the existing database
USE retrieve;

-- Create table for student details
CREATE TABLE stud_details (
    roll_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50)
);

-- Insert records into the table
INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES
(301, 'Emma', 20, 'Female', 'Computer Science'),
(302, 'John', 21, 'Male', 'Information Technology'),
(303, 'Olivia', 22, 'Female', 'Data Science');

-- Retrieve all columns from the table
SELECT * FROM stud_details;

-- Update names for specific roll numbers
UPDATE stud_details
SET name = 'Bob'
WHERE roll_no = 302;

-- Retrieve a particular row
SELECT * FROM stud_details
WHERE roll_no = 303;

-- Retrieve specific columns
SELECT name, department FROM stud_details;

-- Retrieve all students sorted by age in descending order
SELECT * FROM stud_details
ORDER BY age DESC;

-- Retrieve unique ages
SELECT DISTINCT age FROM stud_details;

-- Retrieve students whose name starts with 'O'
SELECT * FROM stud_details
WHERE name LIKE 'O%';

-- Retrieve students whose age is between 20 and 23
SELECT * FROM stud_details
WHERE age BETWEEN 20 AND 21;

-- Retrieve students from specific departments
SELECT * FROM stud_details
WHERE department IN ('Computer Science', 'Data Science');

-- Retrieve and rename columns using aliases
SELECT department AS 'Dept_Name', name AS 'Stud_Name'
FROM stud_details;

