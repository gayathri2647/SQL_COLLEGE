CREATE DATABASE Employees1;

USE Employees1;

-- 1. Create Employees table
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Gender VARCHAR(10)
);

-- 2. Insert sample data
INSERT INTO Employees (EmpID, Name, Department, Salary, Gender) VALUES
(1, 'Alice', 'HR', 50000, 'Female'),
(2, 'Bob', 'IT', 75000, 'Male'),
(3, 'Carol', 'IT', 72000, 'Female'),
(4, 'David', 'Finance', 67000, 'Male'),
(5, 'Eva', 'HR', 52000, 'Female'),
(6, 'Frank', 'Marketing', 60000, 'Male'),
(7, 'Grace', 'Finance', 64000, 'Female'),
(8, 'Henry', 'IT', 80000, 'Male'),
(9, 'Ivy', 'HR', 55000, 'Female'),
(10, 'Jack', 'IT', 70000, 'Male');

-- 3. Queries using GROUP BY

-- a) Show the total salary paid to each department
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- b) Count the number of employees in each department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- c) Display the average salary for each department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- d) Count the number of male and female employees
SELECT Gender, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Gender;

-- e) List the highest salary paid in each department
SELECT Department, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department;

-- f) Find departments that have more than 5 employees
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 5;

-- g) Show total salary by department and gender
SELECT Department, Gender, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department, Gender;

-- h) Try running a SELECT with a column not in GROUP BY or aggregate (will cause error)
SELECT Department, Name, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;
