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

-- table level
create table emp8
(id int,
first_name varchar(20),
last_name varchar(20),
dob date,
primary key (id,first_name)
);

desc emp8;
SHOW INDEX FROM emp8;

insert into emp8 values(1,"priyanka","ppp","1995-07-18");
insert into emp8 values(1,"priyanka","ppp","1995-07-18");
insert into emp8 values(2,"priyanka","ppp","1995-07-18");
insert into emp8 values(null,"priyanka","ppp","1995-07-18");
insert into emp8 values(3,"priyanka",null,"1995-07-18");
insert into emp8 values(2,"priyanka",null,"1995-07-18");
select * from emp8;

desc emp8;
ALTER TABLE emp8 DROP PRIMARY KEY;

-- ----------------------------------------------------------------

-- FOREIGN KEY

-- A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in
-- 		another table. It creates a relationship between the two tables and enforces referential
--      integrity,ensuring that the data in one table matches valid data in another table. (A Foreign Key is a key used to link two tables together.)
-- The foreign key ensures that every value in the child table must correspond to a valid primary key value in the parent table.
-- We can define Cascading Rules to specify what happens when the referenced data changes or is deleted.
-- A foreign key column can contain NULL values unless it is defined as NOT NULL.
-- The foreign key column and the referenced column must have the same data type
-- Foreign key columns can have NULL values if they are not defined as NOT NULL.
-- Foreign key columns have Duplicate and missing value (PK have Unique and Not null values)

-- Cascading Rules
	-- ON DELETE CASCADE:
	-- If a row in the parent table is deleted, corresponding rows in the child table are automatically deleted.
	
    -- ON DELETE SET NULL:
	-- If a row in the parent table is deleted, the foreign key in the child table is set to NULL.
	
    -- ON UPDATE CASCADE:
	-- If a primary key value in the parent table is updated, corresponding foreign keys in the child table are automatically updated.
	
    -- ON DELETE RESTRICT or:
    -- ON UPDATE RESTRICT:
	-- Prevents deletion or update in the parent table if it has corresponding foreign key references.

-- Syntax

-- At the time of table creation:

	-- CREATE TABLE ChildTable (
	--     child_id INT PRIMARY KEY,
    --      ....
	--     parent_id INT,
	--     FOREIGN KEY (parent_id from child table(FK)) REFERENCES ParentTable(parent_id from parent table(PK))
	--     ON DELETE CASCADE --(optional)
	--     ON UPDATE CASCADE --(optional)
	-- );

-- After creating the table/existing table:
	-- ALTER TABLE ChildTable
	-- ADD CONSTRAINT fk_name FOREIGN KEY (parent_id from child table) REFERENCES ParentTable(parent_id from parent table)
	-- ON DELETE SET NULL --(optional)
	-- ON UPDATE CASCADE --(optional);



-- Create the 'customer' table
CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the 'orders' table with a foreign key referencing 'customers'
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



-- Create the 'customer1' table
CREATE TABLE customer1(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the 'orders1' table with a foreign key referencing 'customer1'
CREATE TABLE orders1(
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer1(customer_id)
);

desc orders1;
-- Primary Key (PRI): This indicates that the column is the primary key of the table. The primary key uniquely identifies each row in the table.
-- Unique (UNI): This indicates that the column is part of a unique index, which enforces the uniqueness of values in that column.
-- Multiple (MUL): This indicates that the column is part of a non-unique index. It's not unique by itself, and multiple rows in the table can have the same value in this column. This could be used to improve query performance for columns that are frequently searched or used for filtering.

-- Find name of the foreign key
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'customer1'
  AND TABLE_NAME = 'orders1';

