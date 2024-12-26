
-- 1.3) RENAME
-- Rename the Table
RENAME TABLE Students TO Students_data;

-- Rename the Database
-- Steps
-- 1) Create new database
-- 2) Copy all data / tables from the old database to the new database
-- 3) Drop the old database

-- 1.4) TRUNCATE
TRUNCATE TABLE Students_data;
select * from Students_data;

-- 1.5) DROP
-- DROP TABLE
DROP TABLE Students_data;

-- DROP DATABASE
DROP DATABASE school_data;




-- 2. Data Manipulation Language (DML)
-- DML focuses on the manipulation of data within existing database structures (i.e., tables).
-- It is used to  insert, update, or delete data from the database.
-- All DML commands are not auto-committed which means any changes made will not be permanent in the database.
-- 2.1) INSERT: Adds new rows of data into a table.
-- 2.2) UPDATE: Modifies existing data in a table.
-- 2.3) DELETE: Deletes specific rows from a table based on a condition.

-- 2.1) INSERT DATA 
USE mysql_practice;
Desc employees1;

-- M1)
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);
Select * from employees1;

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES (1, '1992-04-16', 'Suraj', 'Singh', 'M', '2018-07-19');

Select * from employees1;

INSERT INTO employees1 ( birth_date, first_name, last_name, gender, hire_date,emp_no) 
VALUES ( '1994-04-18', 'Priyanka', 'Patil', 'F', '2018-07-19',2);
Select * from employees1;

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES
(3, '1992-04-24', 'Mansi', 'Joshi', 'F', '2018-07-19'),
(4, '1993-06-16', 'Namrata', 'Chavan', 'F', '2018-07-19'),
(5, '1994-09-22', 'Pravin', 'Patil', 'M', '2018-07-19'),
(6, '1995-10-16', 'Vinay', 'Singh', 'M', '2018-07-19'),
(7, '1996-04-18', 'Aditya', 'Mohite', 'M', '2018-07-19'),
(8, '1997-11-16', 'Farhan', 'Khan', 'M', '2018-07-19');
Select * from employees1;

-- TRUNCATE TABLE employees1;
Select * from employees1;
-- M2)
-- INSERT INTO table_name
-- VALUES (value1, value2, value3, ...);

INSERT INTO employees1 VALUES
(9, '1992-04-24', 'Devika', 'Joshi', 'F', '2018-07-19'),
(10, '1993-06-16', 'Sachin', 'Chavan', 'F', '2018-07-19');
Select * from employees1;

INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date,gmail_ID) 
VALUES (12, '1993-04-16', 'Suraj', 'S', 'M', '2018-07-19',"surajs@gmail.com");

ALTER TABLE employees1 ADD COLUMN gmail_ID VARCHAR(100);

-- 2.2) UPDATE:
select * from employees1;
-- Syntax:- UPDATE Table_Name SET Column_Name = new_value;
update employees1 set last_name = "Patil";
-- SET SQL_SAFE_UPDATES = 0; -- Safe Mode Off
-- SET SQL_SAFE_UPDATES = 1; -- Safe Mode On

TRUNCATE TABLE employees1;
INSERT INTO employees1 (emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES
(3, '1992-04-24', 'Mansi', 'Joshi', 'F', '2018-07-19'),
(4, '1993-06-16', 'Namrata', 'Chavan', 'F', '2018-07-19'),
(5, '1994-09-22', 'Pravin', 'Patil', 'M', '2018-07-19'),
(6, '1995-10-16', 'Vinay', 'Singh', 'M', '2018-07-19'),
(7, '1996-04-18', 'Aditya', 'Mohite', 'M', '2018-07-19'),
(8, '1997-11-16', 'Farhan', 'Khan', 'M', '2018-07-19');
Select * from employees1;
update employees1 set last_name = "Patil"
where first_name = 'Namrata';
Select * from employees1;


