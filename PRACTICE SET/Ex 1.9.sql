CREATE DATABASE StudentDB;
USE StudentDB;

-- Student Personal Details
CREATE TABLE StudentPersonalDetail (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    phno VARCHAR(15),
    mailid VARCHAR(100)
);

-- Student Academic Details
CREATE TABLE StudentAcademicDetail (
    Aid INT PRIMARY KEY,
    rollno INT,
    name VARCHAR(50),
    dept VARCHAR(50),
    sem1_mark FLOAT,
    sem2_mark FLOAT,
    sem3_mark FLOAT,
    overall_avg FLOAT
);

-- Student Fee Details
CREATE TABLE StudentFee (
    rollno INT,
    total_fee FLOAT,
    paid_fee FLOAT,
    balance_fee FLOAT
);

-- Insert Sample Data
INSERT INTO StudentPersonalDetail VALUES
(1, 'Arun', 20, 'Chennai', '9876543210', 'arun@gmail.com'),
(2, 'Priya', 19, 'Madurai', '9988776655', 'priya@gmail.com'),
(3, 'Kiran', 21, 'Coimbatore', '9123456789', 'kiran@gmail.com');

INSERT INTO StudentAcademicDetail VALUES
(101, 1, 'Arun', 'CSE', 78, 82, 90, 83.3),
(102, 2, 'Priya', 'ECE', 88, 85, 84, 85.6),
(103, 3, 'Kiran', 'EEE', 67, 73, 70, 70.0);

INSERT INTO StudentFee VALUES
(1, 50000, 30000, 20000),
(2, 50000, 50000, 0),
(3, 50000, 45000, 5000);
-------------------------------------------------------------------------
--AGGREGATE FUNCTIONS
-- 1. Total number of students
SELECT COUNT(*) AS Total_Students FROM StudentPersonalDetail;

-- 2. Average overall marks
SELECT AVG(overall_avg) AS Average_Overall FROM StudentAcademicDetail;

-- 3. Highest and lowest sem1 marks
SELECT MAX(sem1_mark) AS Highest_Sem1, MIN(sem1_mark) AS Lowest_Sem1
FROM StudentAcademicDetail;

--GROUPING RESULT SETS
-- 1. Average overall marks by department
SELECT dept, AVG(overall_avg) AS Avg_Marks
FROM StudentAcademicDetail
GROUP BY dept;

-- 2. Number of students in each city
SELECT city, COUNT(*) AS No_of_Students
FROM StudentPersonalDetail
GROUP BY city;

-- 3. Departments with avg marks > 80
SELECT dept, AVG(overall_avg) AS AvgMarks
FROM StudentAcademicDetail
GROUP BY dept
HAVING AVG(overall_avg) > 80;
------------------------internal 2------------------------------
--JOINS
-- 1. INNER JOIN: Name, Dept, City
SELECT s.name, a.dept, s.city
FROM StudentPersonalDetail s
INNER JOIN StudentAcademicDetail a
ON s.rollno = a.rollno;

-- 2. LEFT JOIN: Include students without marks
SELECT s.name, a.dept, a.overall_avg
FROM StudentPersonalDetail s
LEFT JOIN StudentAcademicDetail a
ON s.rollno = a.rollno;

-- 3. RIGHT JOIN: Include academics without personal details
SELECT s.name, a.dept, a.overall_avg
FROM StudentPersonalDetail s
RIGHT JOIN StudentAcademicDetail a
ON s.rollno = a.rollno;

--UNION OPERATOR
-- 1. Combined list of names
SELECT name FROM StudentPersonalDetail
UNION
SELECT name FROM StudentAcademicDetail;

-- 2. Unique cities and departments
SELECT city AS Info FROM StudentPersonalDetail
UNION
SELECT dept FROM StudentAcademicDetail;

-- 3. All student names including duplicates
SELECT name FROM StudentPersonalDetail
UNION ALL
SELECT name FROM StudentAcademicDetail;

--IMPLEMENTING VIEWS
-- 1. View: Student Marks
CREATE VIEW v_StudentMarks AS
SELECT rollno, name, dept, overall_avg
FROM StudentAcademicDetail;

-- 2. View: Student Info (join)
CREATE VIEW v_StudentInfo AS
SELECT s.name, s.city, a.dept
FROM StudentPersonalDetail s
JOIN StudentAcademicDetail a
ON s.rollno = a.rollno;

-- 3. Drop view
DROP VIEW v_StudentMarks;

--CONTROL STATEMENTS
-- 1. IF...ELSE (T-SQL style)
DECLARE @avg FLOAT = 85;
IF @avg > 75
    PRINT 'Distinction';
ELSE
    PRINT 'Average';

-- 2. CASE Statement for grade
SELECT name,
CASE
    WHEN overall_avg >= 90 THEN 'O'
    WHEN overall_avg BETWEEN 80 AND 89 THEN 'A+'
    WHEN overall_avg BETWEEN 70 AND 79 THEN 'A'
    ELSE 'B'
END AS Grade
FROM StudentAcademicDetail;

-- 3. WHILE loop
DECLARE @i INT = 1;
WHILE @i <= 5
BEGIN
    PRINT CONCAT('Roll Number: ', @i);
    SET @i = @i + 1;
END;

--TRIGGERS
-- 1. Log new student inserts
CREATE TABLE StudentAudit (
    rollno INT,
    name VARCHAR(50),
    action_time DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_StudentInsert
ON StudentPersonalDetail
AFTER INSERT
AS
INSERT INTO StudentAudit (rollno, name)
SELECT rollno, name FROM inserted;

-- 2. Auto-update overall average
CREATE TRIGGER trg_UpdateOverall
ON StudentAcademicDetail
AFTER UPDATE
AS
UPDATE a
SET a.overall_avg = (a.sem1_mark + a.sem2_mark + a.sem3_mark) / 3
FROM StudentAcademicDetail a
JOIN inserted i ON a.rollno = i.rollno;

-- 3. Prevent deletion
CREATE TRIGGER trg_PreventDelete
ON StudentPersonalDetail
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Deletion not allowed from StudentPersonalDetail table.';
END;

--TRANSACTIONS
-- Transaction to update fee
BEGIN TRANSACTION;

UPDATE StudentFee
SET paid_fee = paid_fee + 5000,
    balance_fee = total_fee - (paid_fee + 5000)
WHERE rollno = 3;

--Reduce the balance_fee accordingly
UPDATE StudentFee
SET balance_fee = total_fee - paid_fee
WHERE rollno = 3;

-- Check negative balance
IF (SELECT balance_fee FROM StudentFee WHERE rollno = 3) < 0
BEGIN
    PRINT 'Invalid transaction! Rolling back...';
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
END;

--STORED PROCEDURES
-- 1. Get all student details
CREATE PROCEDURE sp_GetStudentDetails
AS
SELECT * FROM StudentPersonalDetail;

EXEC sp_GetStudentDetails;

-- 2. Get students by department
CREATE PROCEDURE sp_GetStudentByDept @dept VARCHAR(50)
AS
SELECT * FROM StudentAcademicDetail WHERE dept = @dept;

EXEC sp_GetStudentByDept 'CSE';

-- 3. Update marks
CREATE PROCEDURE sp_UpdateMarks 
@rollno INT, @s1 FLOAT, @s2 FLOAT, @s3 FLOAT
AS
UPDATE StudentAcademicDetail
SET sem1_mark = @s1, sem2_mark = @s2, sem3_mark = @s3,
overall_avg = (@s1 + @s2 + @s3)/3
WHERE rollno = @rollno;

EXEC sp_UpdateMarks 1, 90, 88, 91;

