--Create databases and use it
CREATE DATABASE Constraintdb;
USE Constraintdb;

--Create the referenced table (Parent Table)
CREATE TABLE dept (
  dept_id INT PRIMARY KEY,            -- PRIMARY KEY constraint
  dept_name VARCHAR(50) UNIQUE        -- UNIQUE constraint
);

--Create the IT employee table (Child Table)
CREATE TABLE IT (
  id INT PRIMARY KEY,                 -- PRIMARY KEY constraint
  email VARCHAR(50) UNIQUE,           -- UNIQUE constraint
  name VARCHAR(100) NOT NULL,         -- NOT NULL constraint
  age INT CHECK (age >= 20 AND age <= 60), -- CHECK constraint
  gender VARCHAR(10),
  dept_id INT,
  salary FLOAT DEFAULT 50000,         -- DEFAULT constraint
  FOREIGN KEY (dept_id) REFERENCES dept(dept_id) -- FOREIGN KEY constraint
);

--Insert records into the 'dept' table
INSERT INTO dept (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');

--Insert 5 records into the 'IT' table
INSERT INTO IT (id, email, name, age, gender, dept_id) VALUES
(201, 'alice@company.com', 'Alice Smith', 30, 'Female', 1),
(202, 'bob@company.com', 'Bob Johnson', 42, 'Male', 3),
(203, 'carol@company.com', 'Carol White', 29, 'Female', 2),
(204, 'dave@company.com', 'Dave Brown', 35, 'Male', 4),
(205, 'eve@company.com', 'Eve Davis', 27, 'Other', 5);

--Display the records from both tables
SELECT * FROM dept;
SELECT * FROM IT;
