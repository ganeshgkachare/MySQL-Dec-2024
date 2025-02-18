-- Non-Correlated Subquery (Simple Subquery) 
-- 1) Single Row Subquery : returns a single value (a single row with a single column).
SELECT * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- 2) Multi Row Subquery : returns more than one row, typically a column of values. 
	-- Used with operators like IN, ANY, or ALL, which can handle multiple values.

	-- =any same as same as IN Operator
	-- <any means less than maximum 
	-- >any means greater than minimum 
	-- >all means greater than maximum value 
	-- <all means less than the minimum value
												 --    sal < 100
												--     sal < any (45,36,78,90)
												--     sal < all (45,36,78,90)
--  value < ANY (subquery) will return all rows where the value is less than any of the 
-- 			values returned by the subquery. 
--  value > ALL (subquery) will return all rows where
--  		the value is greater than all of the values returned by the subquery.

--  = operator is used for exact match comparison, the IN operator is used to match a column
--  value against a list of values, and the ANY and ALL operators are used to compare a single value
--  with a set of values returned by a subquery.

-- Example -

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO =ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO <ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO >ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO >ALL (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK', 'DALLAS'));

SELECT * FROM EMP WHERE DEPTNO <ALL (SELECT DEPTNO FROM DEPT WHERE LOC IN ('BOSTON','CHICAGO'));


SELECT * FROM EMP;
SELECT * FROM dept;


-- 3) Multi Column Subquery
	-- Used with operators like IN when you need to match multiple columns.
SELECT * FROM emp;
SELECT * FROM DEPT;

Select * from emp where (deptno, sal) in (select deptno,max(sal) from emp group by deptno);

Select * from emp where (deptno, sal) in (select max(sal),deptno from emp group by deptno);



-- Homework
-- Find 5th highest salary
