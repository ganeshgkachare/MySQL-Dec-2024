-- CREATE TABLE
-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype constraint,
--     column2 datatype constraint,
--     ...
--     columnn datatype constraint,
--     [table_constraints]
-- );

-- A) String data type: Used to store textual data.
-- 1) CHAR data type is used for storing fixed-length strings.
-- Syntax:
-- column_name CHAR(length);
    -- The maximum length is 255.
    -- fixed-length
    
-- 2) VARCHAR data type is used for storing variable-length strings.
-- Syntax:
-- column_name VARCHAR(length);
    -- length specifies the maximum number of characters the string can store (up to 65,535 characters).
    -- variable-length
    
-- 3) TEXT data type is used for storing large text.
-- Syntax:
-- column_name TEXT;
	-- Unlike CHAR and VARCHAR, which are used for smaller strings, TEXT is ideal for storing longer text such as descriptions, comments, or articles.
	-- variable-length strings.
	-- store up to 65,535 characters
	-- used when text is unpredictable or can be very large.
    -- don’t need to specify a maximum length.
    
-- 4) ENUM data type is used to store a predefined set of values.
-- Syntax:
-- column_name ENUM('value1', 'value2', 'value3', ...);
	-- It allows you to specify a list of allowed values, and the column can only hold one of those values.
	-- The ENUM data type restricts the column to only the allowed values 
	-- Ensures data consistency and restricts input errors.
    
-- 5) SET data type is similar to ENUM.
-- Syntax:
-- column_name SET('value1', 'value2', 'value3', ...);
 	-- Allows multiple values from a predefined list.
    
-- 6) TINYTEXT :used to store very small amounts of text data.
-- Syntax:
-- column_name TINYTEXT;
	-- It can store up to 255 characters.
	-- variable-length data type

-- 7) MEDIUMTEXT: used to store larger text than TEXT.
-- Syntax: 
-- column_name MEDIUMTEXT;
	-- It can store up to 16,777,215 characters.
	-- variable-length data type

-- 8) LONGTEXT: is the largest text data type in MySQL.
-- Syntax: 
-- column_name LONGTEXT;
	-- It can store up to 4,294,967,295 characters.
	-- variable-length data type

-- Data Type	Storage Capacity	        Use Case
-- TINYTEXT	    255 characters	            Very short text data (e.g., short comments)
-- TEXT	        65,535 characters	        Medium-sized text (e.g., articles, descriptions)
-- MEDIUMTEXT	16,777,215 characters	    Large text (e.g., long logs, documents)
-- LONGTEXT	    4,294,967,295 characters	Extremely large text (e.g., books, huge documents)

CREATE TABLE string_datatype (
  ID char(5),   -- One / 1 fixed length
  first_name varchar(15),  -- Atul ==> 4/ abcddsbvjbvjxf....vjxfvxvcbcbcbcb
  gender ENUM("M","F"),    -- M / M,F
  Sub SET ("Phy","Chem","Maths","Bio"));  
  
  
 