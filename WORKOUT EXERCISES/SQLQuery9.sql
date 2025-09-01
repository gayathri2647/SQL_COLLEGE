CREATE DATABASE JoinExamples;
USE JoinExamples;

--Inner Join
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Abilash'),
(2, 'Kanna'),
(3, 'Jithu');

INSERT INTO Orders (order_id, customer_id, product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Smartphone'),
(103, 4, 'Tablet');

--Customers with their orders
SELECT C.customer_name, O.product
FROM Customers C
INNER JOIN Orders O ON C.customer_id = O.customer_id;

--Left Join
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    author_id INT,
    title VARCHAR(50)
);

INSERT INTO Authors VALUES
(1, 'Shakespeare'), (2, 'Hemingway'), (3, 'Orwell');

INSERT INTO Books VALUES
(201, 1, 'Hamlet'),
(202, 1, 'Macbeth'),
(203, 2, 'The Old Man and the Sea');

--All authors,even if no book
SELECT A.author_name, B.title
FROM Authors A
LEFT JOIN Books B ON A.author_id = B.author_id;

--Right Join
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees_R (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO Departments VALUES
(10, 'HR'), (20, 'IT'), (30, 'Finance');

INSERT INTO Employees_R VALUES
(1, 'Eva', 20),
(2, 'Daniel', 30);

--All departments,even if no employee
SELECT E.emp_name, D.dept_name
FROM Employees_R E
RIGHT JOIN Departments D ON E.dept_id = D.dept_id;

--Full Outer Join
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50)
);

CREATE TABLE Subjects (
    sub_id INT PRIMARY KEY,
    teacher_id INT,
    sub_name VARCHAR(50)
);

INSERT INTO Teachers VALUES
(1, 'Mr.Binu'), (2, 'Mrs.Saji'), (3, 'Mrs.Lola');

INSERT INTO Subjects VALUES
(301, 1, 'Tamil'),
(302, 4, 'Physics');

--all teachers + all subjects
SELECT T.teacher_name, S.sub_name
FROM Teachers T
FULL OUTER JOIN Subjects S ON T.teacher_id = S.teacher_id;

--Cross Join
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE Models (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(50)
);

INSERT INTO Brands VALUES
(1, 'Toyota'), (2, 'Ford');

INSERT INTO Models VALUES
(1, 'Sedan'), (2, 'SUV');

--All combinations
SELECT B.brand_name, M.model_name
FROM Brands B
CROSS JOIN Models M;


