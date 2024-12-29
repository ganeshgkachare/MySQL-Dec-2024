
-- 3. Transaction Control Language (TCL)
-- TCL is used to manage transactions within the database. A transaction is a group of SQL operations that
--  are executed as a single unit.  This is crucial for maintaining database consistency.
--  COMMIT: Saves all changes made during the current transaction.
--  ROLLBACK: Undoes all changes made during the current transaction.
--  SAVEPOINT: Sets a point within a transaction that can be rolled back to if needed.
-- COMMIT/ROLLBACK Example:
TRUNCATE TABLE employees1;
INSERT INTO employees1  (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
(9, '1992-04-24', 'Devika', 'Joshi', 'F', '2018-07-19'),
(10, '1993-06-16', 'Sachin', 'Chavan', 'F', '2018-07-19');
COMMIT;

select * from employees1;

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES (1, '1992-04-16', 'Suraj', 'Singh', 'M', '2018-07-19');

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES
(3, '1992-04-24', 'Mansi', 'Joshi', 'F', '2018-07-19'),
(4, '1993-06-16', 'Namrata', 'Chavan', 'F', '2018-07-19'),
(5, '1994-09-22', 'Pravin', 'Patil', 'M', '2018-07-19'),
(6, '1995-10-16', 'Vinay', 'Singh', 'M', '2018-07-19'),
(7, '1996-04-18', 'Aditya', 'Mohite', 'M', '2018-07-19'),
(8, '1997-11-16', 'Farhan', 'Khan', 'M', '2018-07-19');

Select * from employees1;

rollback;

Select * from employees1;

-- SAVEPOINT/ROLLBACK Example:

TRUNCATE TABLE employees1;
INSERT INTO employees1  VALUES
(9, '1992-04-24', 'Devika', 'Joshi', 'F', '2018-07-19',"abc@gmail.com"),
(10, '1993-06-16', 'Sachin', 'Chavan', 'F', '2018-07-19',"abc@gmail.com");
desc employees1;
COMMIT;

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES (1, '1992-04-16', 'Suraj', 'Singh', 'M', '2018-07-19');
savepoint insert2;
INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES
(3, '1992-04-24', 'Mansi', 'Joshi', 'F', '2018-07-19'),
(4, '1993-06-16', 'Namrata', 'Chavan', 'F', '2018-07-19'),
(5, '1994-09-22', 'Pravin', 'Patil', 'M', '2018-07-19'),
(6, '1995-10-16', 'Vinay', 'Singh', 'M', '2018-07-19'),
(7, '1996-04-18', 'Aditya', 'Mohite', 'M', '2018-07-19'),
(8, '1997-11-16', 'Farhan', 'Khan', 'M', '2018-07-19');
--
Select * from employees1;

rollback to insert2;
rollback;
Select * from employees1;

-- SET autocommit=0;
-- SET autocommit=1;