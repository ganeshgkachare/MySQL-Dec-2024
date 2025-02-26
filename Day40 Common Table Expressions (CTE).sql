-- Common Table Expressions (CTE) 
	-- A Common Table Expression (CTE) is a temporary result set defined using the WITH keyword that you can reference within a SQL query.
	-- It helps to simplify complex queries by making them more readable and reusable.

-- Why do We Need CTE?
	-- A CTE is a powerful SQL construct that helps simplify queries.
	-- CTEs act as virtual tables (with records and columns) that are created during query execution, used by the query, 
	-- and deleted after the query executes.

-- Used?
-- Subqueries: When you have a complex subquery that needs to be used multiple times within a query,
--              you can use a CTE to simplify the query and avoid redundant calculations.
-- Aggregations: When you need to calculate aggregated values over subsets of data, you can use a CTE to 
--              first calculate the subsets and then perform the aggregations.

-- Create a CTE
	-- We use the WITH keyword followed by the CTE_name and the query that defines the CTE:
		-- WITH cte_name AS (
		--    SELECT ...
		--    FROM ...
		--    WHERE ...)
		-- SELECT ...         -- You can then use the CTE in subsequent queries:
		-- FROM cte_name
		-- WHERE ...
        
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
commit;
select * from students;


WITH top_students AS (
   SELECT id, name, age, gender, grade
   FROM students
   WHERE grade >= (SELECT AVG(grade) FROM students)
)
SELECT *
FROM top_students
ORDER BY grade DESC;



WITH top_students AS (
   SELECT id, name, age, gender, grade
   FROM students
   WHERE grade >= (SELECT AVG(grade) FROM students)
)
SELECT *
FROM top_students
ORDER BY grade DESC
LIMIT 3;

-- avg gender wise
WITH male_students AS (
   SELECT grade
   FROM students
   WHERE gender = 'M'
), female_students AS (
   SELECT grade
   FROM students
   WHERE gender = 'F'
)
SELECT AVG(grade) AS male_avg_grade, (SELECT AVG(grade) FROM female_students) AS female_avg_grade
FROM male_students;


select * FROM students;

