-- Functions (user-defined) in MySQL
-- A Stored Function in MySQL is a user-defined database object that takes input parameters,
-- processes them, and returns a single value. Unlike Stored Procedures, which can return multiple results,
-- a Function always returns exactly one value.


-- Syntax to Create a Function in MySQL
	-- DELIMITER //
	-- CREATE FUNCTION function_name(parameter_name DataType)
	-- RETURNS ReturnType 
	-- DETERMINISTIC
	-- BEGIN
	--     -- Function logic
	--     RETURN value;
	-- END //
	-- DELIMITER ;

--     Explanation of Syntax

-- RETURNS ReturnType:
	-- Specifies the data type of the value that the function will return.
-- DETERMINISTIC/NOT DETERMINISTIC:
	-- Indicates that the function will always return the same result for the same input.
	-- Use NOT DETERMINISTIC if the function depends on non-fixed values (e.g., random numbers, current time).
-- BEGIN ... END
	-- The function logic is written inside this block.
-- RETURN value;
	-- Defines the value that the function will return.

-- Function to Find Square of a Given Number

DELIMITER //
CREATE FUNCTION square(n INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN n * n;
END //
DELIMITER ;


SELECT square(5);
SELECT square(5) AS Square_Value;


-- Function to Check if a Number is Even or Odd

DELIMITER //
CREATE FUNCTION check_even_odd(n INT) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN IF(n % 2 = 0, 'Even', 'Odd');
END //
DELIMITER ;

SELECT check_even_odd(10) AS Result;
SELECT check_even_odd(7) AS Result;
SELECT check_even_odd(54) AS Result;

-- See selef defined function name
SELECT ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_TYPE = 'FUNCTION' 
AND ROUTINE_SCHEMA = 'mysql_practice';


-- DROP FUNCTION function_name;
DROP FUNCTION square;


-- Homework
-- Create 1 table use auto increment
-- insert 5 records 
-- delete 2 records using where
-- delete all records without using where
-- Add records again

-- create another table with same condition
--  add records 
--  delete records using truncate 
--  again add records

-- Observe difference in both