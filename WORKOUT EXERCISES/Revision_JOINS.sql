CREATE DATABASE Joins;
USE Joins;

-- Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50)
);

-- Insert data
INSERT INTO Customers VALUES
(01, 'Alice'),
(02, 'Bob'),
(03, 'Charlie');

INSERT INTO Orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Smartphone'),
(103, 4, 'Tablet');  -- Note: customer_id = 4 does not exist in Customers

--INNER JOIN: only matching customers and orders
SELECT C.customer_name, O.product
FROM Customers C
INNER JOIN Orders O ON C.customer_id = O.customer_id;

--LEFT JOIN: all customers, even if they have no orders
SELECT C.customer_name, O.product
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id;

--RIGHT JOIN: all orders, even if customer does not exist
SELECT C.customer_name, O.product
FROM Customers C
RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

--FULL OUTER JOIN: all customers and all orders
SELECT C.customer_name, O.product
FROM Customers C
FULL OUTER JOIN Orders O ON C.customer_id = O.customer_id;

--CROSS JOIN: all combinations of customers and orders
SELECT C.customer_name, O.product
FROM Customers C
CROSS JOIN Orders O;

