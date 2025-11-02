Create DATABASE Trigger_db;
USE Trigger_db;

-- Creating the base Student table
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    Marks INT
);

Insert INTO Students (StudentName, Department, Marks) VALUES
('Alice', 'Computer Science', 85),
('Bob', 'Mathematics', 90),
('Charlie', 'Physics', 78);

--Create Table AuditLog → to store trigger logs
CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    ActionType VARCHAR(20),
    ActionDate DATETIME,
    OldMarks INT,
    NewMarks INT
);

--AFTER INSERT Trigger
CREATE TRIGGER trg_AfterInsert_Students
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate)
    SELECT StudentID, 'INSERT', GETDATE()
    FROM inserted;
END;

-- Insert a new record(Test the AFTER INSERT Trigger)
INSERT INTO Students (StudentName, Department, Marks)
VALUES ('Priya', 'CSE', 85);

--AFTER UPDATE Trigger
CREATE TRIGGER trg_AfterUpdate_Students
ON Students
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate, OldMarks, NewMarks)
    SELECT d.StudentID, 'UPDATE', GETDATE(), d.Marks, i.Marks
    FROM deleted d
    INNER JOIN inserted i ON d.StudentID = i.StudentID;
END;

-- Update record(Test the AFTER UPDATE Trigger)
UPDATE Students
SET Marks = 92
WHERE StudentID = 1;

-- AFTER DELETE Trigger
CREATE TRIGGER trg_AfterDelete_Students
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate)
    SELECT StudentID, 'DELETE', GETDATE()
    FROM deleted;
END;

-- Delete record(Test the AFTER DELETE Trigger)
DELETE FROM Students
WHERE StudentID = 1;

-- View Audit Log
SELECT * FROM AuditLog;



