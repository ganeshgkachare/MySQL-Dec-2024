-- ROW_NUMBER() - assigns a unique integer value to each row
select * from employee;
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



-- RANK() - gap in the sequence
SELECT  id, name, age, salary,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary
FROM employee;

-- DENSE_RANK() - without gaps in the sequence
SELECT  id, name, age, salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary
FROM employee;


-- VALUE WF
	-- LAG() - returns the value of a specified column for the previous row. 
	-- LEAD() - returns the value of a specified column for the next row. 

SELECT  id, name, age, salary,
    LAG(salary) OVER () AS lag_salary,
    LEAD(salary) OVER () AS lead_salary
FROM employee;

SELECT  id, name, age, salary,
    LAG(salary) OVER (ORDER BY salary DESC) AS lag_salary,
    LEAD(salary) OVER (ORDER BY salary DESC) AS lead_salary
FROM employee;



SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary
FROM employee;

SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary,
	LAG(salary) OVER (ORDER BY salary DESC) AS lag_salary,
    LEAD(salary) OVER (ORDER BY salary DESC) AS lead_salary
FROM employee;

-- -----------------------------------------------------------

-- The CASE Statement:
	-- The CASE statement in MySQL is used for conditional logic within SQL queries.
	-- It allows you to return different values based on conditions, similar to an IF-ELSE structure in programming.

-- drop table students;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    grade INT
);


INSERT INTO students (name, age, gender, grade) VALUES
    ('John', 18, 'M', 90),
    ('Jane', 17, 'F', 85),
    ('Bob', 18, 'M', 80),
    ('Alice', 16, 'F', 92),
    ('Tom', 17, 'M', 70),
    ('Mary', 16, 'F', 88),
    ('David', 18, 'M', 78),
    ('Cathy', 17, 'F', 96),
    ('Peter', 18, 'M', 85),
    ('Sarah', 16, 'F', 93);
Commit;
select * from students;


--  IF  ==>IF(Condition, Value if condition is True, Value if condition is False) 

SELECT id, name,  age, gender, grade,
    IF(gender = "M", "Male", "Female") AS gender_full
FROM  students;

SELECT id, name,  age, gender, grade,
    IF(grade >= 90, 'A',IF(grade >= 80, 'B',IF(grade >= 70, 'C', 'F'))) AS grade_letter
FROM  students;
