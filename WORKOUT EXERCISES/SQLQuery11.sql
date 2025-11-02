--Create a new database
CREATE DATABASE Views;
USE Views;

--CREATE BASE TABLE
CREATE TABLE Student1 (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Department NVARCHAR(100),
    GPA DECIMAL(3,2)
);

--INSERT DATA
INSERT INTO Student1 VALUES 
(1, 'Alice', 'Johnson', 20, 'F', 'CS', 3.80),
(2, 'Bob', 'Smith', 22, 'M', 'Math', 2.90),
(3, 'Carol', 'White', 21, 'F', 'CS', 3.95),
(4, 'David', 'Green', 23, 'M', 'Physics', 2.70),
(5, 'Eva', 'Brown', 20, 'F', 'CS', 3.50);

--CREATE A VIEW (for Computer Science students)
CREATE VIEW CS_Students AS
SELECT StudentID, FirstName, LastName, GPA
FROM Student1
WHERE Department = 'CS';

--Display the CS_Students view
SELECT * FROM CS_Students;

--ALTER THE VIEW (for students with GPA >= 3.0)
ALTER VIEW CS_Students AS
SELECT StudentID, FirstName, LastName, GPA
FROM Student1
WHERE GPA >= 3.0;

-- Display updated view
SELECT * FROM CS_Students;

--UPDATE DATA THROUGH VIEW
UPDATE CS_Students
SET GPA = 4.00
WHERE StudentID = 1;
-- Verify update
SELECT * FROM Student1;

--CREATE INSERTABLE VIEW (all columns)
SELECT StudentID, FirstName, LastName, GPA
FROM Student1;

-- Insert a new record using the view
INSERT INTO CS_Students
VALUES (6, 'John', 'Doe', 3.10);
-- Verify insertion
SELECT * FROM Student1;

--DELETE DATA THROUGH VIEW
DELETE FROM CS_Students
WHERE StudentID = 3;
-- Verify deletion
SELECT * FROM Student1;

--DROP THE VIEW
DROP VIEW CS_Students;

-- Final check on base table
SELECT * FROM Student1;
