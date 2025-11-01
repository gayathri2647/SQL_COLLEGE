CREATE DATABASE stored_proc_db;
USE stored_proc_db;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    Marks INT
);

-- Insert Data into Students Table
INSERT INTO Students (StudentName, Age, Marks) VALUES
('Gayathri', 19, 85),
('Preetha', 20, 90),
('Siva', 19, 70),
('Yugesh', 18, 95);

--View All Students(No arguments, no return type)
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
-- Execute
EXEC GetAllStudents;

--Add a New Student(With arguments, no return type)
CREATE PROCEDURE AddStudent
    @Name VARCHAR(100),
    @Age INT,
    @Marks INT
AS
BEGIN
    INSERT INTO Students (StudentName, Age, Marks)
    VALUES (@Name, @Age, @Marks);
    PRINT 'New student added successfully!';
END;
-- Execute
EXEC AddStudent @Name = 'Ameena', @Age = 21, @Marks = 89;

--View Student by ID(With argument, returns matching record)
CREATE PROCEDURE GetStudentByID
    @StudentID INT
AS

BEGIN
    SELECT * FROM Students WHERE StudentID = @StudentID;
END;
-- Execute
EXEC GetStudentByID @StudentID = 1;


--Update Student Marks(With arguments, updates data)
CREATE PROCEDURE UpdateStudentMarks
    @StudentID INT,
    @NewMarks INT
AS
BEGIN
    UPDATE Students
    SET Marks = @NewMarks
    WHERE StudentID = @StudentID;

    PRINT 'Marks updated successfully!';
END;
-- Execute
EXEC UpdateStudentMarks @StudentID = 1, @NewMarks = 95;


