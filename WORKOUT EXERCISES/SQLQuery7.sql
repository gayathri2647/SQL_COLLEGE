--Create database and use it
CREATE DATABASE Aggregatedb;
USE Aggregatedb;

--Create the 'sales' table
CREATE TABLE sales (
    id INT,
    product VARCHAR(50),
    quantity INT,
    price INT
);

--Insert records into the 'sales' table
INSERT INTO sales (id, product, quantity, price) VALUES
(1, 'Pen', 10, 5),
(2, 'Pencil', 20, 2),
(3, 'Pen', 5, 5),
(4, 'Notebook', 7, 15);

--Calculate total quantity sold
SELECT SUM(quantity) AS total_quantity FROM sales;

--Calculate average price of products
SELECT AVG(price) AS average_price FROM sales;

--Count total number of transactions
SELECT COUNT(*) AS total_transactions FROM sales;

--Find highest and lowest price
SELECT MAX(price) AS highest_price, MIN(price) AS lowest_price FROM sales;

--Calculate total quantity sold per product
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;
