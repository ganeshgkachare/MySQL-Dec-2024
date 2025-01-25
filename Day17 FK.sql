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



-- Syntax to drop FOREIGN KEY constraint
-- 	ALTER TABLE table_name
-- 	DROP FOREIGN KEY constraint_name;

-- Find name of the foreign key
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'customer1'
  AND TABLE_NAME = 'orders1';


ALTER TABLE orders1
DROP FOREIGN KEY orders1_ibfk_1;



SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'customer1'
  AND TABLE_NAME = 'orders1';

SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    UPDATE_RULE, 
    DELETE_RULE 
FROM 
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
WHERE 
    TABLE_NAME = 'orders1';

-- Existing table 
ALTER TABLE orders1
ADD CONSTRAINT fk_orders1 FOREIGN KEY (customer_id) REFERENCES customer1(customer_id)
ON DELETE CASCADE;

SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    UPDATE_RULE, 
    DELETE_RULE 
FROM 
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
WHERE 
    TABLE_NAME = 'orders1';
    
truncate table customer1;
-- Insert records into customer1 table (parent table)
INSERT INTO customer1 (customer_id, customer_name, email) VALUES (1, 'Snehav Sharma', 'snehavs@gmail.com');
INSERT INTO customer1 (customer_id, customer_name, email) VALUES (2, 'Ravi Kumar', 'ravik@gmail.com');
INSERT INTO customer1 (customer_id, customer_name, email) VALUES (3, 'Rahul Kumar', 'rahulk@gmail.com');

INSERT INTO customer1 (customer_id, customer_name, email) VALUES (3, 'Rahul Kumar', 'rahulk@gmail.com');
INSERT INTO customer1 (customer_id, customer_name, email) VALUES (null, 'Rahul Kumar', 'rahulk@gmail.com');

-- Insert records into order1 table (child table)
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (101, '2025-01-03', 1);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (102, '2025-01-04', 2);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (103, '2025-01-05', Null);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (104, '2025-01-05', 2);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (104, '2025-01-06', 4);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (105, '2025-01-06', 5);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (111, '2025-01-06', 3);
INSERT INTO orders1 (order_id, order_date, customer_id) VALUES (112, '2025-01-06', 4);

SELECT * FROM customer1;
SELECT * FROM orders1;
desc orders1;

-- Delete the customer
DELETE FROM customer1 WHERE customer_id = 1;

SELECT * FROM customer1;
SELECT * FROM orders1;

DELETE FROM orders1 WHERE customer_id = 2;

SELECT * FROM customer1;
SELECT * FROM orders1;


-- FK column must reference an existing PK in the parent table.

-- ----------------------------------------------------------------------

-- SELECT 
-- The SELECT statement in SQL is used to retrieve data from one or more tables in a database. 
-- Does not affect data
	-- Select required columns
	-- Filter records
	-- Sort values
	-- Group data
	-- Join tables
    
SELECT * FROM orders1; -- * ==> List of all

SELECT customer_id, order_id FROM orders1;

-- WHERE clause : Used in SQL to filter records in a database query.

-- Syntax:
	-- SELECT column1, column2, ...
	-- FROM table_name
	-- WHERE condition;
    
SELECT customer_id, order_id FROM orders1
where customer_id = 2;