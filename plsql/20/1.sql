CREATE TABLE emp
AS select * FROM employees;

CREATE TABLE dept
AS select * FROM departments;

SELECT con.constraint_name, con.constraint_type, col.column_name, col.position
FROM user_constraints con JOIN user_cons_columns col ON (con.constraint_name = col.constraint_name)
WHERE con.table_name = 'JOB_HISTORY' AND col.position IS NOT NULL;

ALTER TABLE emp
ADD CONSTRAINT emp_pk PRIMARY KEY (employee_id);

ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (department_id);
