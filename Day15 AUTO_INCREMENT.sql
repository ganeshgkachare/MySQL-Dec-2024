-- 5) AUTO_INCREMENT:
	-- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
	-- By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
	-- It is commonly applied to primary key columns to ensure that each row has a unique value.
	-- A table can have only one AUTO_INCREMENT column.
	-- The column must be a PRIMARY KEY or have a UNIQUE index.
	-- The column must be of an integer data type.
	-- can be added while creating a table or after the table is created.

-- Syntax:

-- At the time of table creation 
	-- CREATE TABLE table_name (
	--     column_name data_type AUTO_INCREMENT PRIMARY KEY,
    --     ...
	--     ...
    --     column_name data_type
	-- );
    
-- After creating the table/existing table:
	-- ALTER TABLE table_name MODIFY column_name data_type AUTO_INCREMENT;

--  Change Starting Value
	--  ALTER TABLE table_name AUTO_INCREMENT = new_start_value;

-- Change Increment Value
	-- Globally (Affects All Tables):
		-- SET GLOBAL auto_increment_increment = new_increment_value;
	-- Session (Affects Current Session):
		-- SET SESSION auto_increment_increment = new_increment_value;

-- Drop Auto increment
	-- ALTER TABLE table_name MODIFY column_name data_type;
    
CREATE TABLE mytable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  age INT AUTO_INCREMENT
);

CREATE TABLE mytable (
  id INT AUTO_INCREMENT,
  name VARCHAR(50),
  age INT
);


CREATE TABLE mytable (
  id INT AUTO_INCREMENT Unique,
  name VARCHAR(50),
  age INT
);

desc mytable;

drop table mytable;

CREATE TABLE mytable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);

desc mytable;

INSERT INTO mytable (id,name, age) VALUES (2,'John', 30);

INSERT INTO mytable (name, age) VALUES ('Jane', 25);
INSERT INTO mytable (name, age) VALUES ('Bob', 40);

select * from mytable;
truncate table mytable;

ALTER TABLE mytable AUTO_INCREMENT = 150;


INSERT INTO mytable (name, age) VALUES ('Jane', 25);
INSERT INTO mytable (name, age) VALUES ('Bob', 40);

select * from mytable;

-- SET SESSION auto_increment_increment = new_increment_value;
SET SESSION auto_increment_increment = 1;


INSERT INTO mytable (name, age) VALUES ('Jane', 25);
INSERT INTO mytable (name, age) VALUES ('Bob', 40);

select * from mytable;

-- ALTER TABLE table_name MODIFY column_name data_type;
desc mytable;
ALTER TABLE mytable MODIFY id INT;

desc mytable;

drop table students;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    grade INT
);


INSERT INTO students (name, age, gender, grade) VALUES
    ('John', 18, 'M', 90),
    ('Jane', 17, 'F', 85),
    ('Bob', 18, 'M', 80),
    ('Alice', 16, 'F', 92),
    ('Tom', 17, 'M', 70),
    ('Mary', 16, 'F', 88),
    ('David', 18, 'M', 78),
    ('Cathy', 17, 'F', 96),
    ('Peter', 18, 'M', 85),
    ('Sarah', 16, 'F', 93);

select * from students;


-- ----------------------------------------


-- 6) PRIMARY KEY
	-- Primary key is a column or a group of columns that uniquely identifies each row in a table. 
	-- Primary key constraint can be defined at column level as well as at table level.
    -- For two Primary key columns, Primary key constraints at table level can allow values in combination but at column level it should be unique.
	-- Each table can contain only one primary key.
    -- Primary key constraint cannot allow null values.
	-- No duplicate values are allowed in the primary key column(s).
    -- Automatically creates a unique index on the primary key column(s) for fast lookups.
    -- Means PRIMARY KEY is combination of NOT NULL + UNIQUE constraint
	-- Can be applied while creating a table or after table is created.

-- Syntax:

-- At the time of table creation (column level):
	-- CREATE TABLE table_name (
	--     column_name data_type PRIMARY KEY,
    --     ...
	--     ...
    --     column_name data_type
	-- );
    
-- At the time of table creation (table level):
	-- CREATE TABLE table_name (
	--     column_name data_type,
    --     ...
	--     ...
    --     column_name data_type,
    --     PRIMARY KEY (column_name, ...,column_name)
	-- );

-- After creating the table/existing table:
	-- ALTER TABLE table_name ADD PRIMARY KEY (column_name);

-- Drop a PRIMARY KEY
    -- ALTER TABLE table_name DROP PRIMARY KEY;


create table emp77
(id int primary KEY,
first_name varchar(20) primary KEY,
last_name varchar(20),
dob date);    -- Not happen because primary key is one for one table 

create table emp7
(id int primary KEY,
first_name varchar(20),
last_name varchar(20),
dob date);

desc emp7;
SHOW INDEX FROM emp7;

ALTER TABLE emp7 DROP PRIMARY KEY;

desc emp7;
drop table emp7;