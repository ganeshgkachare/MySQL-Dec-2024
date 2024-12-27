-- 2.2) UPDATE:
-- Syntax:- UPDATE Table_Name SET Column_Name = new_value;
-- WHERE clause: Used to filter records based on specific conditions.
SET SQL_SAFE_UPDATES = 0; -- Safe Mode Off
SET SQL_SAFE_UPDATES = 1; -- Safe Mode On

select * from employees1;
-- Update without where clause
update employees1 set last_name = "Patil";


-- TRUNCATE TABLE employees1;
INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES
(3, '1992-04-24', 'Mansi', 'Joshi', 'F', '2018-07-19'),
(4, '1993-06-16', 'Namrata', 'Chavan', 'F', '2018-07-19'),
(5, '1994-09-22', 'Pravin', 'Patil', 'M', '2018-07-19'),
(6, '1995-10-16', 'Vinay', 'Singh', 'M', '2018-07-19'),
(7, '1996-04-18', 'Aditya', 'Mohite', 'M', '2018-07-19'),
(8, '1997-11-16', 'Farhan', 'Khan', 'M', '2018-07-19');

Select * from employees1;

-- Update with where clause using non primary field
update employees1 set last_name = "Patil"
where first_name = 'Namrata';

Select * from employees1;
desc employees1;
-- Update with where clause using primary field
update employees1 set last_name = "Patil"
where emp_no = 3;

-- 2.3) DELETE
Select * from employees1;

-- Delete without where clause
DELETE FROM employees1;

-- Delete with where clause using non primary field
DELETE FROM employees1
where first_name = 'Namrata';

-- Delete with where clause using primary field
DELETE FROM employees1
where emp_no = 3;


