-- Joins
	-- Join is used to combine data from two or more tables based on values of the related columns tables to form a single result set. 
	-- The related columns are typically the primary key column(s) of the first table and foreign key column(s) of the second table.
	-- The tables to be joined are listed in the FROM clause and the join conditions are defined in the WHERE clause.

-- Guidelines 
	-- When writing a SELECT statement that uses joins, provide the column name with the table name for clarity.
	-- If the same column name appears in more than one table, the column name must be prefixed with the table name or give table name an alias and provide that alias to the columns.
	-- To join ‘n’ tables together, you need a minimum of n-1 join conditions.


-- Types of Joins in MySQL:
	-- INNER JOIN : Returns rows where there is a match in both tables.
	-- LEFT JOIN (OUTER JOIN):Returns all rows from the left table, and the matching rows from the right table. Unmatched rows will contain NULL.
	-- RIGHT JOIN (OUTER JOIN):Returns all rows from the right table, and the matching rows from the left table. Unmatched rows will contain NULL.
	-- FULL JOIN (Not supported in MySQL; achive using UNION): Combines the result of LEFT JOIN and RIGHT JOIN.
	-- CROSS JOIN:Produces a Cartesian product of both tables.
	-- SELF JOIN:Joins a table with itself.



CREATE TABLE emp_log(
emp_id int PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE emp_details(
emp_id int PRIMARY KEY,
address VARCHAR(100),
address_code int
);

CREATE TABLE address_code_name(
add_code int PRIMARY KEY,
add_code_name VARCHAR(100)
);


INSERT INTO emp_log VALUES (1, 'Raj');
INSERT INTO emp_log VALUES (2, 'Priya');
INSERT INTO emp_log VALUES (3, 'Amit');
INSERT INTO emp_log VALUES (4, 'Sneha');
INSERT INTO emp_log VALUES (8, 'Vikram');
INSERT INTO emp_log VALUES (9, 'Ananya');
INSERT INTO emp_log VALUES (10, 'Rohit');

COMMIT;
select * from emp_log;

INSERT INTO emp_details VALUES (1, 'Mumbai', 4444);
INSERT INTO emp_details VALUES (2, 'Delhi', 5555);
INSERT INTO emp_details VALUES (3, 'Kolkata', 6666);
INSERT INTO emp_details VALUES (4, 'Chennai', 7777);
INSERT INTO emp_details VALUES (5, 'Hyderabad', 8888);
INSERT INTO emp_details VALUES (6, 'Bangalore', 9999);
INSERT INTO emp_details VALUES (7, 'Pune', 2222);
INSERT INTO emp_details VALUES (11, 'Ahmedabad', 0003);
INSERT INTO emp_details VALUES (12, 'Jaipur', 0002);
INSERT INTO emp_details VALUES (13, 'Lucknow', 0001);
INSERT INTO emp_details VALUES (14, 'Surat', 0000);


COMMIT;

INSERT INTO address_code_name VALUES (4444, 'West Zone');
INSERT INTO address_code_name VALUES (5555, 'North Zone');
INSERT INTO address_code_name VALUES (6666, 'East Zone');
INSERT INTO address_code_name VALUES (7777, 'South Zone');
INSERT INTO address_code_name VALUES (8888, 'Central Zone');
INSERT INTO address_code_name VALUES (9999, 'South-East Zone');
INSERT INTO address_code_name VALUES (2222, 'West Zone-2');
INSERT INTO address_code_name VALUES (1111, 'North-East Zone');
INSERT INTO address_code_name VALUES (3333, 'East Zone-2');
COMMIT;

select * from emp_log;
select * from emp_details;
select * from address_code_name;

-- -----------------

-- INNER JOIN 
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
-- Syntax - 

-- SELECT a.column_name, b.column_name
-- FROM table_name a  INNER JOIN table_name b
-- ON a.column_name = b. Column_name;   

-- OR

-- SELECT a.column_name, b.column_name
-- FROM table_name a, table_name b
-- WHERE a.column_name = b. Column_name;

-- OR

-- SELECT column_name, column_name
-- FROM table_name   INNER JOIN table_name
-- USING (common_column_name); 

select * from emp_log;
select * from emp_details;

SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id < b.emp_id;

SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id != b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
INNER JOIN 
emp_details b 
ON a.emp_id = b.emp_id;



SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
INNER JOIN 
emp_details b 
ON a.emp_id < b.emp_id;


SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
JOIN emp_details b 
ON a.emp_id = b.emp_id;

