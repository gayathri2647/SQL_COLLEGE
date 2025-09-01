CREATE DATABASE Employees;

USE Employees;

-- Create Employees table
CREATE TABLE Emp (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    Email VARCHAR(100)
);

-- Insert sample values
INSERT INTO Emp (EmpID, Name, DeptID, Salary, HireDate, Email) VALUES
(1, 'Alice Johnson', 1, 50000, '2020-01-15', 'alice@company.com'),
(2, 'Bob Smith', 2, 75000, '2019-03-10', 'bob@company.com'),
(3, 'Carol Lee', 2, 72000, '2021-06-25', 'carol@gmail.com'),
(4, 'David Kim', 3, 67000, '2018-09-12', 'david@company.com'),
(5, 'Eva Brown', 1, 52000, '2022-02-01', 'eva@company.com'),
(6, 'Frank White', 4, 60000, '2020-11-30', 'frank@company.com');

-- 1. Display all employee names in uppercase
SELECT UPPER(Name) AS EmployeeName FROM Emp;

-- 2. Show the first 3 characters of each employee's name
SELECT LEFT(Name, 3) AS ShortName FROM Emp;

-- 3. Find employees whose email ends with "@company.com"
SELECT * FROM Emp WHERE Email LIKE '%@company.com';

-- 4. Concatenate employee name and email as a single string
SELECT CONCAT(Name, ' - ', Email) AS NameEmail FROM Emp;

-- 5. Show employee names and their salary rounded to the nearest thousand
SELECT Name, ROUND(Salary, -3) AS RoundedSalary FROM Emp;

-- 6. Find the highest and lowest salary among employees
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Emp;

-- 7. Display employee name and the square root of their salary
SELECT Name, SQRT(Salary) AS SalaryRoot FROM Emp;

-- 8. List employees with a salary above the average salary
SELECT Name, Salary FROM Emp
WHERE Salary > (SELECT AVG(Salary) FROM Emp);

-- 9. Show all employees and how many years they have worked in the company
SELECT Name, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
FROM Emp;

-- 10. List employees who joined in the last 1 year
SELECT Name,HireDate FROM Emp
WHERE HireDate >= DATEADD(YEAR, -1, GETDATE());


-- 11. Display the employee name and day of the week they were hired
SELECT Name, DATENAME(WEEKDAY, HireDate) AS HireDay
FROM Emp;

-- 12. Add 3 months to the hire date and show the result
SELECT Name, DATEADD(MONTH, 3, HireDate) AS HireDatePlus3Months
FROM Emp;