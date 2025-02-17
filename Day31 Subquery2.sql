-- Types of Subquery 
-- Non-Correlated Subquery (Simple Subquery) 
	-- The inner query is executed independently of the outer query.
	-- The inner query executed first then the result of inner query is used by outer query.

	-- 1) Single row Subquery : returns a single value (a single row with a single column).
	-- 2) Multi row Subquery : returns more than one row, typically a column of values. 
	-- 3) Multi column Subquery :returns more than one column and more than one row.
 
-- 1) Single Row Subquery : returns a single value (a single row with a single column).
	-- The inner query return only one row
	-- used with comparison operators like =, <>, <=, >=, <, >
select * from emp;
select * from dept;

SELECT * FROM EMP WHERE SAL = -- OUTER QUERY
(SELECT MAX(SAL) FROM EMP);   -- INNER QUERY

-- Example 
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL <> (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL < (SELECT AVG(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL <= (SELECT AVG(SAL) FROM EMP);

SELECT * FROM EMP
WHERE SAL > 39444.4444;  -- 22

 SELECT * FROM EMP 
 WHERE SAL <> 75000; -- 23
 
 
 -- Find Second / nth Highest salary
 SELECT MAX(SAL) as Second_High_Salary FROM EMP WHERE SAL <> (SELECT MAX(SAL) FROM EMP);
 
 Select SAL from emp
 order by SAL DESC
 LIMIT 5;
 
  Select SAL from emp
 order by SAL DESC
 LIMIT 1;
 
Select SAL from emp
 order by SAL DESC
 LIMIT 1,1;
 
Select SAL from emp
 order by SAL DESC
 LIMIT 2,1;
 
Select distinct SAL from emp  
 order by SAL DESC
 LIMIT 2,1;
 
 
 
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
