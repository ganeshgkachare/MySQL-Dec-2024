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


-- 1]Create 1 table use auto increment
CREATE TABLE MYBOOKS (
    ID INT AUTO_INCREMENT,
    BOOK_TITLE VARCHAR(50),
    AUTHOR VARCHAR(50),
    PRICE DECIMAL(5 , 2 ),
    PAGES INT,
    PRIMARY KEY(ID)
);
DESC MYBOOKS;
SELECT * FROM MYBOOKS;

-- 2] INSERT RECORDS
INSERT INTO MYBOOKS(BOOK_TITLE,AUTHOR,PRICE,PAGES) VALUES
('THE SECRET','ROHONDA BYRNE',188.00,280),
('BHAGWAT GITA','SWAMI PRABHUPADA',292.00,924),
('THE 5AM CLUB','ROBIN SHARMA',274.00,336),
('ASURA','ANAND NEELAKANTAN',370.00,504),
('YOU ARE THE BEST FRIEND','AJAY PANDE',189.00,232),
('THE ENEMY','SARAH ADAMS',178.00,256);
Commit;
-- 3]DELETE 2 RECORDS USING WHERE
SET SQL_SAFE_UPDATES=0;
DELETE FROM MYBOOKS WHERE PRICE IN(274.00,178.00);

ROLLBACK;
SELECT * FROM MYBOOKS;

-- 4]DELETE ALL RECORDS WITHOUT USING WHERE
DELETE FROM MYBOOKS;

-- 5]ADD RECORDS AGAIN
INSERT INTO MYBOOKS(BOOK_TITLE,AUTHOR,PRICE,PAGES) VALUES
('THE SECRET','ROHONDA BYRNE',188.00,280),
('BHAGWAT GITA','SWAMI PRABHUPADA',292.00,924),
('THE 5AM CLUB','ROBIN SHARMA',274.00,336),
('ASURA','ANAND NEELAKANTAN',370.00,504),
('YOU ARE THE BEST FRIEND','AJAY PANDE',189.00,232),
('THE ENEMY','SARAH ADAMS',178.00,256);
SELECT * FROM MYBOOKS;

-- 6] See Diff
DELETE FROM MYBOOKS;

-- -------------------------------
CREATE TABLE MYBOOKS2 (
    ID INT AUTO_INCREMENT,
    BOOK_TITLE VARCHAR(50),
    AUTHOR VARCHAR(50),
    PRICE DECIMAL(5 , 2 ),
    PAGES INT,
    PRIMARY KEY(ID)
);

-- 2] INSERT RECORDS
INSERT INTO MYBOOKS2(BOOK_TITLE,AUTHOR,PRICE,PAGES) VALUES
('THE SECRET','ROHONDA BYRNE',188.00,280),
('BHAGWAT GITA','SWAMI PRABHUPADA',292.00,924),
('THE 5AM CLUB','ROBIN SHARMA',274.00,336),
('ASURA','ANAND NEELAKANTAN',370.00,504),
('YOU ARE THE BEST FRIEND','AJAY PANDE',189.00,232),
('THE ENEMY','SARAH ADAMS',178.00,256);

SELECT * FROM MYBOOKS2; 
Commit;
-- 6]DELETE RECORDS USING TRUNCATE
TRUNCATE TABLE MYBOOKS2;
SELECT * FROM MYBOOKS2;
ROLLBACK;
SELECT * FROM MYBOOKS2;
-- 7]ADD AGAIN RECORDS
INSERT INTO MYBOOKS2(BOOK_TITLE,AUTHOR,PRICE,PAGES) VALUES
('THE SECRET','ROHONDA BYRNE',188.00,280),
('BHAGWAT GITA','SWAMI PRABHUPADA',292.00,924),
('THE 5AM CLUB','ROBIN SHARMA',274.00,336),
('ASURA','ANAND NEELAKANTAN',370.00,504),
('YOU ARE THE BEST FRIEND','AJAY PANDE',189.00,232),
('THE ENEMY','SARAH ADAMS',178.00,256);
SELECT * FROM MYBOOKS2;

-- 8] DIFFERENCE IN BOTH
-- DELETE = REMOVE SPECIFIC DATA>> NEED TO TURN OFF SAFE MOOD >> ALLOW ROLLBACK
-- TRUNCATE = REMOVE ALL DATA >> DONT NEED SAFE MOOD >> DOES NOT ALLOW ROLLBACK
-- Difference Between TRUNCATE and DELETE in MySQL
-- Both TRUNCATE and DELETE are used to remove records from a table, but they work differently.

	-- Feature	                          TRUNCATE	         DELETE
	-- Removes all rows	                    Yes	             Yes (if no WHERE condition)
	-- Can remove specific rows	            No	             Yes (using WHERE)
	-- Faster	                            Yes	              No (logs each row deleted)
	-- Resets Auto Increment	            Yes               No
	-- ROLLBACK possible	                 No 	          Yes 


-- Drop ==> Delete permanent  Record + Structure
-- -----------------------------------------------------------------------------------------------------

-- INDEX 
	-- Database structure that improves the speed of data retrieval operations on a table.

-- Syntax to Create an Index
	-- CREATE INDEX index_name ON table_name (col_name);

select * from student_marks;
desc student_marks;

CREATE INDEX mark_index1 ON student_marks (math_marks);
CREATE INDEX mark_index2 ON student_marks (science_marks);
CREATE INDEX mark_index ON student_marks (math_marks, science_marks, english_marks, history_marks, geography_marks, total_marks);


-- How see index
-- SHOW INDEX FROM table_name;
SHOW INDEX FROM student_marks;


-- How Drop/Delete Index
	-- DROP INDEX index_name ON table_name;
SHOW INDEX FROM student_marks;
DROP INDEX mark_index1 ON student_marks;
SHOW INDEX FROM student_marks;


select * from student_marks;


SELECT * FROM student_marks WHERE math_marks > 0;







