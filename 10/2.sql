SELECT first_name ||' '|| last_name "Name"
FROM employees
WHERE job_id =
    (SELECT job_id
     FROM employees
     WHERE last_name = 'Rajs')
AND hire_date >
    (SELECT hire_date
     FROM employees
     WHERE last_name = 'Davies');

SELECT DISTINCT staff_type "Staff Type"
FROM f_staffs
WHERE salary <
    (SELECT MIN(salary)
     FROM f_staffs
     WHERE staff_type = 'Cook');

SELECT department_id "Dept ID", MIN(salary) "Salary"
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
    (SELECT MIN(salary)
     FROM employees
     WHERE department_id != 50);
