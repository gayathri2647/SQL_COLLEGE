CREATE DATABASE STUDENTS;

USE STUDENTS;

-- 1. Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- Insert sample departments
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

-- 2. Create Students table with constraints
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age > 17),
    Marks INT NOT NULL,
    DeptID INT,
    CONSTRAINT FK_Students_Departments FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- 3. Insert valid student
INSERT INTO Students (StudentID, Name, Email, Age, Marks, DeptID)
VALUES (1, 'Alice', 'alice@email.com', 20, 85, 1);

-- 4. Insert duplicate Email (will fail: UNIQUE constraint)
INSERT INTO Students (StudentID, Name, Email, Age, Marks, DeptID)
VALUES (2, 'Bob', 'alice@email.com', 21, 90, 2);

-- 5. Insert NULL in Marks (will fail: NOT NULL constraint)
INSERT INTO Students (StudentID, Name, Email, Age, Marks, DeptID)
VALUES (3, 'Carol', 'carol@email.com', 19, NULL, 1);

-- 6. Add DEFAULT constraint for Marks
ALTER TABLE Students
ADD CONSTRAINT DF_Students_Marks DEFAULT 50 FOR Marks;

-- Insert without Marks (Marks will take default 50)
INSERT INTO Students (StudentID, Name, Email, Age, DeptID)
VALUES (4, 'David', 'david@email.com', 22, 2);

-- 7. Drop CHECK constraint on Age 
ALTER TABLE Students DROP CONSTRAINT CK__Students__Age__;

-- 8. Create Courses table with constraints
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits BETWEEN 1 AND 5)
);

-- Insert valid course
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Database Systems', 4);

-- Insert invalid course (will fail: CHECK constraint)
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (102, 'Quantum Mechanics', 6);
