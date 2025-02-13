CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary INT
);

CREATE TABLE contractors (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary INT
);

INSERT INTO employees (id, first_name, last_name, salary) VALUES
(1, 'Rahul', 'Kumar', 50000),
(2, 'Priya', 'Singh', 60000),
(3, 'Arvind', 'Sharma', 70000),
(4, 'Neha', 'Patel', 55000),
(5, 'Suresh', 'Reddy', 80000),
(6, 'Kiran', 'Verma', 65000),
(7, 'Manoj', 'Desai', 60000),
(8, 'Alok', 'Mehta', 75000),
(9, 'Sima', 'Iyer', 62000),
(10, 'Vinod', 'Chauhan', 70000);

INSERT INTO contractors (id, first_name, last_name, salary) VALUES
(1, 'Rahul', 'Kumar', 50000),
(2, 'Priya', 'Singh', 60000),
(3, 'Arvind', 'Sharma', 70000),
(4, 'Neha', 'Patel', 55000),
(5, 'Suresh', 'Reddy', 80000),
(6, 'Prajakta', 'Patil', 80000),
(7, 'Sarika', 'Kokate', 60000),
(8, 'Abhishek', 'Rathi', 25000),
(9, 'Atul', 'Chaudhari', 34000),
(10, 'Sumit', 'Kadam', 49000);

Commit;

select * from employees;
select * from contractors;

-- UNION

SELECT id, first_name, last_name, salary FROM employees
UNION
SELECT id, first_name, last_name, salary FROM contractors;




 -- UNION ALL 
SELECT id, first_name, last_name, salary FROM employees
UNION ALL 
SELECT id, first_name, last_name, salary FROM contractors;


-- INTERSECT 
SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e INNER JOIN contractors c 
ON e.id = c.id AND e.first_name = c.first_name AND e.last_name = c.last_name AND e.salary = c.salary;

-- Except


SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e LEFT JOIN contractors c 
ON e.id = c.id AND e.first_name = c.first_name AND e.last_name = c.last_name AND e.salary = c.salary
WHERE c.id IS NULL;



-- INTERSECT 
SELECT e.id, e.first_name, e.last_name, e.salary
FROM employees e LEFT JOIN contractors c 
ON e.id = c.id AND e.first_name = c.first_name AND e.last_name = c.last_name AND e.salary = c.salary
WHERE c.id IS not NULL;

-- -------------------------------------------------------------------------------