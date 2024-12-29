--  4. Data Query Language (DQL) or Data Retrieval Language (DRL)
-- DQL (also called DRL) is used to retrieve data from a database. 
-- 4.1) SELECT: Retrieves data from one or more tables. 
--              Fetch data without modifying the structure or the data itself.
	-- Syntax:
	-- SELECT column_names FROM table_name;

SELECT * FROM employees1;

select first_name, birth_date from employees1;

-- * (Asterisk): In SQL, the * is used for selecting all columns from a table.
-- * : list of all

-- 5. Data Control Language (DCL)
-- DCL deals with permissions and access control within the database. It allows administrators to grant or 
-- revoke access to different database objects to users or roles.
-- Commands
	-- 5.1) GRANT: used to give permissions to a user or role for accessing or manipulating a database object.
		-- Syntax:
		-- GRANT privilege(s) ON object_name TO user_or_role;
	-- 5.2) REVOKE: used to remove previously granted permissions from a user or role.
		-- Syntax:
		-- REVOKE privilege(s) ON object_name FROM user_or_role;

-- Privileges (type of permission) in DCL : Privileges control the types of operations
--                                         a user or role can perform on a database object.
	-- 1) SELECT: Allows reading data from a table or view.
	-- 2) INSERT: Allows adding new rows to a table.
	-- 3) UPDATE: Allows modifying existing rows in a table.
	-- 4) DELETE: Allows removing rows from a table.
	-- 5) ALTER: Allows modifying the structure of a table (e.g., adding or dropping columns).
	-- 6) DROP: Allows dropping a table, view, or other database objects.
	-- 7) INDEX: Allows creating or dropping indexes.
	-- 8) EXECUTE: Allows executing a stored procedure or function.

-- Allow and revoke Sagar to read data from the employees1 table
-- Syntax:
-- GRANT privilege(s) ON object_name TO user_or_role;
GRANT SELECT ON employees1 TO Sagar; -- user (Sagar)

REVOKE SELECT ON employees1 FROM Sagar;

-- allows and revoke all members of the HR_team role to read, insert, and update data in the employees table.
GRANT SELECT, INSERT, UPDATE ON employees1 TO HR_team; -- role (HR_team)

REVOKE SELECT, INSERT, UPDATE ON employees1 FROM HR_team;





