
-- SQL is a standard language used to interact with relational databases. 
-- SQL contains 5 sub languages – 
-- 1.	Data Definition Language (DDL)
-- 2.	Data Manipulation Language (DML)
-- 3.	Transactional Control language (TCL)
-- 4.	Data Query/Retrieval Language (DQL/DRL)
-- 5.	Data Control Language (DCL)

-- 1.	Data definition language (DDL) 
-- Data Definition Language (DDL) deals with the creation, modification, and deletion of database structures.
-- All DDL commands are auto-committed which means any changes made will be permanent in the database.
-- 1.1) CREATE: Used to create database objects like databases, tables, views, and indexes.
-- 1.2) ALTER: Used to modify an existing database object, such as adding or dropping columns in a table, Rename column.
-- 1.3) RENAME: Used to change the name of an existing database object, such as a table or a column. 
-- 1.4) TRUNCATE: Removes all rows from a table, but the table structure remains same.
-- 1.5) DROP: Used to delete database objects like tables, databases, or indexes.

SHOW databases;
-- 1.1) CREATE
-- CREATE DATABASE
CREATE DATABASE School_data;
Use School_data;

-- CREATE TABLE
-- Need at least one fild/column to create table
CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

-- 1.2) ALTER ===> ADD, Drop, Rename, Modify
-- Add a Column

DESC Students;
ALTER TABLE Students ADD COLUMN email VARCHAR(100);
DESC Students;

--  Remove column from the Table
ALTER TABLE Students DROP COLUMN email;
DESC Students;

--  Rename column 
-- CHANGE COLUMN:
-- Can rename a column and change its data type.
-- Requires the current column name, new column name, and the new data type.
ALTER TABLE Students CHANGE COLUMN student_id Student_name varchar(5);
DESC Students;
ALTER TABLE Students CHANGE COLUMN Student_name Student_name varchar(5);
DESC Students;

-- Modify a Column's Data Type
-- MODIFY COLUMN:
-- Can only modify the existing column's attributes (like data type or size).
-- Cannot rename a column.
	-- ALTER TABLE table_name MODIFY COLUMN column_name new_data_type;
	-- ALTER TABLE table_name MODIFY column_name new_data_type;
ALTER TABLE Students MODIFY COLUMN Student_name int;
DESC Students;