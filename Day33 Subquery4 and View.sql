-- Correlated Subquery -(repeating subquery) :The correlated subquery is also known as a repeating subquery.
	-- A correlated subquery is a subquery that uses the values of the outer query. 
	-- The inner query depends on the outer query values.
	-- A correlated subquery is executed repeatedly, once for each row evaluated by the outer query. 


-- Example 
	-- Find employees having at least one person reporting under them
    
-- Using Simple Subquery - 
SELECT * FROM EMP;

SELECT * FROM EMP
WHERE EMPNO IN (SELECT MGR
FROM EMP GROUP BY MGR);

SELECT * FROM EMP
WHERE EMPNO IN (7902, 7698,7839,7566,7788,7782);

-- Using Correlated Subquery  
SELECT * FROM EMP E
WHERE 1 <= (SELECT COUNT(*)  FROM EMP B WHERE B.MGR = E.EMPNO );

SELECT * FROM EMP E
WHERE 5 <= (SELECT COUNT(*)  FROM EMP B WHERE B.MGR = E.EMPNO );


-- Execution of Correlated Subquery
	-- If there are 18 record in emp table. It will keep repeating for the whole 18 records
	-- The inner query depends on the outer query.
	-- The inner query runs for each row of the outer query.
    
-- EXISTS
-- NOT EXISTS
SELECT * FROM EMP E
WHERE EXISTS (SELECT 1  FROM EMP B WHERE B.MGR = E.EMPNO );


SELECT * FROM EMP E
WHERE NOT EXISTS (SELECT 1  FROM EMP B WHERE B.MGR = E.EMPNO );


-- ----------------------------------------------------

-- EXISTS 
	-- The EXISTS operator is a logical operator that allows you to check whether a subquery returns any row.
	-- The EXISTS operator returns TRUE if the subquery returns one or more rows.

-- Syntax -
	-- SELECT * FROM TABLE_NAME
	-- WHERE EXISTS (SUBQUERY);
-- The subquery is a SELECT statement only. 
-- As soon as the subquery returns rows, the EXISTS operator returns TRUE and stops processing immediately.

-- Example 

-- Using EXISTS with a correlated subquery

SELECT * FROM EMP E
WHERE EXISTS (SELECT 11  FROM EMP B WHERE B.MGR = E.EMPNO ); -- The EXISTS keyword is used to check whether a subquery returns any rows.

SELECT * FROM EMP E
WHERE EXISTS (SELECT 2  FROM EMP B WHERE B.MGR = E.EMPNO );

SELECT * FROM EMP E
WHERE EXISTS (SELECT 1000000  FROM EMP B WHERE B.MGR = E.EMPNO );


Select * from dept where not exists  (select 1 from emp where dept.deptno = emp.deptno);

-- It is use to complete the syntax we can write anything in place of 1 


-- ----------------------------------------------------

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
