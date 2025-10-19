--CREATE DATABASE and USE it
CREATE DATABASE MathfnsDB;
USE MathfnsDB;

--Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    GPA DECIMAL(3, 2),
    AdmissionDate DATETIME
);

--Insert records into the table
INSERT INTO Students VALUES
(1, 'Alice', 'JOHNSON', '2002-05-20', 3.65, '2023-06-01'),
(2, 'BOB', 'smith', '2001-08-15', 2.80, '2022-09-01'),
(3, 'Charlie', 'brown', '2003-11-30', 3.95, '2024-01-10');

--String Functions
SELECT 
  StudentID,
  LEN(FirstName) AS FirstNameLength,                   -- String length
  LTRIM(FirstName) AS TrimmedFirstName,                -- Remove leading spaces
  RTRIM(LastName) AS TrimmedLastName,                  -- Remove trailing spaces
  LOWER(LastName) AS LowerCaseLastName,                -- Convert to lowercase
  UPPER(FirstName) AS UpperCaseFirstName,              -- Convert to uppercase
  LEFT(FirstName, 3) AS First3Letters,                 -- First 3 letters
  RIGHT(LastName, 3) AS Last3Letters,                  -- Last 3 letters
  SUBSTRING(FirstName, 2, 3) AS MiddleOfFirstName,     -- Extract substring
  REPLACE(FirstName, 'a', '@') AS ReplacedFirstName,   -- Replace character
  CHARINDEX('a', FirstName) AS PositionOfA,            -- Find position of 'a'
  CONCAT(FirstName, ' ', LastName) AS FullName         -- Combine first and last name
FROM Students;

--Numeric Functions
SELECT 
  StudentID,
  GPA,
  ABS(GPA - 4.0) AS DiffFromPerfectGPA,   -- Absolute difference from 4.0
  CEILING(GPA) AS RoundedUpGPA,           -- Round up
  FLOOR(GPA) AS RoundedDownGPA,           -- Round down
  ROUND(GPA, 1) AS RoundedGPA,            -- Round to 1 decimal
  POWER(GPA, 2) AS GPASquared,            -- Square of GPA
  SQRT(GPA) AS GPASqrt,                   -- Square root
  RAND(StudentID) AS RandomNumber,        -- Random number
  PI() AS PiConstant                      -- Constant π
FROM Students;

--Date Functions
SELECT 
  StudentID,
  DateOfBirth,
  AdmissionDate,
  GETDATE() AS CurrentDateTime,                        -- Current system date and time
  GETUTCDATE() AS CurrentUTC,                          -- Current UTC date and time
  DATEADD(YEAR, 1, AdmissionDate) AS AdmissionNextYear,-- Add 1 year to admission date
  DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age,       -- Calculate age
  DATEDIFF(DAY, AdmissionDate, GETDATE()) AS DaysSinceAdmission, -- Days since admission
  DATEPART(YEAR, DateOfBirth) AS BirthYear,            -- Extract year
  DATEPART(MONTH, AdmissionDate) AS AdmissionMonth,    -- Extract month
  FORMAT(AdmissionDate, 'dd-MM-yyyy') AS AdmissionFormatted, -- Format date
  EOMONTH(AdmissionDate) AS EndOfAdmissionMonth,       -- End of admission month
  SYSDATETIME() AS HighPrecisionDateTime               -- High precision datetime
FROM Students;
