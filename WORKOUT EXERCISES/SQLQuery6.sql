--Create database and use it
CREATE DATABASE Distinctdb;
USE Distinctdb;

--Create the table 'stud_details'
CREATE TABLE stud_details (
    roll_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50)
);

--Insert records into 'stud_details'
INSERT INTO stud_details (roll_no, name, age, gender, department) VALUES
(201, 'Alice', 20, 'Female', 'CS'),
(202, 'Bob', 21, 'Male', 'IT'),
(203, 'Charlie', 22, 'Male', 'ME'),
(204, 'Alice', 20, 'Female', 'CS'),
(205, 'Eva', 23, 'Female', 'EE'),
(206, 'Bob', 21, 'Male', 'IT');

--Retrieve unique combinations of name and department
SELECT DISTINCT name, department
FROM stud_details;

--Retrieve unique names only
SELECT DISTINCT name 
FROM stud_details;

--Retrieve unique combinations of name and age
SELECT DISTINCT name, age 
FROM stud_details;
