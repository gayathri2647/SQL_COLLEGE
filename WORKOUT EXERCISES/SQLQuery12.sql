use my_db;

CREATE TABLE Stud1(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Age INT
);

INSERT INTO Stud1 VALUES
(1, 'Arun', 85, 20),
(2, 'Bala', 45, 19),
(3, 'Chitra', 72, 21),
(4, 'Deepa', 30, 18),
(5, 'Elango', 90, 22);

--If…ELSE Example

DECLARE @sid INT = 2;
DECLARE @marks INT;

SELECT @marks = Marks FROM Stud1 WHERE StudentID = @sid;

IF @marks >= 50
    PRINT 'Student Passed';
ELSE
    PRINT 'Student Failed';

--WHILE Loop Example

DECLARE @id INT = 1;
WHILE @id <= (SELECT MAX(StudentID) FROM Stud1)
BEGIN
    PRINT (SELECT Name FROM Stud1 WHERE StudentID = @id);
    SET @id = @id + 1;
END


--BREAK and CONTINUE Example

DECLARE @i INT = 1, @mark INT;
WHILE @i <= (SELECT MAX(StudentID) FROM Stud1)
BEGIN
    SELECT @mark = Marks FROM Stud1 WHERE StudentID = @i;

    IF @mark < 40
    BEGIN
        SET @i = @i + 1;
        CONTINUE;  -- skip failed students
    END

    IF @mark = 90
        BREAK;  -- stop when topper is found

    PRINT 'StudentID ' + CAST(@i AS VARCHAR) + ' Marks: ' + CAST(@mark AS VARCHAR);
    SET @i = @i + 1;
END

--GOTO Example

DECLARE @age INT;
SELECT @age = Age FROM Stud1 WHERE StudentID = 4;

IF @age < 18
    GOTO NotEligible;

PRINT 'Student eligible for college admission';
RETURN;

NotEligible:
PRINT 'Student not eligible (Age < 18)';

--RETURN Example (Stored Procedure)

GO
CREATE PROCEDURE CheckResult @StudentID INT
AS
BEGIN
    DECLARE @marks INT;
    SELECT @marks = Marks FROM Stud1 WHERE StudentID = @StudentID;

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
GO

-- Run
EXEC CheckResult 2;

--TRY…CATCH Example
BEGIN TRY
    DECLARE @avg FLOAT;
    SELECT @avg = SUM(Marks) / COUNT(*) 
    FROM Stud1 
    WHERE Age < 0; -- invalid case
    PRINT 'Average Marks = ' + CAST(@avg AS VARCHAR);
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

