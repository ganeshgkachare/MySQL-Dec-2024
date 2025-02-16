-- Date Functions

-- NOW(): Returns the current date and time.
	-- Syntax: NOW()

SELECT NOW();  -- 'YYYY-MM-DD HH:MM:SS'

-- CURDATE(): Returns the current date without the time.
	-- Syntax: CURDATE()

SELECT CURDATE();  -- "YYYY-MM-DD"

-- DATE_ADD(): Adds a time interval to a date.
	-- Syntax: DATE_ADD(date, INTERVAL value unit)

SELECT DATE_ADD('2025-01-23', INTERVAL 10 DAY); 
SELECT DATE_ADD('2025-01-23', INTERVAL 10 month);
SELECT DATE_ADD('2025-01-23', INTERVAL 2 year);
SELECT DATE_ADD('2025-01-23', INTERVAL 10 minute); 

-- DATE_SUB(): Subtracts a time interval from a date.
	-- Syntax: DATE_SUB(date, INTERVAL value unit)

SELECT DATE_SUB('2025-01-23', INTERVAL 5 DAY); 

-- DATEDIFF(): Returns the number of days between two dates.
	-- Syntax: DATEDIFF(date1, date2)

SELECT DATEDIFF('2025-01-23', '2025-01-25');
SELECT DATEDIFF('2025-01-25','2025-01-23');

-- YEAR(): Extracts the year from a date.
	-- Syntax: YEAR(date)

SELECT YEAR('2025-01-23');

-- MONTH(): Extracts the month from a date.
	-- Syntax: MONTH(date)

SELECT MONTH('2025-01-23'); 

SELECT monthname('2025-01-23'); 

-- DAY(): Extracts the day from a date.
	-- Syntax: DAY(date)

SELECT DAY('2025-01-27'); 
SELECT dayname('2025-01-27'); 

-- WEEK(): Returns the week number of a date.
	-- Syntax: WEEK(date)

SELECT WEEK('2025-01-26'); 

SELECT WEEK('2025-02-5'); 

-- DATE_FORMAT(): Formats a date according to a specific format.
	-- Syntax: DATE_FORMAT(date, format)

SELECT DATE_FORMAT('2025-01-23', '%Y-%m-%d'); 
SELECT DATE_FORMAT('2025-01-23', '%d-%m-%Y'); 


-- --------------------------------------------------------------------------------

-- Subquery
-- A Subquery also known as an inner or nested query is a query inside another SQL query.
-- It can be used in various parts of an SQL query, such as in SELECT, INSERT, UPDATE, and DELETE statements.
-- Subqueries allow you to break down complex queries into simpler, more manageable parts.
-- The result returned by the inner query will be used as an input to the outer query.

CREATE TABLE DEPT(  
  DEPTNO     int PRIMARY KEY,  
  DNAME      VARCHAR(20),  
  LOC        VARCHAR(20)
);

CREATE TABLE EMP(  
  EMPNO      INT PRIMARY KEY,  
  ENAME      VARCHAR(10),  
  JOB        VARCHAR(9),  
  MGR        INT,  
  HIREDATE  DATE,  
  SAL              INT,  
  COMM       INT,  
  DEPTNO     INT ,  
  FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);

 INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON'),
(50, 'MARKETING', 'LOS ANGELES'),
(60, 'FINANCE', 'HOUSTON'),
(70, 'ENGINEERING', 'SAN FRANCISCO'),
(80, 'HUMAN RESOURCES', 'SEATTLE'),
(90, 'IT', 'AUSTIN'),
(100, 'CUSTOMER SERVICE', 'MIAMI'),
(110, 'ADMINISTRATION', 'NEW YORK'),
(120, 'PURCHASING', 'DALLAS'),
(130, 'PUBLIC RELATIONS', 'CHICAGO'),
(140, 'PRODUCTION', 'BOSTON'),
(150, 'RECRUITING', 'LOS ANGELES'),
(160, 'RETAIL', 'HOUSTON'),
(170, 'SAFETY', 'SAN FRANCISCO'),
(180, 'SECURITY', 'SEATTLE'),
(190, 'TRAINING', 'AUSTIN'),
(200, 'WAREHOUSING', 'MIAMI');


INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'RAJESH', 'CLERK', 7902, '1980-12-17', 24000, NULL, 20),
(7499, 'VIKRAM', 'SALESMAN', 7698, '1981-02-20', 40000, 3000, 30),
(7521, 'KUMAR', 'SALESMAN', 7698, '1981-02-22', 35000, 5000, 30),
(7566, 'RAVI', 'MANAGER', 7839, '1981-04-02', 50000, NULL, 20),
(7654, 'NAVEEN', 'SALESMAN', 7698, '1981-09-28', 35000, 14000, 30),
(7698, 'SANTOSH', 'MANAGER', 7839, '1981-05-01', 48000, NULL, 30),
(7782, 'RAJEEV', 'MANAGER', 7839, '1981-06-09', 42000, NULL, 10),
(7788, 'AMIT', 'ANALYST', 7566, '1982-12-09', 55000, NULL, 20),
(7839, 'KUMAR', 'PRESIDENT', NULL, '1981-11-17', 75000, NULL, 10),
(7844, 'RAVI', 'SALESMAN', 7698, '1981-09-08', 29000, 0, 30),
(7876, 'MAYUR', 'CLERK', 7788, '1983-01-12', 27000, NULL, 20),
(7900, 'SURESH', 'CLERK', 7698, '1981-12-03', 23000, NULL, 30),
(7902, 'VISHAL', 'ANALYST', 7566, '1981-12-03', 53000, NULL, 20),
(7934, 'PRAVIN', 'CLERK', 7782, '1982-01-23', 29000, NULL, 10),
(7360, 'NITIN', 'CLERK', 7902, '1980-06-09', 32000, NULL, 20),
(7491, 'AJAY', 'SALESMAN', 7698, '1981-02-20', 25000, 5000, 30),
(7520, 'ANIL', 'SALESMAN', 7698, '1981-02-22', 30000, 7000, 30),
(7561, 'SUDHIR', 'MANAGER', 7839, '1981-04-02', 58000, NULL, 20);

commit;
DESCRIBE EMP;
select * from emp;
select * from dept;

-- To find an employee with maximum salary?

-- Normal Query- 
SELECT MAX (SAL) FROM EMP; -- Do not mention space betwwen column name and aggregate function
SELECT MAX(SAL) FROM EMP;

SELECT *, MAX(SAL) FROM EMP;


SELECT MAX(SAL) FROM EMP;
SELECT * FROM EMP 
WHERE SAL = 75000;


-- Using Subquery -

SELECT * FROM EMP WHERE SAL =(SELECT MAX(SAL) FROM EMP);

SELECT * FROM EMP WHERE SAL = -- OUTER QUERY
(SELECT MAX(SAL) FROM EMP);   -- INNER QUERY


