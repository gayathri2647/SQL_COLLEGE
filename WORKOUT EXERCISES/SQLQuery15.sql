CREATE DATABASE Store_DB;
USE Store_DB;

-- Create Sample Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    Marks INT
);

INSERT INTO Students (StudentID, StudentName, Department, Marks) VALUES
(1, 'John Doe', 'CSE', 85),
(2, 'Jane Smith', 'ECE', 90),
(3, 'Sam Brown', 'MECH', 78);

--Simple Example using Students Table
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
GO

-- Execute:
EXEC GetAllStudents;
GO

--Stored Procedure with Input Parameter
CREATE PROCEDURE GetStudentByID
    @StudentID INT
AS
BEGIN
    SELECT * FROM Students
    WHERE StudentID = @StudentID;
END;
GO

-- Execute:
EXEC GetStudentByID @StudentID = 1;
GO

--Stored Procedure with Output Parameter
CREATE PROCEDURE GetStudentMarks
    @StudentID INT,
    @Marks INT OUTPUT
AS
BEGIN
    SELECT @Marks = Marks
    FROM Students
    WHERE StudentID = @StudentID;
END;
GO

-- Execute:
DECLARE @StudentMarks INT;
EXEC GetStudentMarks @StudentID = 1, @Marks = @StudentMarks OUTPUT;
PRINT 'Marks: ' + CAST(@StudentMarks AS VARCHAR);
GO

--Stored Procedure with INSERT
CREATE PROCEDURE AddNewStudent
    @StudentName VARCHAR(100),
    @Department VARCHAR(50),
    @Marks INT
AS
BEGIN
    INSERT INTO Students (StudentName, Department, Marks)
    VALUES (@StudentName, @Department, @Marks);
END;
GO

-- Execute:
EXEC AddNewStudent @StudentName='Anu', @Department='ECE', @Marks=88;
GO


--Example – Sales Database
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- Insert Sample Data
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Laptop', 50000, 10),
('Mobile', 20000, 25),
('Headphones', 1500, 50);
GO


--Stored Procedures for Sales Database

-- 1. View All Products
CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * FROM Products;
END;
GO

-- Execute:
EXEC GetAllProducts;
GO


-- 2. Add New Sale (with Stock Check)
CREATE PROCEDURE AddSale
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    DECLARE @Price DECIMAL(10,2);
    DECLARE @Stock INT;

    -- Get current stock and price
    SELECT @Stock = Stock, @Price = Price FROM Products WHERE ProductID = @ProductID;

    IF @Stock >= @Quantity
    BEGIN
        INSERT INTO Sales (ProductID, Quantity, TotalAmount)
        VALUES (@ProductID, @Quantity, @Quantity * @Price);

        UPDATE Products
        SET Stock = Stock - @Quantity
        WHERE ProductID = @ProductID;

        PRINT 'Sale recorded successfully!';
    END
    ELSE
    BEGIN
        PRINT 'Not enough stock!';
    END
END;
GO

-- Execute Example:
EXEC AddSale @ProductID = 1, @Quantity = 2;
GO


-- 3. View Sales by Product
CREATE PROCEDURE GetSalesByProduct
    @ProductID INT
AS
BEGIN
    SELECT SaleID, ProductID, Quantity, TotalAmount, SaleDate
    FROM Sales
    WHERE ProductID = @ProductID;
END;
GO

-- Execute Example:
EXEC GetSalesByProduct @ProductID = 1;
GO


-- 4. Update Product Price
CREATE PROCEDURE UpdateProductPrice
    @ProductID INT,
    @NewPrice DECIMAL(10,2)
AS
BEGIN
    UPDATE Products
    SET Price = @NewPrice
    WHERE ProductID = @ProductID;

    PRINT 'Product price updated successfully!';
END;
GO

-- Execute Example:
EXEC UpdateProductPrice @ProductID = 2, @NewPrice = 21000;
GO
