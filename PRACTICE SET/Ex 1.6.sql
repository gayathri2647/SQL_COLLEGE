USE Employees;

-- 1. Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    ProductName VARCHAR(50),
    OrderDate DATE,
    City VARCHAR(50)
);

-- 2. Insert sample data
INSERT INTO Orders (OrderID, CustomerName, ProductName, OrderDate, City) VALUES
(1, 'Alice', 'Laptop', '2023-01-10', 'New York'),
(2, 'Bob', 'Tablet', '2023-01-11', 'Chicago'),
(3, 'Alice', 'Laptop', '2023-01-12', 'New York'),
(4, 'Carol', 'Phone', '2023-02-05', 'Boston'),
(5, 'David', 'Laptop', '2023-02-06', 'Chicago'),
(6, 'Eva', 'Tablet', '2023-02-07', 'New York');

-- 3. Queries with DISTINCT

-- a) Display all unique product names
SELECT DISTINCT ProductName FROM Orders;

-- b) List all the distinct cities where orders have been placed
SELECT DISTINCT City FROM Orders;

-- c) Find the unique combinations of customer name and city
SELECT DISTINCT CustomerName, City FROM Orders;

-- d) Count the total number of unique customers who placed orders
SELECT COUNT(DISTINCT CustomerName) AS UniqueCustomers FROM Orders;

-- e) List the different order dates on which any order was placed
SELECT DISTINCT OrderDate FROM Orders;

-- f) Show difference: with DISTINCT vs without
SELECT DISTINCT ProductName FROM Orders;  -- unique product names
SELECT ProductName FROM Orders;           -- duplicates included
