USE Employees;

-- 1. Create Sales table
CREATE TABLE Sales (
    SaleID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50)
);

-- 2. Insert sample data
INSERT INTO Sales (SaleID, ProductName, Quantity, Price, SaleDate, Region) VALUES
(1, 'Laptop', 5, 800.00, '2023-01-10', 'North'),
(2, 'Tablet', 3, 300.00, '2023-01-11', 'South'),
(3, 'Laptop', 2, 820.00, '2023-01-12', 'East'),
(4, 'Phone', 10, 500.00, '2023-01-15', 'West'),
(5, 'Tablet', 6, 310.00, '2023-01-20', 'North'),
(6, 'Laptop', 1, 790.00, '2023-01-22', 'South'),
(7, 'Phone', 4, 480.00, '2023-01-25', 'North');

-- 3. Queries with Aggregate Functions

-- a) Find the total quantity sold
SELECT SUM(Quantity) AS TotalQuantity
FROM Sales;

-- b) Display the average price of all products
SELECT AVG(Price) AS AveragePrice
FROM Sales;

-- c) Find the maximum and minimum price from the Sales table
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Sales;

-- d) Count the total number of sales transactions
SELECT COUNT(*) AS TotalTransactions
FROM Sales;

-- e) Count how many distinct products were sold
SELECT COUNT(DISTINCT ProductName) AS DistinctProducts
FROM Sales;

-- f) Show the total quantity sold per product
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY ProductName;

-- g) Display the average quantity sold per region
SELECT Region, AVG(Quantity) AS AvgQuantity
FROM Sales
GROUP BY Region;

-- h) Find the region with the highest total sales amount (Quantity × Price)
SELECT TOP 1 Region, SUM(Quantity * Price) AS TotalSales
FROM Sales
GROUP BY Region
ORDER BY TotalSales DESC;

-- i) Show each product’s maximum, minimum, and average price
SELECT ProductName,
       MAX(Price) AS MaxPrice,
       MIN(Price) AS MinPrice,
       AVG(Price) AS AvgPrice
FROM Sales
GROUP BY ProductName;
