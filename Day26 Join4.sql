-- b)	RIGHT Outer Join (RIGHT Join)
	-- The RIGHT [OUTER] JOIN is the opposite of the LEFT [OUTER] JOIN.
	-- The right join returns all rows from the right table and the matching rows from the left table. 
	-- If a row in the right table does not have a matching row in the left table, the columns of the left table will have nulls values.
	-- The right join is also known as right outer join. The outer keyword is optional.
	-- If you want to get only rows from the right table that do not exist in the left table. To achieve this, you use the right join and a WHERE clause to exclude the rows from the left table.

-- Syntax – 
	-- SELECT a.column_name, b.column_name
	-- FROM table_name a RIGHT JOIN table_name b
	-- ON a.column_name = b.column_name;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM  emp_details b RIGHT OUTER JOIN  emp_log a
ON a.emp_id = b.emp_id;

-- To get the rows that are available only in the RIGHT table but not in the left table then add a WHERE clause.

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE a.emp_id IS NULL;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE a.emp_id IS NOT NULL;

-- Right Join with three tables –


SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a 
RIGHT JOIN emp_details b ON a.emp_id = b.emp_id
RIGHT JOIN address_code_name c ON c.add_code = b.address_code;

-- c.	FULL Outer Join (FULL Join) –
	-- Full outer join or full join returns a result set that contains all rows from both left and right tables, with the matching rows
	-- 	from both sides where available. If there is no match, the missing side will have null values. 
	-- MySQL does not support FULL OUTER JOIN directly. 
	-- FULL Outer Join is  UNION of LEFT JOIN and a RIGHT JOIN.

-- Syntax 

	-- Not Support in MySQL
		-- SELECT a.column_name, b.column_name               
		-- FROM table_name a FULL OUTER JOIN table_name b
		-- ON a.column_name = b.column_name;

	-- FULL OUTER JOIN simulated using LEFT JOIN and RIGHT JOIN combined with UNION in MySQL
		-- SELECT a.column_name, b.column_name
		-- FROM table_name a LEFT JOIN table_name b
		-- ON a.column_name = b.column_name;
		-- UNION
		-- SELECT a.column_name, b.column_name
		-- FROM table_name a RIGHT JOIN table_name b
		-- ON a.column_name = b.column_name;

-- Not Support in MySQL
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a FULL OUTER JOIN emp_details b 
ON a.emp_id = b.emp_id;


-- FULL OUTER JOIN simulated using LEFT JOIN and RIGHT JOIN combined with UNION in MySQL
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
UNION
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT JOIN emp_details b 
ON a.emp_id = b.emp_id;


-- ------------------------------------------------------------------------------------------------------------------------- 

--	Cross join
	-- A cross join is the deliberate creation of a Cartesian product. There are no join columns specified, so every possible combination of rows between the two tables is produced.
	-- To create a Cartesian product of tables, you use the cross join clause.
	-- Unlike other joins such as inner join or left join, cross join does not have the on clause with a join predicate.
	-- When you perform a cross join of two tables, which have no relationship, you will get a Cartesian product of rows and columns of both tables.
	-- The cross join is useful when you want to generate plenty of rows for testing. 
	-- Suppose we have two tables that have m and n rows, the Cartesian product of these tables has m x n rows.


-- Syntax
	-- SELECT a.column_name, b.column_name
	-- FROM table1 a CROSS JOIN table2 b;

	-- OR

	-- SELECT * FROM table1, table2;

SELECT a.emp_id "Employee id",
	   a.name "Employee name",
	   b.emp_id "Details emp id",
	   b.address "Details emp address",
	   b.address_code "Details emp code"
FROM emp_log a  CROSS JOIN emp_details b;

SELECT a.emp_id Employee_id,
	   a.name "Employee name",
	   b.emp_id "Details emp id",
	   b.address "Details emp address",
	   b.address_code "Details emp code"
FROM emp_log a CROSS JOIN emp_details b;

SELECT a.emp_id "Employee id",
	   a.name "Employee name",
	   b.emp_id "Details emp id",
       b.address "Details emp address",
	   b.address_code "Details emp code"
FROM emp_log a, emp_details b;

SELECT * FROM emp_log , emp_details;

-- ------------------------------------------------------------------------------------------------------------------------- 

-- 	SELF Join 
	-- A self-join is a join that joins a table with itself. A self-join is useful for comparing rows within a table.
	-- A self-join uses other joins such as inner join and left join. In addition, it uses the table alias to assign the table different names in the same query.
	-- Note - Referencing the same table more than once in a query without using table aliases cause an error.
	-- A self-join simply specifies that each rows of a table is combined with itself and every other row of the table.

-- Syntax 
	-- SELECT a.column_name, b.column_name...   
	-- FROM table1 a Left/Right/Inner Join table1 b   
	-- WHERE a.common_field = b.common_field;
    
CREATE TABLE Employees_data (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Manager_ID INT,
    Email VARCHAR(100) );
    
INSERT INTO Employees_data (Employee_ID, Name, Manager_ID, Email) VALUES
(1, 'Aarav', NULL, 'aarav@gmail.com'),
(2, 'Vihaan', 1, 'vihaan@gmail.com'),
(3, 'Anaya', 1, 'anaya@gmail.com'),
(4, 'Ishaan', 2, 'ishaan@gmail.com'),
(5, 'Myra', 2, 'myra@gmail.com'),
(6, 'Kabir', 3, 'kabir@gmail.com'),
(7, 'Aanya', 3, 'aanya@gmail.com'),
(8, 'Riya', 4, 'riya@gmail.com'),
(9, 'Sara', 4, 'sara@gmail.com'),
(10, 'Aryan', 5, 'aryan@gmail.com');

commit;
select * from Employees_data;


SELECT e1.Employee_ID AS Employee_ID,
       e1.Name AS Employee_Name,
       e1.Email AS Employee_Email,
       e2.Employee_ID AS Manager_ID,
       e2.Name AS Manager_Name,
       e2.Email AS Manager_Email
FROM Employees_data e1 LEFT JOIN Employees_data e2
    ON e1.Manager_ID = e2.Employee_ID;
    
-- -------------------------------------------------------------------------------------------
