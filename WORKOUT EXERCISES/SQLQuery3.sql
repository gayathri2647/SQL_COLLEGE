use my_db;

CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 20 AND age <= 60),
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    department VARCHAR(50) DEFAULT 'General',
    salary FLOAT CHECK (salary >= 0)
);

INSERT INTO emp (id, name, age, gender, department, salary) VALUES
(101, 'Alice', 30, 'Female', 'CS', 75000),
(102, 'Bob', 45, 'Male', 'HR', 60000),
(103, 'Charlie', 28, 'Other', 'DSA', 50000),
(104, 'David', 40, 'Male', 'CEO', 85000),
(105, 'Eva', 35, 'Female', 'SD', 45000);

INSERT INTO emp (id, name, age, gender, department, salary) VALUES(106, 'AliceD', 31, 'Female', 'CS', 50000);

SELECT name, salary
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp);

SELECT name
FROM emp
WHERE department IN (
    SELECT department FROM emp WHERE department IN ('HR', 'SD')
);

SELECT e1.name, e1.salary
FROM emp e1
WHERE salary > ( SELECT AVG(e2.salary)
    FROM emp e2
    WHERE e2.department =e1.department);


SELECT department, AVG(salary) AS AvgSalary
FROM (
    SELECT department, salary
    FROM emp
) AS temp
GROUP BY department;

SELECT 
    name,
    salary,
    (SELECT AVG(salary) FROM emp) AS avg_salary
FROM emp;

select * from emp;




                         