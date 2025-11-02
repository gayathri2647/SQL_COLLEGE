CREATE DATABASE CompanyDB;

USE CompanyDB;

Create table Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, City, Salary, HireDate) VALUES
(1001, 'Alice', 'Johnson', 'HR', 'New York', 50000.00, '2020-01-15'),
(1002, 'Bob', 'Smith', 'IT', 'Chicago', 75000.00, '2019-03-10'),
(1003, 'Carol', 'Lee', 'IT', 'San Francisco', 72000.00, '2021-06-25'),
(1004, 'David', 'Kim', 'Finance', 'New York', 67000.00, '2018-09-12'),
(1005, 'Eva', 'Brown', 'HR', 'Boston', 52000.00, '2022-02-01'),
(1006, 'Frank', 'White', 'Marketing', 'Seattle', 60000.00, '2020-11-30');

-- 1. Display all columns for all employees
SELECT * FROM Employees;

-- 2. Display only FirstName, LastName, and Salary
SELECT FirstName, LastName, Salary 
FROM Employees;

-- 3. Find all employees in the IT department
SELECT * FROM Employees
WHERE Department = 'IT';

-- 4. Find employees in New York who earn more than $60,000
SELECT * FROM Employees
WHERE City = 'New York' AND Salary > 60000;

-- 5. List all employees ordered by Salary in descending order
SELECT * FROM Employees
ORDER BY Salary DESC;

-- 6. Find employees hired between '2020-01-01' and '2021-12-31'
SELECT * FROM Employees
WHERE HireDate BETWEEN '2020-01-01' AND '2021-12-31';

-- 7. Find the average salary for each department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- 8. Find employees whose last names start with 'B'
SELECT * 
FROM Employees
WHERE LastName LIKE '%B';

-- 9. Show departments where the average salary is greater than $60,000
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 60000;

-- 10. Retrieve students from specific departments
SELECT * FROM Employees
WHERE department IN ('HR', 'IT');

