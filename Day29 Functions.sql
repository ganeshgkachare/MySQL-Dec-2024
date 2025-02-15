-- Breaking the lengthy SQL statement into Multiple lines

-- It is a good practice to break lengthy SQL statements into multiple lines to improve readability and make it easier to understand.
-- There are several ways you can do this in MySQL:
-- 1) Use line breaks at logical points: keywords, clauses, or operators
-- 2) Indentation
-- 3) Use Comments
/* Ctrl+B or Click on Brush*/

-- UNION

SELECT 
    id, first_name, last_name, salary
FROM
    employees 
UNION SELECT 
    id, first_name, last_name, salary
FROM
    contractors;

-- ----------------------------------------------------------------

-- IFNULL()
	-- The IFNULL() function checks if a given value or expression is NULL.
	-- If it is NULL, it returns a specified replacement value.
	-- If the value is not NULL, it simply returns the original value.
-- Syntax:
	-- IFNULL(expression, alternative_value)
    
-- COALESCE()
	-- The COALESCE() function works similarly to IFNULL(), but it’s more flexible.
	-- It checks multiple values or columns in the order they are provided and returns the first value that is not NULL.
	-- If all the values are NULL, it will return NULL or  default you specified.
	-- The function will return the first non-NULL value in the list.
-- Syntax:
	-- COALESCE(expression1, expression2, ..., expressionN)

CREATE TABLE student_marks (
  roll_no INT,
  math_marks INT,
  science_marks INT,
  english_marks INT,
  history_marks INT,
  geography_marks INT,
  total_marks INT,
  PRIMARY KEY (roll_no)
);

INSERT INTO student_marks VALUES
  (1, 80, 90, NULL, 85, 95, NULL),
  (2, 90, 85, 75, NULL, 80, NULL),
  (3, 70, NULL, 80, 90, 85, NULL),
  (4, NULL, 70, 85, 80, NULL, NULL),
  (5, 85, NULL, NULL, 70, 75, NULL);
  
commit;


-- IFNULL

SELECT  *FROM student_marks;

SELECT  *,  IFNULL(math_marks, 0)  FROM student_marks;
SELECT  *, math_marks,  IFNULL(math_marks, 0) as Maths FROM student_marks;



SELECT  *,  IFNULL(math_marks, "Exam not given") as N_math_marks FROM student_marks;
SELECT  *,  IFNULL(math_marks, 35) as N_math_marks FROM student_marks;
SELECT  *,  IFNULL(math_marks, history_marks) as N_math_marks FROM student_marks;


-- COALESCE

select * from student_marks;
SELECT  *,  COALESCE(math_marks, 0) as N_math_marks FROM student_marks;
SELECT  *,  COALESCE(math_marks, "Exam nit given") as N_math_marks FROM student_marks;

SELECT  *,  COALESCE(science_marks, english_marks,history_marks,geography_marks) as N_science_marks FROM student_marks;

SELECT  *,  COALESCE(science_marks, english_marks,geography_marks,history_marks) as N_science_marks FROM student_marks;

-- -----------------------------------------
-- String Functions

-- LOWER() Function -
	-- The  LOWER() function converts all letters in a string to lowercase.
	-- The LOWER() function takes one argument.
	-- The LOWER() function returns a string which all characters converted to lowercase.

-- Syntax - 

-- SELECT  LOWER(string)
-- FROM table_name;   

SELECT  LOWER( 'LOWER Function' ) as Lower;




select * from employees;

SELECT *,LOWER(first_name)  as first_name_lower
FROM employees;

SELECT *,LOWER(first_name) as data
FROM employees;



-- UPPER() function –
	-- The UPPER() function converts all letters in a string to uppercase.
	-- The UPPER() function takes one argument.
	-- The UPPER() function returns a string which all characters converted to uppercase.

-- Syntax - 

-- SELECT  UPPER(string)
-- FROM table_name;   
   


SELECT  UPPER('Function' ) as Upper;


SELECT upper(first_name)
FROM employees;


-- CONCAT(): Concatenates multiple strings into one.
-- Syntax: CONCAT(str1, str2, ..., strN)

SELECT CONCAT('Hello', ' ', 'World'); 
SELECT CONCAT('Hello ', 'World');

select * from employees;

SELECT *,CONCAT('My name is ',first_name,' and my salary is ', salary) as My_Info
FROM employees;

-- SUBSTRING(): Extracts a substring from a string starting at a specified position.
-- Syntax: SUBSTRING(string, start_position, length)

SELECT SUBSTRING('Hello World', 7, 5);

-- TRIM(): Removes leading and trailing spaces from a string.
-- Syntax: TRIM(string)

SELECT TRIM('  Hello  ');

-- REPLACE() : Replaces all occurrences of a substring within a string with another substring.
-- Syntax: REPLACE(string, old_substring, new_substring)

SELECT REPLACE('Hello World', 'World', 'MySQL'); 

-- INSTR() Returns the position of the first occurrence of a substring within a string.
-- Syntax: INSTR(string, substring)

SELECT INSTR('Hello World', 'World'); 

-- CONCAT_WS(): Concatenates multiple strings with a separator.
-- Syntax: CONCAT_WS(separator, str1, str2, ...)

SELECT CONCAT_WS('-', '2025', '01', '23'); 

SELECT CONCAT_WS('/', '2025', '01', '23');  


-- Numeric Functions

-- LEAST() : Returns the smallest value from a list of values.
	-- Syntax: LEAST(value1, value2, ...)

SELECT LEAST(40, 10, 20, 30);  

-- GREATEST(): Returns the largest value from a list of values.
	-- Syntax: GREATEST(value1, value2, ...)

SELECT GREATEST(40, 10, 20, 30);  


-- MOD() Returns the remainder of a division.
-- Syntax: MOD(dividend, divisor)

SELECT MOD(10, 3);  

-- POW() or POWER(): Returns the result of raising a number to a power.
-- Syntax: POW(number, power) or POWER(number, power)

SELECT POW(2, 3);



-- ROUND(): Rounds a number to a specified number of decimal places.
-- Syntax: ROUND(number, decimals)

SELECT ROUND(123.456, 2); 

SELECT ROUND(456.8677888,0);
SELECT ROUND(456.4677888,0);
SELECT ROUND(456.845749867,1);
SELECT ROUND(456.8677888,2);
SELECT ROUND(456.8677888,4);

-- FLOOR() Returns the largest integer less than or equal to the given number.
-- Syntax: FLOOR(number)

SELECT FLOOR(123.456);

-- ABS(): Returns the absolute value of a number.
-- Syntax: ABS(number)

SELECT ABS(-10);

