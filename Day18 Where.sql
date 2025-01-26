-- WHERE clause : Used in SQL to filter records in a database query.

-- Syntax:
	-- SELECT column1, column2, ...
	-- FROM table_name
	-- WHERE condition;

-- Create the `employees` table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    joining_date DATE,
    manager_id INT,
    city VARCHAR(50),
    email VARCHAR(100)
);

-- Insert sample records
INSERT INTO employees (first_name, last_name, department_id, salary, joining_date, manager_id, city, email)
VALUES
('Aarav', 'Sharma', 1, 50000, '2020-01-15', NULL, 'Mumbai', 'aarav.sharma@gmail.com'),
('Vihaan', 'Verma', 2, 60000, '2019-11-20', 1, 'Delhi', 'vihaan.verma@gmail.com'),
('Anaya', 'Singh', 3, 45000, '2021-06-10', 2, 'Bangalore', 'anaya.singh@gmail.com'),
('Ishaan', 'Mehta', 1, 52000, '2018-08-25', 1, 'Mumbai', 'ishaan.mehta@gmail.com'),
('Myra', 'Kapoor', 2, 48000, '2022-03-12', 3, 'Delhi', 'myra.kapoor@gmail.com'),
('Arjun', 'Chopra', 3, 70000, '2017-09-05', NULL, 'Chennai', 'arjun.chopra@gmail.com'),
('Diya', 'Rao', 4, 40000, '2021-02-18', 4, 'Kolkata', 'diya.rao@gmail.com'),
('Kabir', 'Naik', 2, 65000, '2019-04-01', 2, 'Delhi', 'kabir.naik@gmail.com'),
('Aanya', 'Patel', 5, 30000, '2023-07-22', NULL, 'Ahmedabad', 'aanya.patel@gmail.com'),
('Advik', 'Joshi', 4, 55000, '2018-12-11', 3, 'Hyderabad', 'advik.joshi@gmail.com'),
('Sara', 'Ahuja', 6, 47000, '2021-05-10', NULL, 'Mumbai', 'sara.ahuja@gmail.com'),
('Dev', 'Garg', 7, 52000, '2019-01-30', 2, 'Chennai', 'dev.garg@gmail.com'),
('Riya', 'Iyer', 8, 49000, '2022-10-25', 1, 'Bangalore', 'riya.iyer@gmail.com'),
('Aryan', 'Dewan', 9, 72000, '2020-03-20', NULL, 'Pune', 'aryan.dewan@gmail.com'),
('Nitya', 'Bhatt', 1, 62000, '2018-11-15', 3, 'Kolkata', 'nitya.bhatt@gmail.com'),
('Yash', 'Gupta', 3, 59000, '2021-07-08', 2, 'Mumbai', 'yash.gupta@gmail.com'),
('Tia', 'Malhotra', 10, 80000, '2017-02-12', NULL, 'Delhi', 'tia.malhotra@gmail.com'),
('Vivaan', 'Shukla', 1, 35000, '2022-08-19', 4, 'Jaipur', 'vivaan.shukla@gmail.com'),
('Prisha', 'Khan', 2, 63000, '2023-01-01', NULL, 'Bangalore', 'prisha.khan@gmail.com'),
('Reyansh', 'Aggarwal', 4, 49000, '2018-09-15', 1, 'Lucknow', 'reyansh.aggarwal@gmail.com'),
('Kavya', 'Reddy', 5, 53000, '2020-04-11', 2, 'Hyderabad', 'kavya.reddy@gmail.com'),
('Om', 'Chatterjee', 2, 42000, '2021-12-06', 3, 'Kolkata', 'om.chatterjee@gmail.com'),
('Saanvi', 'Desai', 3, 41000, '2022-09-14', 1, 'Mumbai', 'saanvi.desai@gmail.com'),
('Aadhya', 'Pandey', 6, 58000, '2020-06-22', 2, 'Delhi', 'aadhya.pandey@gmail.com'),
('Aarohi', 'Mukherjee', 7, 62000, '2018-10-03', NULL, 'Bangalore', 'aarohi.mukherjee@gmail.com'),
('Rudra', 'Singhania', 8, 39000, '2023-02-17', 3, 'Pune', 'rudra.singhania@gmail.com'),
('Kaira', 'Bose', 9, 54000, '2019-05-09', NULL, 'Chennai', 'kaira.bose@gmail.com'),
('Parth', 'Saxena', 10, 61000, '2022-11-01', 2, 'Ahmedabad', 'parth.saxena@gmail.com');

INSERT INTO employees (first_name, last_name, department_id, salary, joining_date, manager_id, city, email)
VALUES
('Aarav', 'Sharma', 1, 50000, '2020-01-15', NULL, 'Mumbai', 'aarav.sharma@gmail.com');

INSERT INTO employees (first_name, last_name, department_id, salary, joining_date, manager_id, city, email)
VALUES
('Aarav', 'Patil', 1, 60000, '2020-01-15', NULL, 'Mumbai', 'aarav.sharma@gmail.com');
commit;

select * from employees;


-- Comparison Operators
	-- Equal to ( = ) 
	-- Not equal to ( != or <> ) 
	-- Greater than ( > )
	-- Less than ( < )
	-- Greater than or equal to ( >=)
	-- Less than or equal to ( <= )

-- Equal to
-- Retrieve employees with a salary equal to 50000
SELECT * FROM employees WHERE salary = 50000;
SELECT first_name, last_name,emp_id,salary FROM employees WHERE salary = 50000;

-- Retrieve employees from deparment 1
SELECT * FROM employees WHERE department_id = 1;

-- Not equal to
-- Retrieve employees except department 1
SELECT * FROM employees WHERE department_id != 1;
SELECT * FROM employees WHERE department_id <> 1;

-- Greater than
--  Retrieve employees with a salary greater than 70000
SELECT * FROM employees WHERE salary > 70000;

-- Less than
--  Retrieve employees with a salary less than 40000
SELECT * FROM employees WHERE salary < 40000;

-- Greater than or equal to
--  Retrieve employees with a salary greater than or equal to 70000
SELECT * FROM employees WHERE salary >= 70000;

-- Less than or equal to
--  Retrieve employees with a salary less than or equal to 40000
SELECT * FROM employees WHERE salary <= 40000;

-- Logical Operators
	-- AND
	-- OR
	-- NOT
    
--  Retrieve employees working in department 1 from Mumbai city
SELECT * FROM employees WHERE department_id = 1 AND city = 'Mumbai';
SELECT * FROM employees WHERE department_id = 1 AND city = 'Mumbai' AND salary > 50000;

--  Retrieve employees working either department 1 or from Mumbai city
SELECT * FROM employees WHERE department_id = 1 OR city = 'Mumbai';

-- Retrieve employees except department 1
SELECT * FROM employees WHERE NOT department_id = 1;

-- Null Check Operators
	-- IS NULL
	-- IS NOT NULL
    
--  Retrieve employees with no manager assigned
SELECT * FROM employees WHERE manager_id IS NULL;

-- Retrieve employees who have a manager assigned
SELECT * FROM employees WHERE manager_id IS NOT NULL;

-- Pattern Matching Operators
	-- LIKE Used for pattern matching with wildcards:
		-- % matches zero or more characters.
		-- _ matches a single character.
	-- NOT LIKE

--  Retrieve employees whose first name starts with 'A'
SELECT * FROM employees WHERE first_name LIKE 'A%';

--  Retrieve employees whose first name ends with 'A'
SELECT * FROM employees WHERE first_name LIKE '%A';

--  Retrieve employees whose first name contains 'An'
SELECT * FROM employees WHERE first_name LIKE '%an%';
