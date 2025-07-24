USE my_db;


-- Create the referenced table 
CREATE TABLE dept(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50) UNIQUE
);

-- Create the employee table with foreign key
CREATE TABLE IT (
  id INT PRIMARY KEY,
  email VARCHAR(50) UNIQUE,
  name VARCHAR(100) NOT NULL,
  age INT CHECK (age >= 20 AND age <= 60),
  gender VARCHAR(10),
  dept_id INT,
  salary FLOAT Default 50000,
  FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);

INSERT INTO dept (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations'),
(6, 'Sales'),
(7, 'Customer Support'),
(8, 'Logistics'),
(9, 'R&D'),
(10,'Legal');

INSERT INTO IT (id, email, name, age, gender, dept_id) VALUES
(201, 'alice@company.com', 'Alice Smith', 30, 'Female', 1),
(202, 'bob@company.com', 'Bob Johnson', 42, 'Male', 3),
(203, 'carol@company.com', 'Carol White', 29, 'Female', 2),
(204, 'dave@company.com', 'Dave Brown', 35, 'Male', 4),
(205, 'eve@company.com', 'Eve Davis', 27, 'Other', 5),
(206, 'frank@company.com', 'Frank Thomas', 33, 'Male', 3),
(207, 'grace@company.com', 'Grace Lee', 41, 'Female', 1),
(208, 'henry@company.com', 'Henry Adams', 38, 'Male', 2),
(209, 'irene@company.com', 'Irene Zhao', 24, 'Female', 4),
(210, 'jack@company.com', 'Jack Chen', 31, 'Male', 5);


SELECT * FROM dept;