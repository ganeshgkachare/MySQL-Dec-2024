-- INNER JOIN : Returns rows where there is a match in both tables.

-- Syntax - 

	-- SELECT a.column_name, b.column_name
	-- FROM table_name a  INNER JOIN table_name b
	-- ON a.column_name = b. Column_name;         -- Recommended for most cases

-- OR

	-- SELECT a.column_name, b.column_name
	-- FROM table_name a, table_name b
	-- WHERE a.column_name = b. Column_name;  -- Old code not recommended

-- OR

	-- SELECT column_name, column_name
	-- FROM table_name   INNER JOIN table_name
	-- USING (common_column_name);           -- Good for simple cases with identical column names

-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

select * from emp_log;
select * from emp_details;

SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id = b.emp_id;


SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a JOIN emp_details b       -- INNER JOIN = JOIN
ON a.emp_id = b.emp_id;

-- Inner Join Using where
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a, emp_details b 
WHERE a.emp_id = b.emp_id;

-- Inner Join Using same column name

SELECT emp_id ,
	   name emp_name,
	   emp_id details_emp_id,
	   address details_emp_address,
	   address_code details_emp_code
FROM emp_log a JOIN emp_details b 
USING (emp_id);

-- Inner Join with three tables
select * from emp_log;
select * from emp_details;
select * from address_code_name;

SELECT 
    a.emp_id emp_id,
    a.name emp_name,
    b.emp_id details_emp_id,
    b.address details_emp_address,
    b.address_code details_emp_code,
    c.add_code_name
FROM emp_log a INNER JOIN emp_details b ON a.emp_id = b.emp_id
INNER JOIN address_code_name c ON c.add_code = b.address_code;



-- using where
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a, emp_details b, address_code_name c
WHERE a.emp_id = b.emp_id and c.add_code = b.address_code;


    
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
  FROM emp_log a 
       INNER JOIN emp_details b ON a.emp_id = b.emp_id
       INNER JOIN address_code_name c ON c.add_code = b.address_code;
       
 
-- ---------------------------------------
-- OUTER Join  

-- a)	LEFT Outer Join (LEFT Join) –
	-- The left join returns all rows from the left table and the matching rows from the right table.
	-- If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls.
	-- The left join is also known as left outer join. The outer keyword is optional.
	-- If you want to get only rows from the left table that do not exist in the right table. To achieve this, you use the left join and a WHERE clause to exclude the rows from the right table.

-- Syntax – 
	-- SELECT a.column_name, b.column_name
	-- FROM table_name a LEFT JOIN table_name b
	-- ON a.column_name = b.column_name;

select * from emp_log;
select * from emp_details;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT JOIN  emp_details b 
ON a.emp_id = b.emp_id;



SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT OUTER JOIN   emp_details b 
ON a.emp_id = b.emp_id;


-- To get the rows that are available only in the left table but not in the right table Then add a WHERE clause.

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
LEFT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE b.emp_id IS NOT NULL;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE b.emp_id IS NULL;

