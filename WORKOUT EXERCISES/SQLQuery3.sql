-- Create database
CREATE DATABASE subqueries;
-- Use database
USE subqueries;

-- Create table with constraints
CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 20 AND age <= 60),
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    department VARCHAR(50) DEFAULT 'General',
    salary FLOAT CHECK (salary >= 0)
);

-- Insert employee records
INSERT INTO emp (id, name, age, gender, department, salary) VALUES
(101, 'Alice', 30, 'Female', 'CS', 75000),
(102, 'Bob', 45, 'Male', 'HR', 60000),
(103, 'Charlie', 28, 'Other', 'DSA', 50000),
(104, 'David', 40, 'Male', 'CEO', 85000),
(105, 'Eva', 35, 'Female', 'CS', 45000);

--Retrieve employee(s) with the highest salary
SELECT name, salary
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp);

--Retrieve employees working in 'HR' or 'SD' departments
--using a subquery with IN clause
SELECT name
FROM emp
WHERE department IN (
    SELECT department 
    FROM emp 
    WHERE department IN ('HR', 'SD')
);

--Retrieve employees whose salary is greater than 
--the average salary of their department
SELECT e1.name, e1.salary
FROM emp e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM emp e2
    WHERE e2.department = e1.department
);

--Retrieve each department and its average salary
SELECT department, AVG(salary) AS AvgSalary
FROM emp
GROUP BY department;

--Retrieve all employees with their individual salary 
--and the overall average salary of all employees
SELECT 
    name,
    salary,
    (SELECT AVG(salary) FROM emp) AS avg_salary
FROM emp;

-- Display all data
SELECT * FROM emp;