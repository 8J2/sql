SELECT department_name "Dept Name", first_name ||' '|| last_name "Name"
FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);

SELECT department_name "Dept Name", first_name ||' '|| last_name "Name"
FROM employees e FULL OUTER JOIN departments d ON (e.department_id = d.department_id);
