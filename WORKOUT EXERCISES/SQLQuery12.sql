CREATE DATABASE ControlFlowDB;
USE ControlFlowDB;

-- Table
CREATE TABLE StudentTbl(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Marks INT,
    Age INT
);

-- Sample Data
INSERT INTO StudentTbl VALUES
(1, 'Arun', 85, 20),
(2, 'Bala', 45, 19),
(3, 'Chitra', 72, 21),
(4, 'Deepa', 30, 18),
(5, 'Elango', 90, 22);

------------------------------1. IF…ELSE---------------------------------------------
-- Check whether a student passed or failed
DECLARE @sid INT = 2;
DECLARE @marks INT;

SELECT @marks = Marks FROM StudentTbl WHERE StudentID = @sid;

IF @marks >= 50
    PRINT 'Student Passed';
ELSE
    PRINT 'Student Failed';

-----------------------------------2. WHILE Loop--------------------------------------
-- Print all student names one by one
DECLARE @id INT = 1;
DECLARE @name NVARCHAR(MAX);

WHILE @id <= (SELECT MAX(StudentID) FROM StudentTbl)
BEGIN
    SELECT @name = Name FROM StudentTbl WHERE StudentID = @id;
    IF @name IS NOT NULL
        PRINT @name;
    SET @id = @id + 1;
END

-------------------------3. BREAK and CONTINUE--------------------------------
-- Skip students with marks < 40, stop when marks = 90
DECLARE @i INT = 1, @mark INT;

WHILE @i <= (SELECT MAX(StudentID) FROM StudentTbl)
BEGIN
    SELECT @mark = Marks FROM StudentTbl WHERE StudentID = @i;

    IF @mark < 40
    BEGIN
        SET @i = @i + 1;
        CONTINUE; -- skip failed students
    END

    IF @mark = 90
        BREAK; -- stop when topper is found

    PRINT 'StudentID ' + CAST(@i AS VARCHAR) + ' Marks: ' + CAST(@mark AS VARCHAR);
    SET @i = @i + 1;
END

-----------------------------------4. GOTO--------------------------------------------
-- Jump to a label if a condition is met
DECLARE @age INT;
SELECT @age = Age FROM StudentTbl WHERE StudentID = 4;

IF @age < 18
    GOTO NotEligible;

PRINT 'Student eligible for college admission';
RETURN;

NotEligible:
PRINT 'Student not eligible (Age < 18)';

----------------------------------5. RETURN (Stored Procedure)------------------------
-- Check student result using a stored procedure
CREATE PROCEDURE CheckResults
    @StudentID INT
AS
BEGIN
    DECLARE @marks INT;
    SELECT @marks = Marks FROM StudentTbl WHERE StudentID = @StudentID;

    IF @marks IS NULL
    BEGIN
        PRINT 'No Student Found';
        RETURN;
    END

    IF @marks >= 50
        PRINT 'Pass';
    ELSE
        PRINT 'Fail';
END

-- Execute procedure
EXEC CheckResults @StudentID = 1;

-----------------------------------------------6. TRY…CATCH---------------------------
-- Handle errors (e.g., inserting duplicate primary key)
BEGIN TRY
    INSERT INTO StudentTbl (StudentID, Name, Age, Marks) VALUES (1,'Gayathri', 20, 75); -- Duplicate StudentID will fail 
    PRINT 'Insert successful.';
END TRY
BEGIN CATCH
    PRINT 'Insert failed: ' + ERROR_MESSAGE();
END CATCH

-- View final data
SELECT * FROM StudentTbl;