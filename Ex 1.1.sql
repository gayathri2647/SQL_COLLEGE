-- 1. Create a database UniversityDB
CREATE DATABASE UniversityDB;

-- 2. Use the UniversityDB
USE UniversityDB;

-- 3. Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(50),
    GPA DECIMAL(3,2)
);

-- 4. Insert a single student named Johnson
INSERT INTO Students (StudentID, FirstName, LastName, Major, GPA)
VALUES (1, 'John', 'Johnson', 'Computer Science', 3.75);

-- 5. Insert all three students at once
INSERT INTO Students (StudentID, FirstName, LastName, Major, GPA)
VALUES 
(2, 'Bala', 'Kumar', 'Biology', 3.40),
(3, 'Keerthana', 'Rao', 'Mathematics', 3.60),
(4, 'Amit', 'Shah', 'Physics', 3.50);

-- 6. Update Bala's major from Biology to Psychology
UPDATE Students
SET Major = 'Psychology'
WHERE FirstName = 'Bala' AND LastName = 'Kumar';

-- 7. Delete Keerthana's record
DELETE FROM Students
WHERE FirstName = 'Keerthana' AND LastName = 'Rao';

-- 8. Delete the Students table
DROP TABLE Students;

-- 9. Delete the UniversityDB database
DROP DATABASE UniversityDB;


