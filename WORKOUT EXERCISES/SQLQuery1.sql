CREATE database my_db;

use my_db;

create table employess( 
       id INT, 
	   name VARCHAR(100),
	   age INT,
	   department VARCHAR(50),
	   salary DECIMAL);

INSERT INTO employess(id, name, age, department, salary)
VALUES (04,'Arthi',19,'CSE',20000, '2006-06-08'),
	   (05,'Gopi',19,'AERONAUTICAL',25000, '2007-05-23');

SELECT * FROM employess;

UPDATE employess
set department='AERONAUTICAL'
where id=05; 

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(100)
);

insert employess values(05,'Gopi',19,'Aeronautical',25000);

select * from employess
where id=03;

ALTER TABLE employess
Add DOB date;

Update emp_details
set DOB= '2007-05-23'
where id=05;

select department from employess;

ALTER TABLE employess
ALTER COLUMN id INT NOT NULL;

ALTER TABLE employess
ADD CONSTRAINT PK_employess_id PRIMARY KEY (id);

ALTER TABLE employess
ADD dept_id INT;

ALTER TABLE departments
ALTER COLUMN dept_id INT NOT NULL;

ALTER TABLE departments
ADD CONSTRAINT PK_departments_id PRIMARY KEY (dept_id);

ALTER TABLE employess
ADD CONSTRAINT FK_employess_dept
FOREIGN KEY (dept_id) REFERENCES departments(dept_id);

select * from employess
select * from departments;

insert into departments values (201, 'DSA'),(504,'CSE');

EXEC sp_rename 'employess', 'emp_details'; --to rename table

DROP TABLE emp_details;  --to delete table

select * from emp_details;

ALTER TABLE emp_details
DROP COLUMN dept_id;    --to delete column

EXEC sp_rename 'emp_details.DOB', 'dob', 'COLUMN'; --to rename column

delete from emp_details where id=05; --to delete values

drop database my_student1;

