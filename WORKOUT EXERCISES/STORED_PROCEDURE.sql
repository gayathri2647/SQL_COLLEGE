CREATE DATABASE stored_proc_db;
USE stored_proc_db;

-- Create Students Table
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    Marks INT
);

-- Insert Data into Students Table
INSERT INTO Students1 (StudentID,StudentName, Age, Marks) VALUES
(01,'Gayathri', 19, 85),
(02,'Preetha', 20, 90),
(03,'Siva', 19, 70),
(04,'Yugesh', 18, 95);

--View All Students(No arguments, no return type)
CREATE PROCEDURE GetAllStudents1
AS
BEGIN
    SELECT * FROM Students1;
END;
-- Execute
EXEC GetAllStudents1;

--Add a New Student(With arguments, no return type)
CREATE PROCEDURE AddStudent1
    @ID INT,
    @Name VARCHAR(100),
    @Age INT,
    @Marks INT
AS
BEGIN
    INSERT INTO Students1 (StudentID, StudentName, Age, Marks)
    VALUES (@ID, @Name, @Age, @Marks);
END;
-- Execute
EXEC AddStudent1 @ID= 05, @Name = 'Ameena', @Age = 21, @Marks = 89;

--Get Marks of a Student(With arguments, with return type)
CREATE PROCEDURE GetMarks
    @ID INT
AS
BEGIN
    DECLARE @marks INT;
    SELECT @marks = Marks FROM Students1 WHERE StudentID = @ID;
    RETURN @marks;
END;

-- Execute
DECLARE @Return INT;
EXEC @Return = GetMarks @ID = 1;
PRINT 'Marks: ' + CAST(@Return AS VARCHAR);




