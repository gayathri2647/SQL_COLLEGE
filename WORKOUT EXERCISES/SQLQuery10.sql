CREATE DATABASE comp_db;
USE comp_db;

CREATE TABLE IT_Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(20)
);

CREATE TABLE HR_Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(20)
);

INSERT INTO IT_Employees VALUES
(1, 'Alice', 'IT'),
(2, 'Bob', 'IT'),
(3, 'Charlie', 'IT');

INSERT INTO HR_Employees VALUES
(4, 'David', 'HR'),
(5, 'Eve', 'HR'),
(2, 'Bob', 'HR'); 

--union remove duplicates
SELECT emp_id, emp_name, department FROM IT_Employees
UNION
SELECT emp_id, emp_name, department FROM HR_Employees;

--union all keeps duplicates
SELECT emp_id, emp_name, department FROM IT_Employees
UNION ALL
SELECT emp_id, emp_name, department FROM HR_Employees;

