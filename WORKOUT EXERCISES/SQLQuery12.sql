-- Create a new database
CREATE DATABASE ControlFlowDB;
USE ControlFlowDB;

-- Create a table
CREATE TABLE StudentTbl(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Marks INT,
    Age INT
);
-- Insert data
INSERT INTO StudentTbl VALUES
(1, 'Arun', 85, 20),
(2, 'Bala', 45, 19),
(3, 'Chitra', 72, 21),
(4, 'Deepa', 30, 18),
(5, 'Elango', 90, 22);

-- IF…ELSE Statement
DECLARE @sid INT = 2;
DECLARE @marks INT;
SELECT @marks = Marks FROM StudentTbl WHERE StudentID = @sid;
IF @marks >= 50
    PRINT 'Student Passed';
ELSE
    PRINT 'Student Failed';

-- WHILE Loop
DECLARE @id INT = 1;
DECLARE @name NVARCHAR(MAX);
WHILE @id <= (SELECT MAX(StudentID) FROM StudentTbl)
BEGIN
    SELECT @name = Name FROM StudentTbl WHERE StudentID = @id;
    IF @name IS NOT NULL
        PRINT @name;
    SET @id = @id + 1;
END

-- BREAK and CONTINUE
DECLARE @i INT = 1, @mark INT;
WHILE @i <= (SELECT MAX(StudentID) FROM StudentTbl)
BEGIN
    SELECT @mark = Marks FROM StudentTbl WHERE StudentID = @i;
    IF @mark < 40
    BEGIN
        SET @i = @i + 1;
        CONTINUE;
    END
    IF @mark = 90
        BREAK;
    PRINT 'StudentID ' + CAST(@i AS VARCHAR) + ' Marks: ' + CAST(@mark AS VARCHAR);
    SET @i = @i + 1;
END

-- GOTO Statement
DECLARE @age INT;
SELECT @age = Age FROM StudentTbl WHERE StudentID = 4;
IF @age < 18
    GOTO NotEligible;
PRINT 'Student eligible for college admission';
RETURN;
NotEligible:
PRINT 'Student not eligible (Age < 18)';

-- RETURN (Stored Procedure)
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
END;

EXEC CheckResults @StudentID = 1;

-- TRY…CATCH
BEGIN TRY
    INSERT INTO StudentTbl (StudentID, Name, Marks, Age)
    VALUES (1, 'Gayathri', 75, 20);
    PRINT 'Insert successful.';
END TRY
BEGIN CATCH
    PRINT 'Insert failed: ' + ERROR_MESSAGE();
END CATCH;

-- View the final data
SELECT * FROM StudentTbl;
