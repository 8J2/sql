SELECT e1.last_name "Last Name", e1.department_id "Dept ID", e1.salary "Salary"
FROM employees e1
WHERE e1.salary =
    (SELECT MAX(e2.salary)
     FROM employees e2
     WHERE e2.department_id = e1.department_id);
