use my_db;

CREATE TABLE stud_details (
    roll_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50)
);

INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES (201, 'Abilash', 20, 'Male', 'Computer Science');

INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES (202, 'Gowtham', 21, 'Female', 'Information Technology');

INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES (203, 'Niranj', 22, 'Male', 'Mechanical Engineering');

INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES (204, 'Mahadev', 20, 'Female', 'Electrical Engineering');

INSERT INTO stud_details (roll_no, name, age, gender, department)
VALUES (205, 'Subin', 23, 'Male', 'Civil Engineering');

select * from stud_details; --retrieve all columns from table

update stud_details
set name= 'Nandana'
where roll_no=202;

update stud_details
set name= 'Sanjana'
where roll_no=204;

select * from stud_details where roll_no=204; --retrieve particular row

select name,department from stud_details;  --retrieve specific columns

select * from stud_details ORDER BY age DESC; --retrieve all students and sort them by age in descending order

select DISTINCT age from stud_details; --retrieves unique age

Select * from stud_details where name LIKE'A%'; --retrieves student whose name starts with A

Select * from stud_details where age between 20 and 23; --Retrieves student with age between 20 and 23.

SELECT * FROM stud_details WHERE department IN ('Computer Science', 'Electrical Engineering');

SELECT department AS 'Dept Name', name AS 'Stud_Name' FROM stud_details;

