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
	-- DECIMAL(precision, scale) -- precision and scale must be satisfid
	-- FLOAT(precision, scale)
	-- DOUBLE(precision, scale)
    
	-- Precision: The total number of digits (before and after the decimal point).
	-- Scale: The number of digits after the decimal point.
    
-- example, DECIMAL(6,2) means 6 total digits, with 2 digits after the decimal point (e.g., 1234.56).

-- DECIMAL(precision, scale)
-- DECIMAL(15,6)  -- digit before decimal point?  = precision - scale

drop table example_table;

CREATE TABLE example_table (
  id INT ,
  decimal_col DECIMAL(5, 3),
  numeric_col NUMERIC(5, 3),
  float_col FLOAT(5,3),
  double_col DOUBLE(5,3)
);

DESC Example_table;
INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.345,  12.345,  12.345,  12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 123.3459,  12.345,  12.345,  12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 123.454,  12.345,  12.345,  12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 123.45,  12.345,  12.345,  12.345);

select * from example_table;
INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.345,  12.345,  121.345,  12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.345,  12.345,  12.345,  126.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1,   12.345,  12.345, 12.3459, 12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1,   12.345,  12.345,  12.345, 12.3459);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1,   12.345,  12.345, 12.345998, 12.345);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1,   12.3457,  12.345, 12.3459, 12.345);
select * from example_table;
INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.34785,  12.345,  12.345, 12.34556795759);

INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.34785,  12.345,  12.345, 12.34556795759);
SELECT 
    *
FROM
    example_table;


INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.34555,  12.345,  12.345);

SELECT 
    *
FROM
    example_table;


INSERT INTO example_table (id, decimal_col, numeric_col, float_col, double_col)
VALUES (1, 12.345,  12.34555,  12.345);
select * from example_table;

INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.345,  12.345,  12.34555);


 drop table example_table;
 
 
desc example_table;

-- DDL ==> ALTER
-- Add a Column
	-- ALTER TABLE table_name ADD COLUMN column_name data_type;
--  Remove column from the Table
	-- ALTER TABLE table_name DROP COLUMN column_name;	

--  Rename column 
-- CHANGE COLUMN:
-- Can rename a column and change its data type.
-- Requires the current column name, new column name, and the new data type.
	-- ALTER TABLE table_name CHANGE COLUMN old_column_name new/old_column_name new/old_data_type;
DESC Students;

ALTER TABLE Students CHANGE COLUMN student_id id int;
ALTER TABLE Students CHANGE COLUMN  id student_id varchar(10);
ALTER TABLE Students CHANGE COLUMN  student_id student_id int;

ALTER TABLE Students CHANGE COLUMN Student_name Student_name varchar(5);
DESC Students;

-- Modify a Column's Data Type
-- MODIFY COLUMN:
-- Can only modify the existing column's attributes (like data type or size).
-- Cannot rename a column.
	-- ALTER TABLE table_name MODIFY COLUMN column_name new_data_type;
ALTER TABLE Students MODIFY COLUMN Student_name CHar(10);
DESC Students;

alter TABLE Students MODIFY COLUMN Student_name CHar(10);