-- CREATE TABLE
-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype constraint,
--     column2 datatype constraint,
--     ...
--     columnn datatype constraint,
--     [table_constraints]
-- );


-- Constraint
-- A constraint in a database is a rule or limit that you set on a column or table to control what 
-- kind of data can be stored in it. It ensures the data is valid, consistent, and reliable.

-- 1) NOT NULL:
-- Ensures that a column cannot store NULL values.
-- Used when a value is mandatory for every row in the column.

create table emp
(id int , -- NULL
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp;
select * from emp;

insert into emp (id ,first_name,last_name,dob) values(1,"priyanka","ppp","1995-07-18");

insert into emp (id,first_name,last_name,dob) values(2,"raj","RRR","1995-10-26"),
(3,"Reshma","RRR","1996-02-03"),
(4,"Manasa","MMM","1996-05-13");

insert into emp (id,dob) values (5,"1996-11-29");
insert into emp (id,first_name,last_name,dob) values (6,"Krishna",null,"1996-11-29");
insert into emp  values (8,"Prajakta",null,"1997-06-17");
select * from emp;

insert into emp  values(9,null,"RRR",null);
insert into emp  values(null,"PRAJ","RRR",null);
insert into emp  values(9,"PRAJ","RRR",NULL);
insert into emp  values(9,"PRAJ","RRR");


-- NOT NULL
create table emp1
(id int NOT NULL,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp1;

insert into emp1 values(1,"priyanka","ppp","1995-07-18");
select * from emp1;
insert into emp1 values(4,null,"RRR","1995-10-26");
select * from emp1;
insert into emp1 values(null,"Prajakta","RRR","1995-10-26");
select * from emp1;

create table emp2
(id int NULL,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp2;

insert into emp2 values(1,"priyanka","ppp","1995-07-18");
select * from emp2;
insert into emp2 values(null,"raj","RRR","1995-10-26");
select * from emp2;

