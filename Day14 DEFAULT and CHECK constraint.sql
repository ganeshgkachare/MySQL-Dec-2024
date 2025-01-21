-- 3) DEFAULT constraint:
	-- Default constraint is used to provide a default value for a column when no value is explicitly specified during an INSERT operation.
	-- Default value will be added to all new records if no other value is specified. 
	-- Default constraint can be defined at column level.
	-- Can be applied while creating a table or after table is created.
	-- DEFAULT constraint cannot used for the columns who has constraint as PRIMARY KEY, AUTO_INCREMENT
	-- Column Data Type Should Match the Default Value
	-- Explicit NULL Values Override Default

-- Syntax 
-- 1) Adding a Default Constraint at the time creating a table:
	-- CREATE TABLE table_name (
	--     column1 datatype DEFAULT default_value,
	--     column2 datatype,
	--     ...
	-- );

-- 2) Adding a Default Constraint After Table Creation:
	-- ALTER TABLE table_name
	-- MODIFY column_name datatype DEFAULT default_value;

-- 3) Drop Default Constraint
	-- ALTER TABLE table_name
	-- ALTER COLUMN column_name DROP DEFAULT;

	-- ALTER TABLE table_name
	-- MODIFY column_name datatype

-- 1) Adding a Default Constraint at the time creating a table:
create table emp5
(id int ,
first_name varchar(20),
last_name varchar(20),
city varchar(20) default "Pune");

-- drop table emp5;
desc emp5;

insert into emp5 (id,first_name,last_name,city) values(1,"Atul","aaa","Nagpur");
insert into emp5 (id,first_name,last_name) values(2,"Prajakta","ppp");
insert into emp5 values(2,"Prajakta","ppp",default);
insert into emp5 values(1,"Prajakta","ppp",null);
select * from emp5;


-- M2) Adding a Default Constraint After Table Creation:

create table emp6
(id int ,
first_name varchar(20),
last_name varchar(20),
admission_date date );

desc emp6;


ALTER TABLE emp6
MODIFY admission_date date DEFAULT "2024-06-15";

desc emp6;

insert into emp6 values(2,"Atul","aaa",DEFAULT);
select * from emp6;

-- DROP DEFAULT CONSTRINT
DESC emp6;

ALTER TABLE emp6
ALTER COLUMN admission_date DROP DEFAULT;

DESC emp6;

-- ----------------------------------------------------------------

-- 4) Check Constraint:
-- A CHECK constraint is a rule you set on a column in  table to make sure that the data entered 
-- meets specific conditions. If the data doesn't follow the rule, the database will reject it.
	-- To limit the values that can be added we use Check constraint.
	-- Check constraint can be defined at column level as well as at table level.
	-- Check constraints can be added while creating a table or after the table is created.
	-- Check constraint allows null values while inserting records in table.



-- Syntax:

-- Add CHECK Constraint at the time of table creation (column level):
	-- CREATE TABLE table_name (
	--     column_name data_type CHECK (condition),
	--     ...
	-- );
    
-- Add CHECK Constraint at the time of table creation (table level):
	-- CREATE TABLE table_name (
	--     column_name data_type,
	--     CONSTRAINT constraint_name CHECK (condition)
	-- );
    
-- Add CHECK Constraint after creating the table/existing table:
	-- ALTER TABLE table_name
	-- ADD CONSTRAINT constraint_name CHECK (condition);

-- DROP CHECK CONSTRAINT
	-- ALTER TABLE table_name
	-- DROP CONSTRAINT constraint_name;
    
-- Query to Check for CHECK Constraints
	-- SELECT CONSTRAINT_NAME
	-- FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	-- WHERE TABLE_SCHEMA = 'database_name'
	--   AND TABLE_NAME = 'table_name'
	--   AND CONSTRAINT_TYPE = 'CHECK';
  
  
-- Example
-- If we have a number student AGE (SSC student) column in a table. The SSC class student AGE in general cannot be less than 15 and at the 
-- same time cannot be greater than 22. But, since AGE is a number column it can accept negative values
-- and values much greater than its limit. 
-- Check constraint is used to limit the range of the values that can be entered for a column. 

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000) 
);

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Amol',110,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT CHECK (std_age > 8 AND std_age < 22),
country VARCHAR(1000)
);
desc studentsinfo;
INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi',18,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

-- Query to Check for CHECK Constraints

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'mysql_practice'
  AND TABLE_NAME = 'studentsInfo'
  AND CONSTRAINT_TYPE = 'CHECK';

-- DROP CHECK CONSTRAINT
ALTER TABLE studentsInfo
DROP CONSTRAINT studentsinfo_chk_1;


-- While creating a table (At Table level)
drop table studentsinfo;

CREATE TABLE studentsinfo (
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000),
CONSTRAINT check_std_age CHECK (std_age > 0 AND std_age < 150 and studentid > 100)
);

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'mysql_practice'
  AND TABLE_NAME = 'studentsinfo'
  AND CONSTRAINT_TYPE = 'CHECK';
  
INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (10,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (151,'Raj',110,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (101,'Hari',25,'INDIA');
select * from studentsinfo;
drop table studentsinfo;

-- Syntax -
-- After table created
drop table studentsinfo;
CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000)
);

SELECT
 CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'mysql_practice'
  AND TABLE_NAME = 'studentsinfo'
  AND CONSTRAINT_TYPE = 'CHECK';
  
  
ALTER TABLE studentsInfo 
ADD CONSTRAINT chk_std_age CHECK ( Std_age> 0 AND Std_age< 150 );

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari', 25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi', 151,'INDIA');

select * from studentsInfo;

-- Drop Check Constraint -
-- Syntax 
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

ALTER TABLE studentsInfo DROP CONSTRAINT chk_std_age;


-- --------------------------------------------------------------------------------

