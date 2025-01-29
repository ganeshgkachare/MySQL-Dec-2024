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



SELECT * FROM employees;

SELECT * FROM employees
ORDER BY first_name;

SELECT DISTINCT first_name
FROM employees
order by first_name;

SELECT first_name
FROM employees
order by first_name;

SELECT DISTINCT first_name,last_name
FROM employees
order by first_name;

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT city
FROM employees;

SELECT DISTINCT manager_id
FROM employees;


-- --------------------------------------------------------------------------------------

-- Group By clause:
	-- The GROUP BY clause in SQL is used to group rows with the same values in specified columns into aggregate data.
	-- Group By clause returns one row per group.
	-- The GROUP BY clause is often used with aggregate functions such as AVG (), COUNT (), MAX (), MIN () and SUM ().
	-- Group By clause appears after the FROM clause. In case WHERE clause is presented, the Group By clause must be placed after the WHERE clause

-- How GROUP BY Works
	-- Groups Rows: Rows with identical values in the specified column(s) are grouped together.
	-- Applies Aggregate Functions: An aggregate function is applied to each group to compute summary statistics.
-- Syntax - Without Where Clause

-- SELECT column_1, column_2, column_3 
-- FROM table_name
-- GROUP BY column_1, column_2, column_3;   
--    
-- Syntax - With Where Clause

-- SELECT column_1, column_2, column_3 
-- FROM table_name
-- WHERE condition
-- GROUP BY column_1, column_2, column_3;   


select * from employees;

SELECT city, count(emp_id) as Count_of_emp
FROM employees
GROUP BY city;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees;

-- Any column in the SELECT clause that is not used in an aggregate function must appear in the GROUP BY clause.
SELECT department_id, AVG(salary) 
FROM employees 
GROUP BY department_id;

SELECT department_id, salary, AVG(salary)
FROM employees
GROUP BY department_id;

-- Calculate the average salary for each department.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Calculate the average salary for each department.
SELECT department_id, Min(salary) AS min_salary
FROM employees
GROUP BY department_id;

-- --------------------------------------------------------------------------------------

-- Aggregate function
	-- An aggregate function performs a calculation of one or more values and returns a single value.
	-- The aggregate function is often used with the GROUP BY clause and HAVING clause of the SELECT statement.
	-- Group function cannot be used in where clause and group by clause. 
	--  Aggregate functions ignore NULL values except for COUNT(*).
	-- Aggregate functions are  Min, Max, Sum, Avg, Count
		-- Min - returns the lowest value (minimum) in a set of non-NULL values.
		-- Max - returns the highest value (maximum) in a set of non-NULL values.
		-- Sum - returns the summation of all non-NULL values in a set.
		-- Avg - calculates the average of non-NULL values in a set.
		-- Count - returns the number of rows in a group, including rows with NULL values.      


select * from employees;

SELECT COUNT(first_name)
FROM employees;

SELECT COUNT(manager_id)
FROM employees;


SELECT COUNT(*) as Number_of_Records
FROM employees;
 
 SELECT COUNT(*) as num_employees 
FROM employees;

 SELECT COUNT(*) as num_employees 
 FROM employees
 WHERE city = "Pune";
 
SELECT * 
 FROM employees
 WHERE city = "Pune";
 
 
 
SELECT SUM(last_name) 
FROM employees;

SELECT SUM(salary) 
FROM employees;

SELECT Min(salary) 
FROM employees;

SELECT Max(salary) 
FROM employees
Where city="Pune";

SELECT Avg(salary) 
FROM employees;


SELECT Min(city) 
FROM employees;

SELECT Max(city) 
FROM employees;

-- -------------------------------------------------------------------------
