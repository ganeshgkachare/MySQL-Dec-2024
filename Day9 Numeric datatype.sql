-- Numeric Data Types are used to store numerical values.
  
  -- Integer Types : store whole numbers (integers).
	--   TINYINT: Stores very small integer values
	--   SMALLINT : A small integer.
	--   MEDIUMINT: A medium-range integer.
	--   INT or INTEGER: A standard integer
	--   BIGINT: A large integer.	
  
--   Signed TINYINT (default): This allows both negative and positive integers
--   Unsigned TINYINT: This only allows positive numbers, but doubles the upper limit of the positive range.
  
-- Numeric Data Type   Size (byte)     Signed Range (default)               Unsigned Range
-- TINYINT                1              -128 to 127                          0 to 255
-- SMALLINT               2           -32,768 to 32,767                     0 to 65,535
-- MEDIUMINT              3          -8,388,608 to 8,388,607                 0 to 16,777,215
-- INT or INTEGER         4           -2,147,483,648 to 2,147,483,647       0 to 4,294,967,295
-- BIGINT                 8         -9,223,372,036,854,775,808 to           0 to 18,446,744,073,709,551,615
--                                      9,223,372,036,854,775,807

	-- Syntax
	-- column_name TINYINT;
	-- column_name TINYINT UNSIGNED;
	--  
	--  column_name SMALLINT;
	-- column_name SMALLINT UNSIGNED;

	-- column_name MEDIUMINT;
	-- column_name MEDIUMINT UNSIGNED;

	-- column_name INT;
	-- column_name INT UNSIGNED;

	-- column_name BIGINT;
	-- column_name BIGINT UNSIGNED;

-- Floating-Point Types store floating-point values
-- 1) DECIMAL (or NUMERIC) : used to store fixed-point numbers with exact precision.
-- Rounding: No rounding errors—values are stored exactly as entered.
-- Storage: Variable size, depending on the precision and scale you define. (Takes up more storage space than FLOAT and DOUBLE.)

-- 2) FLOAT (Single Precision Floating Point)
-- Range: Approx. -3.402823466E+38 to 3.402823466E+38.
-- Precision: Up to 7 significant digits.
--  It can store up to 7 significant digits, meaning values are rounded to that level of precision.
-- Storage: 4 bytes.

-- 3) DOUBLE (Double Precision Floating Point)
-- Range: Approx. -1.7976931348623157E+308 to 1.7976931348623157E+308.
-- Precision: Up to 15-16 significant digits.
-- approximately 15-16 significant digits of precision. It stores numbers with double precision (64 bits), which is more accurate than FLOAT.
-- Storage: 8 bytes.

	-- Syntax:
	-- DECIMAL(precision, scale)
	-- FLOAT(precision, scale)
	-- DOUBLE(precision, scale)
    
	-- Precision: The total number of digits (before and after the decimal point).
	-- Scale: The number of digits after the decimal point.
		
CREATE TABLE Info1 (
    id INT PRIMARY KEY,
    age TINYINT 
);
INSERT INTO Info1 (id, age) VALUES (1, 50);  -- Valid, 50 is within the range -128 to 127
INSERT INTO Info1 (id, age) VALUES (2, -50); -- Valid, -50 is within the range -128 to 127
INSERT INTO Info1 (id, age) VALUES (3, 130); -- Invalid, exceeds the range for signed TINYINT

select * from Info1;

CREATE TABLE Info2 (
    id INT PRIMARY KEY,
    stock_quantity TINYINT UNSIGNED
);

INSERT INTO Info2 (id, stock_quantity) VALUES (1, 150);  -- Valid, 150 is within the range 0 to 255
INSERT INTO Info2 (id, stock_quantity) VALUES (1, -50);
INSERT INTO Info2 (id, stock_quantity) VALUES (1, 5.5);
INSERT INTO Info2 (id, stock_quantity) VALUES (2, 300);  -- Invalid, exceeds the range for unsigned TINYINT
select * from Info2;


-- Numeric Data Type   Size (byte)     Signed Range (default)               Unsigned Range
-- SMALLINT               2           -32,768 to 32,767                     0 to 65,535

CREATE TABLE Info3 (
    id INT PRIMARY KEY,
    stock_quantity SMALLINT UNSIGNED
);

INSERT INTO Info3 (id, stock_quantity) VALUES (1, 150);
INSERT INTO Info3 (id, stock_quantity) VALUES (1, -50);
INSERT INTO Info3 (id, stock_quantity) VALUES (1, 5.5);
INSERT INTO Info3 (id, stock_quantity) VALUES (2, 100000);  
select * from Info3;
