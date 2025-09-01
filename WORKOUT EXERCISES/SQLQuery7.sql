use my_db;

CREATE TABLE sales (
    id INT,
    product VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO sales (id, product, quantity, price) VALUES
(1, 'Pen', 10, 5),
(2, 'Pencil', 20, 2),
(3, 'Pen', 5, 5),
(4, 'Notebook', 7, 15);

SELECT SUM(quantity) AS total_quantity FROM sales; --total quantity sold

SELECT AVG(price) AS average_price FROM sales; --average price

SELECT COUNT(*) AS total_transactions FROM sales; --total no of transactions

SELECT MAX(price) AS highest_price, MIN(price) AS lowest_price FROM sales; --Highest and Lowest Price

SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;  --Total quantity sold per product (with GROUP BY)
