--Create database and use it
CREATE DATABASE Groupedb;
USE Groupedb;

--Create the 'stud' table
CREATE TABLE stud (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    marks INT
);

--Insert records into 'stud'
INSERT INTO stud(id, name, subject, marks) VALUES
(1, 'Rahul', 'Math', 85),
(2, 'Priya', 'Science', 90),
(3, 'Rahul', 'Science', 80),
(4, 'Priya', 'Math', 95),
(5, 'Anjali', 'Math', 70);

--Total marks per student
SELECT name, SUM(marks) AS total_marks
FROM stud
GROUP BY name;

--Average marks per subject
SELECT subject, AVG(marks) AS avg_marks
FROM stud
GROUP BY subject;

--Count of students per subject
SELECT subject, COUNT(*) AS student_count
FROM stud
GROUP BY subject;

--Show only students with total marks > 150
SELECT name, SUM(marks) AS total_marks
FROM stud
GROUP BY name
HAVING SUM(marks) > 150;
