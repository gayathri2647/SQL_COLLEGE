CREATE DATABASE LibraryDB;
USE LibraryDB;

--CREATE TABLES
CREATE TABLE Book(
    BookID INT Primary Key,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Category VARCHAR(50),
    TotalCopies INT,
    AvailableCopies INT
);

CREATE TABLE Member(
    MemberID INT Primary Key,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    PhNo VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE BookIssue(
    IssueID INT Primary Key,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

--INSERT SAMPLE DATA
INSERT INTO Book VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 10, 7),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 8, 3),
(3, '1984', 'George Orwell', 'Dystopian', 5, 2),
(4, 'A Brief History of Time', 'Stephen Hawking', 'Science', 6, 6),
(5, 'The Art of War', 'Sun Tzu', 'Philosophy', 4, 1);

INSERT INTO Member (MemberID, Name, Age, City, PhNo, Email) VALUES
(1, 'Gayathri Prasad', 19, 'Kanyakumari', '9876543210', 'gayathri@gmail.com'),
(2, 'Yugesh', 20, 'Madurai', '9876543211', 'yugesh@gmail.com'),
(3, 'Preetha', 19, 'Chennai', '9876543212', 'preetha@gmail.com'),
(4, 'Siva Madhesh', 21, 'Madurai', '9876543213', 'siva@gmail.com'),
(5, 'Dhanishka', 22, 'Madurai', '9876543214', 'dhanishka@gmail.com');

INSERT INTO BookIssue VALUES
(1, 1, 1, '2024-09-01', '2024-09-15'),
(2, 2, 2, '2024-09-05', '2024-09-20'),
(3, 3, 3, '2024-09-10', NULL),
(4, 1, 4, '2024-09-12', NULL),
(5, 5, 5, '2024-09-15', '2024-09-30');

--JOINS
--1. INNER JOIN — Book title, member name, and issue date
SELECT b.Title, m.Name, bi.IssueDate
FROM BookIssue bi
INNER JOIN Book b ON bi.BookID = b.BookID
INNER JOIN Member m ON bi.MemberID = m.MemberID;

--2. LEFT JOIN — Members and books borrowed (include non-borrowers)
SELECT m.Name, b.Title
FROM Member m
LEFT JOIN BookIssue bi ON m.MemberID = bi.MemberID
LEFT JOIN Book b ON bi.BookID = b.BookID;

--3. RIGHT JOIN — Include books that have never been issued
SELECT b.Title, m.Name, bi.IssueDate
FROM BookIssue bi
RIGHT JOIN Book b ON bi.BookID = b.BookID
LEFT JOIN Member m ON bi.MemberID = m.MemberID;

--UNION OPERATOR
--1. Combined list of all book titles and member names
SELECT Title AS Name FROM Book
UNION
SELECT Name FROM Member;

--2. Unique list of cities and book categories
SELECT City AS Location FROM Member
UNION
SELECT Category FROM Book;

--3. Include duplicates
SELECT Title AS Name FROM Book
UNION ALL
SELECT Name FROM Member;

--IMPLEMENTING VIEWS
--1. View showing book status
CREATE VIEW v_BookStatus AS
SELECT BookID, Title, AvailableCopies
FROM Book;

SELECT * FROM v_BookStatus;

--2. View showing member issue details
CREATE VIEW v_MemberIssues AS
SELECT m.MemberID, m.Name, b.Title, bi.IssueDate
FROM BookIssue bi
JOIN Member m ON bi.MemberID = m.MemberID
JOIN Book b ON bi.BookID = b.BookID;

SELECT * FROM v_MemberIssues;

--3. Drop views
DROP VIEW v_BookStatus;

--CONTROL STATEMENTS
--1. IF...ELSE block
IF (SELECT AvailableCopies FROM Book WHERE BookID = 1) > 0 THEN
  SELECT 'Available' AS Status;
ELSE
  SELECT 'Not Available' AS Status;
END IF;

--2.CASE statement for member age group 
SELECT Name,
CASE
  WHEN Age <= 18 THEN 'Minor'
  WHEN Age BETWEEN 19 AND 60 THEN 'Adult'
  ELSE 'Senior'
END AS AgeGroup
FROM Member;

--3. WHILE loop (example in stored block)
DECLARE @i INT
SET @i = 1;
WHILE @i <= 5 
BEGIN
  SELECT @i AS BookID;
  SET @i = @i + 1;
END 

--TRIGGERS
--1. Log new book issue
CREATE TABLE IssueAudit (
  AuditID INT AUTO_INCREMENT PRIMARY KEY,
  IssueID INT,
  BookID INT,
  MemberID INT,
  ActionTime DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_AfterBookIssue
ON BookIssue
AFTER INSERT 
AS
BEGIN 
     INSERT INTO IssueAudit (IssueID, BookID, MemberID)
     SELECT IssueID, BookID, MemberID FROM inserted;
END;

--2. Update AvailableCopies automatically
CREATE TRIGGER trg_UpdateAvailableCopies
ON BookIssue
AFTER INSERT
AS
BEGIN
    UPDATE b
    SET b.AvailableCopies = b.AvailableCopies - 1
    FROM Book b
    INNER JOIN inserted i ON b.BookID = i.BookID;
END;

--3. 




