-- Create Database in MySQL

-- Syntax:
-- Method 1:
-- CREATE DATABASE database_name;
-- Method 2:
-- CREATE DATABASE IF NOT EXISTS database_name; 
-- Method 3:
-- CREATE SCHEMA schema_name;
-- Method 4:
-- CREATE SCHEMA IF NOT EXISTS schema_name; 

-- Method 1:
CREATE DATABASE MySQL_Practice;

-- Method 2:
CREATE DATABASE MySQL_Practice;
CREATE DATABASE IF NOT EXISTS MySQL_Practice;
CREATE DATABASE IF NOT EXISTS MySQL_Practice2;

-- Method 3:
CREATE SCHEMA Demo1;

-- Method 4:
CREATE SCHEMA IF NOT EXISTS Demo2; 

-- Lists of all the databases
SHOW DATABASES;

-- Delete Database in MySQL
-- Syntax:
-- DROP DATABASE database_name;

DROP DATABASE Demo1;
DROP DATABASE Demo2;
DROP DATABASE IF EXISTS MySQL_Practice2;
DROP DATABASE IF EXISTS MySQL_Practice;

-- The USE command used to select and switch the database

Use sys;
Use MySQL_Practice;
Show tables;

-- CREATE TABLE
-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype constraint,
--     column2 datatype constraint,
--     ...
--     columnn datatype constraint,
--     [table_constraints]
-- );

-- 	To create table table name, column name, data type are mandatory field
--  constraint / table_constraints are optional

Use mysql_practice;

-- Lists of all the TABLES in selected databases
SHOW TABLES;

-- create table with name employees
CREATE TABLE employees1 (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

SHOW TABLES;

-- DESCRIBE 
-- The DESCRIBE command used to display the structure of a table.
-- Show information about its columns, data types, constraints, and other details.

-- Method 1)
DESCRIBE employees1;
-- Method 2)
DESC employees1;

SELECT * FROM employees1;
