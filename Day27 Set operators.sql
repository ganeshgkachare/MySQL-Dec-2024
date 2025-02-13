-- Set operators

-- In MySQL, UNION, UNION ALL, INTERSECT, and EXCEPT are set operators used to combine or manipulate the results of 
-- two or more SELECT statements.
-- They allow you to perform operations such as combining, intersecting, or subtracting result sets.
-- Set operators in MySQL are:
	-- UNION
	-- UNION ALL
	-- INTERSECT (not directly supported in MySQL but can be simulated)
	-- EXCEPT (not directly supported in MySQL but can be simulated)

-- UNION operator:
	-- The UNION operator is used to combine the results of two or more SELECT statements into a single result set.
	-- The result set is distinct, meaning it contains only unique values.
	-- If you want to include duplicate values, use the UNION ALL operator.
	-- Both SELECT statements must have the same number of columns.
	-- Corresponding columns must have compatible data types.

-- Syntax:
	-- SELECT column1, column2, ... 
	-- FROM table1 
	-- UNION 
	-- SELECT column1, column2, ... 
	-- FROM table2;

-- UNION ALL operator:
	-- The UNION ALL operator is similar to the UNION operator, but it includes all rows, including duplicates, from all SELECT statements.
	-- This can be useful when you want to combine data from multiple tables or sources without removing any duplicate records.
	-- Using UNION (without ALL) might be slower because it eliminates duplicates. Use UNION ALL if you don't need duplicate elimination, as it is more efficient.

-- Syntax: 	
	-- SELECT column1, column2, ... 
	-- FROM table1 
	-- UNION ALL 
	-- SELECT column1, column2, ... 
	-- FROM table2;

-- INTERSECT operator:
	-- The INTERSECT operator is used to combine the results of two or more SELECT statements, but only returns the records that are
	--  common to all SELECT statements.
	-- MySQL does not directly support INTERSECT. However, it can be simulated using a JOIN or by combining SELECT with a WHERE clause.
-- Syntax: 	
	-- MySQL does not directly support INTERSECT
		-- SELECT column1, column2, ... 
		-- FROM table1 
		-- INTERSECT 
		-- SELECT column1, column2, ... 
		-- FROM table2;
   -- Simulated using a JOIN or by combining SELECT with a WHERE clause (Inner Join) :Returns the common rows from two SELECT statements. It finds the intersection between two result sets.
		-- SELECT column1 FROM table1
		-- JOIN table2 ON table1.column1 = table2.column1;

-- EXCEPT operator:
	-- The EXCEPT operator is used to return all the records from the first SELECT statement that are not present in the results of the 
	-- second SELECT statement. 
    -- MySQL does not support EXCEPT directly, but you can simulate it using a LEFT JOIN or NOT EXISTS.
-- Syntax: 
	-- MySQL does not support EXCEPT directly
		-- SELECT column1, column2, ... 
		-- FROM table1 
		-- EXCEPT 
		-- SELECT column1, column2, ... 
		-- FROM table2;
	-- Simulate it using a LEFT JOIN : Returns the rows from the first SELECT statement that are not present in the second SELECT statement.
		-- SELECT column1 FROM table1
		-- LEFT JOIN table2 ON table1.column1 = table2.column1
		-- WHERE table2.column1 IS NULL;
        
-- Guidelines for Using Set Operators:
-- Column Compatibility: All queries used with set operators must have the same number of columns, and corresponding columns must have compatible data types.
-- Column Names: The column names in the final result set will come from the first SELECT statement (if the SELECT statements have different column names).
-- Order of Results: The result set will be sorted by the first column in the combined set (unless an ORDER BY clause is specified after the set operation).


CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

CREATE TABLE contractors (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

-- Many SQL engines allow implicit conversion.

-- Behavior of Different SQL Databases:
-- Database 		Implicit Type Conversion
-- MySQL			Performs implicit conversion
-- PostgreSQL		Strict, may throw an error
-- SQL Server		Allows conversion in some cases
-- Oracle			May throw an error in strict mode

-- Solution 2: Explicit Type Casting
-- If you want to ensure that a data type mismatch results in an error, use the CAST function.
-- CAST function:  In MySQL is used to explicitly convert a value from one data type to another.

SELECT id, 
       CAST(first_name AS CHAR) AS first_name, 
       CAST(salary AS SIGNED) AS salary,
       CAST(last_name AS CHAR) AS last_name
FROM employees 
UNION 
SELECT id, 
       CAST(first_name AS CHAR), 
       CAST(last_name AS CHAR), 
       CAST(salary AS SIGNED)  
FROM contractors;



