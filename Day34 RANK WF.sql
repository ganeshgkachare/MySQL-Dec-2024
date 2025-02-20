
-- View
	-- A View is a virtual table based on a SQL query. It does not store data physically
	-- Use	-- Simplify Complex Queries
			-- Data Transformation
			-- Summarization
			-- Code Reuse
        

-- CREATE VIEW
-- Syntax 
	-- CREATE VIEW myview_name AS
	-- SELECT column1, column2, column3
	-- FROM mytable
	-- WHERE column1 = 'value';

SELECT * FROM EMP;

Create view Team_emp As
SELECT EMPNO,ENAME,MGR from EMP
Where MGR=7902;


select * from Team_emp;

-- Updating a View
-- Syntax 
	-- CREATE OR REPLACE VIEW view_name AS
	-- SELECT column1, column2,
	-- FROM table_name
	-- WHERE condition;

CREATE OR REPLACE VIEW Team_emp AS
SELECT EMPNO,ENAME,MGR from EMP
Where MGR IN (7902,7839);

select * from Team_emp;


-- Drop View
-- Syntax 
	-- DROP VIEW view_name;

DROP VIEW Team_emp;
-- --------------------------------------------------------------

-- SQL Window Function
	-- An advanced SQL tool performing a calculation for every record in the data set, using other records
    -- 	associated with the specified one from the table
    
-- 1) Aggregate WF
	-- COUNT() 
	-- SUM() 
	-- AVG() 
	-- MAX() 
	-- MIN() 

SELECT department_id, MIN(salary), MAX(salary), SUM(salary) 
FROM employees
GROUP BY department_id;




-- 2) Non Aggregate WF
-- 2.1) RANK WF
-- 		   ROW_NUMBER() - assigns a unique integer value to each row
--         RANK()       - gap in the sequence.
--         DENSE_RANK() - without gaps in the sequence.		

-- 2.2) VALUE WF
-- 		 LAG() - returns the value of a specified column for the previous row. 
-- 		 LEAD() - returns the value of a specified column for the next row. 


-- PARTITION BY clause
-- A PARTITION BY clause is used to partition rows of table into groups. 
-- It is useful when we have to perform a calculation on individual rows of a group using other rows of that group.

-- It is always used inside OVER() clause.
-- If this clause is omitted in OVER() clause, then whole table is considered as a single partition.


-- drop table employee;
CREATE TABLE employee (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL
);
INSERT INTO employee (id, name, age, salary) VALUES
    (1, 'John', 28, 50000),
    (2, 'Mary', 28, 60000),
    (3, 'David', 42, 75000),
    (4, 'Sarah', 25, 45000),
    (5, 'Tom', 30, 55000),
    (6, 'Emily', 32, 65000),
    (7, 'Alex', 29, 52000),
    (8, 'Jessica', 31, 62000),
    (9, 'Mark', 27, 48000),
    (10, 'Lisa', 33, 68000),
     (11, 'Mark', 27, 48000),
    (12, 'Lisa', 33, 68000);
commit;
select * from employee;
-- drop table employee;

-- ROW_NUMBER() - assigns a unique integer value to each row


SELECT id, name, age,
ROW_NUMBER() OVER () AS row_num
FROM employee;


SELECT id, name, age,
ROW_NUMBER() OVER (PARTITION BY age ORDER BY name DESC) AS row_num
FROM employee;

SELECT id, name, age,
ROW_NUMBER() OVER w AS row_num
FROM employee
WINDOW w AS (PARTITION BY age ORDER BY name DESC);
