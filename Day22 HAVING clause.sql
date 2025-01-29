-- GROUP BY clause :
	-- Groups rows that have the same values in specified columns.
	-- Any column in the SELECT list that is not part of an aggregate function must appear in the GROUP BY clause.
SELECT * FROM employees;

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- Non-Aggregated Columns Must Be in GROUP BY
	-- If you include a column in the SELECT clause but do not use it in an aggregate function, it must be listed in the GROUP BY clause.
-- Correct Example:
SELECT department_id, city, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, city;
-- Incorrect Example:
SELECT department_id, city, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- This will throw an error because city is not aggregated and is not in the GROUP BY clause.

-- -------------------------------------------------------------------------------------------------
-- HAVING clause :
	-- Used to filter groups of rows that are created by the GROUP BY clause.
	-- WHERE clause filters rows before grouping. HAVING clause filters groups after the aggregation has been performed.
	-- Difference between the having and where clauses is Having clause filters groups of rows while the where clause filters rows.
	-- Having clause is usually used with the Group by clause. 
	-- If you use the having clause without the Group by clause, the having clause works like the where clause.
	-- It allows you to filter aggregated data.
	-- It can use aggregate functions like COUNT(), SUM(), AVG(), etc.


-- Syntax
	-- SELECT column_list, aggregate_function(column_name)
	-- FROM Table
	-- WHERE condition
	-- GROUP BY  column_list
	-- HAVING condition


-- Having clause using an multiple aggregate function -


SELECT department_id, MIN(salary), MAX(salary), SUM(salary) 
FROM employees
GROUP BY department_id;



SELECT department_id, MIN(salary), MAX(salary), SUM(salary) 
FROM employees
GROUP BY department_id
HAVING MIN(salary)>50000;


SELECT * FROM employees;

SELECT *
FROM employees
Where department_id =1;

SELECT *
FROM employees
HAVING department_id =1;

