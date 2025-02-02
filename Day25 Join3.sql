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

-- Left Join with three tables –

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a  LEFT JOIN emp_details b ON a.emp_id = b.emp_id  
LEFT JOIN address_code_name c ON c.add_code = b.address_code;


-- ---------------------------------------------------------------
