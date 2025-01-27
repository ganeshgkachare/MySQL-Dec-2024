-- Pattern Matching Operators
	-- LIKE Used for pattern matching with wildcards:
		-- % matches zero or more characters.
		-- _ matches a single character.
	-- NOT LIKE

-- MySQL
-- MySQLServer
  --  %y%  -- MySQL, MySQLServer
  --  _y___ -- MySQL
   

SELECT * FROM employees;
--  Retrieve employees whose first name starts with 'A'
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'A%';

--  Retrieve employees whose first name does not starts with 'A'
SELECT * FROM employees WHERE first_name NOT LIKE 'A%';

--  Retrieve employees whose first name ends with 'A'
SELECT * FROM employees WHERE first_name LIKE '%A';

--  Retrieve employees whose first name contains 'An'
SELECT * FROM employees WHERE first_name LIKE '%an%';

--  Retrieve employees whose first name first, third and fith characters are A, j and n resp.
SELECT * FROM employees WHERE first_name LIKE 'A_j_n';

SELECT * FROM employees;

select emp_id, first_name, last_name, department_id FROM employees
Where department_id=1 or department_id=2 or department_id=3;

select emp_id, first_name, last_name, department_id FROM employees
Where department_id=1 and department_id=2 and department_id=3;

-- Range and Set Operators
	-- BETWEEN ... AND : Checks if a value is within a specified range (inclusive).
	-- NOT BETWEEN ... AND

	-- IN :Checks if a value is in a list of specified values.
	-- NOT IN




SELECT emp_id, first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

SELECT emp_id, first_name, last_name, salary
FROM employees
WHERE salary Not BETWEEN 40000 AND 60000;

SELECT emp_id, first_name, last_name, joining_date
FROM employees
WHERE joining_date BETWEEN '2020-01-01' AND '2022-12-31';

SELECT emp_id, first_name, last_name, joining_date
FROM employees
WHERE joining_date NOT BETWEEN '2020-01-01' AND '2022-12-31';

SELECT emp_id, first_name, last_name, department_id
FROM employees
WHERE department_id IN (1, 2, 3);

SELECT emp_id, first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (1, 2, 3);

SELECT emp_id, first_name, last_name, city
FROM employees
WHERE city NOT IN ('Mumbai', 'Delhi', 'Bangalore');