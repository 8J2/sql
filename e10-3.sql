SELECT last_name "Last Name", salary "Salary"
FROM employees
WHERE salary IN
    (SELECT MIN(salary) "Salary"
     FROM employees
     GROUP BY department_id);

SELECT department_id "Dept ID", MIN(salary) "Salary"
FROM employees
GROUP BY department_id
HAVING MIN(salary) <
    (SELECT MIN(salary)
     FROM employees
     WHERE department_id = 50);

SELECT last_name "Last name", first_name "First name", department_id "Dept ID", manager_id "Mgr ID"
FROM employees
WHERE (department_id, manager_id) IN
(SELECT department_id, manager_id
 FROM employees
 WHERE employee_id = 141)
AND employee_id NOT IN 141;
