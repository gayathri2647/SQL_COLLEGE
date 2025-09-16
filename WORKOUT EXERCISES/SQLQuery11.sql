use my_db;

-- Creating the base Student table
CREATE TABLE Student1 (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Department NVARCHAR(100),
    GPA DECIMAL(3,2)
);

-- Inserting sample data
INSERT INTO Student1 VALUES 
(1, 'Alice', 'Johnson', 20, 'F', 'CS', 3.80),
(2, 'Bob', 'Smith', 22, 'M', 'Math', 2.90),
(3, 'Carol', 'White', 21, 'F', 'CS', 3.95),
(4, 'David', 'Green', 23, 'M', 'Physics', 2.70);

-----------------------------------------------------
-- CREATE VIEWS
-----------------------------------------------------

--Computer Science Students
CREATE VIEW CS_Students AS
SELECT StudentID, FirstName, LastName, GPA
FROM Student1
WHERE Department = 'CS';

-----------------------------------------------------
-- UPDATING A VIEW
-----------------------------------------------------
ALTER VIEW CS_Students AS
SELECT StudentID, FirstName, LastName, GPA
FROM Student1
WHERE GPA >= 3.0;

-----------------------------------------------------
-- UPDATING DATA THROUGH A VIEW
-----------------------------------------------------
UPDATE CS_Students
SET GPA = 4.00
WHERE StudentID = 1;

-----------------------------------------------------
-- INSERTING DATA THROUGH A VIEW
-----------------------------------------------------
-- First create an insertable view including all columns
CREATE VIEW Insertable_Student1View AS
SELECT StudentID, FirstName, LastName, Age, Gender, Department, GPA
FROM Student1;

-- Insert into the Student table via the view
INSERT INTO Insertable_Student1View
VALUES (6, 'John', 'Doe', 21, 'M', 'Math', 3.10);

-----------------------------------------------------
-- DELETING DATA THROUGH A VIEW
-----------------------------------------------------
DELETE FROM CS_Students
WHERE StudentID = 3;

-----------------------------------------------------
-- DROPPING A VIEW
-----------------------------------------------------
DROP VIEW CS_Students;

select * from CS_Students;

select * from Student1;
