--  IF  ==> IF(Condition, Value if condition is True, Value if condition is False) 
select * from students;

SELECT id, name,  age, gender, grade,IF(gender = "M", "Male", "Female") AS gender_full FROM  students;

SELECT id, name,  age, gender, grade,
    IF(grade >= 90, 'A',IF(grade >= 80, 'B',IF(grade >= 70, 'C', 'F'))) AS grade_letter
FROM  students;

-- ----------------------------------
-- WHEN
SELECT id, name,  age, gender, grade,
    CASE 
        WHEN age >= 18 AND gender = "F" THEN 'Adult Female'
        WHEN age >= 18 AND gender = "M" THEN 'Adult Male'
        WHEN age >= 13 AND gender = "F" THEN 'Teen Female'
        WHEN age >= 13 AND gender = "M" THEN 'Teen Male'
        ELSE 'Child'
    END AS age_group
FROM students;

-- --------------------------------
SELECT id, name,  age, gender, grade,
    IF(grade >= 90, 'A', IF(grade >= 80, 'B',
    IF(grade >= 70, 'C', 'F'))) AS grade_letter,
    CASE 
        WHEN age >= 18 AND gender = "F" THEN 'Adult Female'
        WHEN age >= 18 AND gender = "M" THEN 'Adult Male'
        WHEN age >= 13 AND gender = "F" THEN 'Teen Female'
        WHEN age >= 13 AND gender = "M" THEN 'Teen Male'
        ELSE 'Child'
    END AS age_group
FROM students;



-- ---------------------------------------------
-- Stored Procedure:
-- A Stored Procedure in MySQL is a set of SQL statements that are stored in the database and 
-- can be executed later. It allows you to encapsulate business logic inside the database, improving 
-- performance and reusability.

select * from employee;
desc employee;


-- Syntax  DELIMITER ==> $$ or //
	-- DELIMITER $$
	-- CREATE PROCEDURE proc_name()
	-- BEGIN
	--    code
	-- END $$
	-- DELIMITER ;

-- create

DELIMITER $$
CREATE PROCEDURE proc_employee()
BEGIN
select * from employee;
desc employee;
select * from employee
where name="Tom";
END $$
DELIMITER ;

-- Call
call proc_employee;


-- Drop
drop procedure proc_employee;

-- ---------------------------------------------

select * from students;
-- create a procedure to calculate a student's grade and grade letter
DELIMITER $$
CREATE PROCEDURE calc_student_grade(
    IN student_name VARCHAR(50),
    OUT student_grade INT,
    OUT student_grade_letter VARCHAR(1)
)
BEGIN
    SELECT grade, 
        IF(grade >= 90, 'A', IF(grade >= 80, 'B', IF(grade >= 70, 'C', 'F'))) 
        INTO student_grade, student_grade_letter          -- INTO clause assigns the calculated values to the output parameters
    FROM  students
    WHERE  name = student_name;     -- The WHERE clause filters the student's record based on the provided student_name
END $$
DELIMITER ;

-- call the procedure with a student's name
CALL calc_student_grade('John', @grade, @grade_letter);

-- select the results of the procedure call
SELECT @grade AS grade, @grade_letter AS grade_letter;


CALL calc_student_grade('Bob', @grade, @grade_letter);
SELECT @grade AS grade, @grade_letter AS grade_letter;


drop procedure calc_student_grade;


