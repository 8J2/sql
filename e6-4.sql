SELECT e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", e.manager_id "Mgr#"
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id);

SELECT e.last_name "Employee", e.hire_date "Emp Hired", m.last_name "Manager", m.hire_date "Mgr Hired"
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
WHERE e.hire_date < m.hire_date;

SELECT last_name, department_id, salary
FROM employees
START WITH last_name = 'King'
CONNECT BY PRIOR employee_id = manager_id;
