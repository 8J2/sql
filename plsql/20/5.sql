SELECT * FROM dictionary
WHERE table_name LIKE '%PRIV%';

GRANT SELECT ON emp TO PUBLIC;

SELECT * FROM user_tab_privs
WHERE table_name = 'EMP';

SELECT employees.employee_id "Emp ID", departments.department_name "Dept Name"
FROM employees, departments;
