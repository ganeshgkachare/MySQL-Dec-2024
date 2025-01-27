-- ORDER BY Clause 
	-- Order by clause is used to sort the records in your result set. The Order By clause can only be used in Select statements.
	-- If the ASC or DESC modifier is not provided in the Order by clause, the results will be sorted by expression in ascending order. This is equivalent to Order By expression ASC.
	-- You can sort by multiple columns by separating them with commas. Sorting will occur sequentially.
    -- You can also use the Order by clause to sort by relative position in the result set, where the first field in the result set is 1. The next field is 2, and so on.
	-- SQL treats NULL as the lowest values.
	-- The Order by clause is the very last clause to be processed in Select Statement.
	-- It is possible to sort the result set by a column that does not appear on the select list.
-- Syntax
	-- SELECT column1, column2, ...
	-- FROM table_name
	-- ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...;


SELECT * FROM employees;

-- Sorting records without using Asc and Desc keywords
SELECT * FROM employees
ORDER BY first_name;

-- Sorting records using Asc and Desc keywords -
SELECT * FROM employees
ORDER BY first_name ASC;

SELECT * FROM employees
ORDER BY first_name desc;

SELECT * FROM employees
ORDER BY department_id;

SELECT * FROM employees
ORDER BY joining_date;

-- Sorting records using columns that is not in the select list
SELECT first_name FROM employees
ORDER BY department_id;

-- Sorting rows with NULL values
SELECT * FROM employees
ORDER BY manager_id desc;

SELECT * FROM employees
ORDER BY manager_id asc;

SELECT * FROM employees
ORDER BY first_name DESC;

SELECT * FROM employees
ORDER BY 4 DESC;

SELECT * FROM employees
ORDER BY 1 DESC;

SELECT department_id,emp_id, first_name, salary,  last_name, joining_date, manager_id, city, email FROM employees
ORDER BY 1 DESC;


SELECT * FROM employees
ORDER BY department_id;
SELECT * FROM employees
ORDER BY department_id ASC;

-- Sorting records using Asc and Desc keywords on multiple columns and different orders
SELECT * FROM employees
ORDER BY department_id ASC, salary DESC;

SELECT * FROM employees
ORDER BY department_id, salary;

-- --------------------------------------------------------------------------------------

-- LIMIT clause:  
	-- The LIMIT clause in MySQL is used to restrict the number of rows returned by a SELECT query.
	-- It is helpful when you need a subset of data
-- Syntax:
	-- SELECT column1, column2, ...
	-- FROM table_name
	-- LIMIT [offset,] row_count;

-- row_count: The maximum number of rows to return.
-- offset (optional): The number of rows to skip before starting to return rows.

SELECT * FROM employees;

SELECT * FROM employees
LIMIT 2;

SELECT * FROM employees
LIMIT 2,2;

SELECT first_name, last_name, salary FROM employees
order by salary desc
limit 5;


-- Find Top 5 Employees with Highest Salaries:
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- --------------------------------------------------------------------------------------

-- DISTINCT Clause:
	-- The DISTINCT clause is used in SQL to remove duplicate rows from the result set. 
	-- The DISTINCT clause can be used only in the SELECT statement.
	-- When only one expression is provided in the DISTINCT clause, the query will return the unique values for that expression.
	-- When more than one expression is provided in the DISTINCT clause, the query will retrieve unique combinations for the expressions listed.
	-- The DISTINCT clause only removes duplicates for the columns specified in the SELECT list. If no duplicates exist, all rows will be returned.
	-- DISTINCT treats NULL as a unique value. If a column contains multiple NULL values, only one NULL will be returned.

-- Syntax:

-- 	SELECT DISTINCT column1, column2, …..
-- FROM table_name
-- [WHERE conditions] ; 
