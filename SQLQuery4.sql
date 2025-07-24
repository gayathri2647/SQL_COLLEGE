use my_db;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    GPA DECIMAL(3, 2),
    AdmissionDate DATETIME
);

INSERT INTO Students VALUES
(1, 'Alice', 'JOHNSON', '2002-05-20', 3.65, '2023-06-01'),
(2, 'BOB', 'smith', '2001-08-15', 2.80, '2022-09-01'),
(3, 'Charlie', 'brown', '2003-11-30', 3.95, '2024-01-10'),
(4, 'David', 'Miller', '2000-03-05', 2.50, '2021-08-25'),
(5, 'Emily', 'Clark', '2004-09-12', 3.40, '2023-01-15'),
(6, 'Frank', 'Lee', '2002-12-19', 3.10, '2022-11-11'),
(7, 'Grace', 'Kim', '2001-01-25', 3.85, '2021-06-20'),
(8, 'Hannah', 'O''Connor', '2000-07-04', 2.95, '2023-03-03'),
(9, 'Ian', 'Wright', '2003-05-22', 3.20, '2023-02-01'),
(10, 'Jane', 'Lopez', '2002-10-10', 3.70, '2022-05-09');

SELECT StudentID,
  LEN(FirstName) AS FirstNameLength,                   -- String length
  LTRIM(FirstName) AS TrimmedFirstName,                -- Remove leading spaces
  RTRIM(LastName) AS TrimmedLastName,                  -- Remove trailing spaces
  LOWER(LastName) AS LowerCaseLastName,                -- Lowercase
  UPPER(FirstName) AS UpperCaseFirstName,              -- Uppercase
  LEFT(FirstName, 3) AS First3Letters,                 -- First 3 letters
  RIGHT(LastName, 3) AS Last3Letters,                  -- Last 3 letters
  SUBSTRING(FirstName, 2, 3) AS MiddleOfFirstName,     -- Substring
  REPLACE(FirstName, 'a', '@') AS ReplacedFirstName,   -- Replace letter
  CHARINDEX('a', FirstName) AS PositionOfA,            -- Position of 'a'
  CONCAT(FirstName, ' ', LastName) AS FullName         -- Concatenate
FROM Students;

SELECT StudentID,GPA,
  ABS(GPA - 4.0) AS DiffFromPerfectGPA,   -- Absolute diff from 4.0
  CEILING(GPA) AS RoundedUpGPA,           -- Round up
  FLOOR(GPA) AS RoundedDownGPA,           -- Round down
  ROUND(GPA, 1) AS RoundedGPA,            -- Round to 1 decimal
  POWER(GPA, 2) AS GPASquared,            -- GPA squared
  SQRT(GPA) AS GPASqrt,                   -- Square root of GPA
  RAND(StudentID) AS RandomNumber,        -- Random
  PI() AS PiConstant                      -- Constant π
FROM Students;

SELECT StudentID,DateOfBirth,AdmissionDate,
  GETDATE() AS CurrentDateTime,                        -- Current system datetime
  GETUTCDATE() AS CurrentUTC,                          -- Current UTC datetime
  DATEADD(YEAR, 1, AdmissionDate) AS AdmissionNextYear,-- Add 1 year
  DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age,       -- Calculate age
  DATEDIFF(DAY, AdmissionDate, GETDATE()) AS DaysSinceAdmission, -- Days since
  DATEPART(YEAR, DateOfBirth) AS BirthYear,            -- Extract year
  DATEPART(MONTH, AdmissionDate) AS AdmissionMonth,    -- Extract month
  FORMAT(AdmissionDate, 'dd-MM-yyyy') AS AdmissionFormatted, -- Format date
  EOMONTH(AdmissionDate) AS EndOfAdmissionMonth,       -- End of month
  SYSDATETIME() AS HighPrecisionDateTime               -- Precise datetime
FROM Students;
