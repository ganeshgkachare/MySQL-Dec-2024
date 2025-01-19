-- Date and Time Data Types


-- DATE : Used to store date values in the format YYYY-MM-DD
-- Valid Range: The valid range of dates is from 1000-01-01 to 9999-12-31
-- -- Automatic Conversion Rules: If a 2-digit year is inserted, MySQL interprets it as a year within the range 1970–2069. For example:
-- '70' becomes 1970.
-- '02' becomes 2002.
	-- Syntax:
	-- column_name DATE


-- YEAR : Used to store a year value in a 4-digit format (YYYY)
-- Valid Range: The valid range for YEAR is from 1901 to 2155, and 0000 is allowed for special purposes.
	-- Syntax:
	-- column_name YEAR


-- DATETIME : Used to store both date and time values, in the format YYYY-MM-DD HH:MM:SS
-- Valid Range: The valid range of DATETIME is from 1000-01-01 00:00:00 to 9999-12-31 23:59:59.
	-- Syntax:
	-- column_name DATETIME


-- TIMESTAMP : Used to store both date and time values in the format YYYY-MM-DD HH:MM:SS
-- TIMESTAMP automatically initializes or updates its value when a row is created or modified, which makes it different from DATETIME.
-- Valid Range: The valid range of TIMESTAMP is from 1970-01-01 00:00:01 to 2038-01-19 03:14:07 (UNIX timestamp range).
-- Similar to DATETIME, but automatically initialized and updated to the current timestamp when a row is created or modified.
	-- Syntax:
	-- column_name TIMESTAMP


-- TIME: Used to store time values in the format HH:MM:SS
-- Valid Range: The valid range for TIME is from '-838:59:59' to '838:59:59'.
	-- Syntax:
	-- column_name TIME


-- Data Type	           Valid Range	                                     Storage	
-- DATE	            1000-01-01 to 9999-12-31	                             3 bytes	
-- YEAR	            1901 to 2155	                                         1 byte	
-- DATETIME	        1000-01-01 00:00:00 to 9999-12-31 23:59:59	             8 bytes	
-- TIMESTAMP	    1970-01-01 00:00:01 to 2038-01-19 03:14:07	             4 bytes	
-- TIME	           '-838:59:59' to '838:59:59'	                             3 bytes	


CREATE TABLE event_plan (
    event_date DATE,
    event_year YEAR,
    date_DATETIME DATETIME,
    current_time_TIMESTAMP TIMESTAMP,
    event_start_TIME TIME
);

describe event_plan;
INSERT INTO event_plan (event_date) VALUES (2024-12-16);
INSERT INTO event_plan (event_date) VALUES ("2024-12-27");
INSERT INTO event_plan (event_date) VALUES ('2024-02-30'); 
INSERT INTO event_plan (event_date) VALUES ('2024-02-28'); 

INSERT INTO event_plan (event_date) VALUES ('2024-02-29'); 
INSERT INTO event_plan (event_date) VALUES ('2023-02-29'); 
INSERT INTO event_plan (event_date) VALUES ('2024-11-31'); 

INSERT INTO event_plan (event_date) VALUES ('10000-11-30'); 

SELECT * FROM event_plan;

truncate event_plan;

SELECT * FROM event_plan;
INSERT INTO event_plan (event_year) VALUES ('2024'); --  1901 to 2155	
INSERT INTO event_plan (event_year) VALUES ('1900');
INSERT INTO event_plan (event_year) VALUES ('2156');
INSERT INTO event_plan (event_year) VALUES ('2155');  -- 1502
INSERT INTO event_plan (event_year) VALUES ('0000'); -- Exception
INSERT INTO event_plan (event_year) VALUES ('0001');
INSERT INTO event_plan (event_year) VALUES ('0002');
INSERT INTO event_plan (event_year) VALUES ('70');
INSERT INTO event_plan (event_year) VALUES ('0069');
-- Automatic Conversion Rules:
-- If a 2-digit year is inserted, MySQL interprets it as a year within the range 1970–2069. For example:
-- '70' becomes 1970.
-- '02' becomes 2002.

INSERT INTO event_plan (date_DATETIME) VALUES ("2024-12-27");  -- DATETIME YYYY-MM-DD HH:MM:SS
INSERT INTO event_plan (date_DATETIME) VALUES ("1960-01-01 00:12:12");
INSERT INTO event_plan (date_DATETIME) VALUES ("1960-01-01 00:12:60");
SELECT * FROM event_plan;

INSERT INTO event_plan (event_start_TIME) VALUES ("00:12:59");