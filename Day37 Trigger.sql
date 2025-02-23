-- Trigger
	-- Triggers are database objects that are associated with a table and are activated when 
	-- a particular event occurs, such as an insert, update, or delete operation on the table.
	-- Triggers are useful for maintaining data integrity, enforcing business rules, and automating task
    
-- Syntax
	-- DELIMITER $$
	-- CREATE TRIGGER trigger_name
	-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
	-- Action (FOR EACH ROW/STATEMENT)
	-- BEGIN
	--  trigger body
	-- END;
	-- $$
	-- DELIMITER ;
-- OR
	-- CREATE TRIGGER trigger_name
	-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
	-- Action (FOR EACH ROW/STATEMENT)
	--  trigger body;


-- trigger_time: when the trigger should be activated (BEFORE or AFTER)
-- trigger_event: the event that triggers the trigger (INSERT, UPDATE, or DELETE)
-- table_name: the name of the table that the trigger is associated with

-- Action
-- 1) FOR EACH ROW (Row-Level Trigger):
	-- Specifies that the trigger should be activated for each row affected by the event.This is the most 
	-- common and default type of trigger in MySQL. It means that the trigger is executed once for each
	-- row affected by the triggering event. For example, before each row is inserted, updated, or deleted.
	
-- 2)FOR EACH STATEMENT (Statement-Level Trigger):MySQL does not support statement-level triggers.
	-- This type of trigger fires once for each triggering event, regardless of the number of rows affected.
	-- It executes a single time for a group of rows that share the same triggering event. Statement-level
    -- triggers are less common but can be useful in specific scenarios

-- drop table users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

INSERT INTO users (name, age, gender) VALUES
    ('John', 25, null),
    ('Jane', 30, null),
    ('Bob', 18, null);
--     ('Alice', 40, null),
--     ('Mark', 28, null),
--     ('Sara', 22, null),
--     ('Mike', 35, null),
--     ('Emily', 20, null),
--     ('Tom', 45, null),
--     ('Lily', 27, null);
--     
-- Syntax

-- CREATE TRIGGER trigger_name
-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
-- Action (FOR EACH ROW/STATEMENT)
--  trigger body;


-- CREATE TRIGGER trigger_name
-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
-- Action (FOR EACH ROW/STATEMENT)
-- BEGIN
--  trigger body
-- END;

CREATE TRIGGER set_gender_trigger
BEFORE INSERT ON users
FOR EACH ROW
SET NEW.gender = 'Male';


-- Find triggers in the current database
SHOW TRIGGERS;

select * from users;

INSERT INTO users (name, age, gender) VALUES
    ('John', 25, null);

INSERT INTO users (name, age, gender) VALUES
    ('Udit', 26, 'Female');

select * from users;
INSERT INTO users (name, age, gender) VALUES
    ('John', 26, null),
    ('Raj', 28, null);
    
select * from users;

DROP TRIGGER IF EXISTS set_gender_trigger;

DELIMITER $$
CREATE TRIGGER set_gender_trigger
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF NEW.gender IS NULL THEN
        SET NEW.gender = 'Male';
    END IF;                           -- Required when using BEGIN ... END
END;
$$
DELIMITER ;


INSERT INTO users (name, age, gender) VALUES
    ('John', 25, null);
    
INSERT INTO users (name, age, gender) VALUES
    ('John', 25, '');
    
INSERT INTO users (name, age, gender) VALUES
    ('Udit', 26, 'Female');

select * from users;

DROP TRIGGER IF EXISTS set_gender_trigger;

