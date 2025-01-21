-- Constraint

-- CREATE TABLE
-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype constraint,
--     column2 datatype constraint,
--     ...
--     columnn datatype constraint,
--     [table_constraints]
-- );

-- 2) UNIQUE Constraint:
-- A UNIQUE constraint ensures that all values in a column (or a combination of columns) are
-- unique (distinct) across the table. This is useful for preventing duplicate entries in one or more columns.
	-- A table can have multiple UNIQUE constraints.
	-- A UNIQUE constraint allows NULL values, but two NULL values are considered distinct.
	-- Unique constraint can be defined at column level as well as at table level.
	-- Unique constraint Can be applied while creating a table or after table is created. 

-- Syntax for UNIQUE Constraint
-- M1) Add UNIQUE Constraint at the time of table creation (column level):
	-- CREATE TABLE table_name (
	--     column1 datatype UNIQUE,   
	--     column2 datatype,
	--     ...
	--     columnn datatype,
	-- );

-- M2) Add UNIQUE Constraint at the time of table creation (table level):
	-- CREATE TABLE table_name (
	--     column1 datatype,   
	--     column2 datatype,
	--     ...
	--     columnn datatype,
	-- 	   UNIQUE KEY(column1, column2) / CONSTRAINT constraint_name UNIQUE (column1, column2)
	-- );

-- M3) Add UNIQUE Constraint after creating the table/existing table:
	-- ALTER TABLE table_name
	-- ADD CONSTRAINT constraint_name UNIQUE (column_name/s);

	-- ALTER TABLE table_name
	-- ADD UNIQUE KEY (column_name/s);

-- Drop the UNIQUE Constraint
	-- ALTER TABLE table_name
	-- DROP INDEX column_name/index_name;

-- Examples
-- M1) Add UNIQUE Constraint at the time of table creation (column level):
create table emp3
(id int UNIQUE,
first_name varchar(20),
last_name varchar(20),
dob date);

desc emp3;


insert into emp3 values(null,"priyanka","ppp","1995-07-18");
insert into emp3 values(null,"priyanka","ppp","1995-07-18");
insert into emp3 values(null,"priyanka","ppp","1995-07-18");

select * from emp3;

insert into emp3 values(1,"Prajakta","ppp","1995-07-18");
insert into emp3 values(1,"priyanka","ppp","1995-07-18");
insert into emp3 values(2,"priyanka","ppp","1995-07-18");

select * from emp3;

-- Drop column level UNIQUE CONSTRAINT
SHOW INDEX FROM emp3; -- (key name)
-- A UNIQUE constraint in MySQL is implemented using a unique index.
-- When you define a column with the UNIQUE constraint, MySQL automatically creates a unique index on 
-- that column. This ensures that no duplicate values can be inserted into that column.

 desc emp3;
SHOW INDEX FROM emp3;

ALTER TABLE emp3
DROP INDEX id;

insert into emp3 values(1,"Prajakta","ppp","1995-07-18");
insert into emp3 values(1,"priyanka","ppp","1995-07-18");
insert into emp3 values(2,"priyanka","ppp","1995-07-18");

select * from emp3;

-- M2) Add UNIQUE Constraint after creating the table/existing table:
create table emp4
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date,
UNIQUE KEY(first_name, last_name));

desc emp4;
SHOW INDEX FROM emp4;

create table emp5
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date,
CONSTRAINT constraint_u2 UNIQUE(first_name, last_name));
desc emp5;

SHOW INDEX FROM emp5;
desc emp5;

insert into emp5 values(1,"Prajakta","p1","1995-07-18");
insert into emp5 values(1,"Prajakta","p2","1995-07-18");
insert into emp5 values(1,"Prajakta","pp","1995-07-18");
insert into emp5 values(1,"priyanka","pp","1995-07-18");
insert into emp5 values(1,"Prajakta","pp","1995-07-18");
insert into emp5 values(2,"Prajakta","pp","2000-08-20");

select * from emp5;

ALTER TABLE emp5
DROP INDEX constraint_u2;


-- M3) Add UNIQUE Constraint after creating the table/existing table:

create table emp2
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date);

desc emp2;

ALTER TABLE emp2
ADD UNIQUE KEY (first_name);

ALTER TABLE emp2
ADD CONSTRAINT constraint_u1 UNIQUE (first_name);

truncate table emp2;  -- If already duplicate records present in first_name

ALTER TABLE emp2
ADD UNIQUE KEY (first_name);

desc emp2;
show index from emp2;

-- DROP UNIQUE constraint
-- Wrong method
ALTER TABLE emp2
DROP UNIQUE KEY(first_name);

ALTER TABLE emp2
DROP INDEX (last_name);

-- Correct method
ALTER TABLE emp2
DROP INDEX constraint_u1;
desc emp2;

