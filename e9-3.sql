SELECT DISTINCT * FROM (SELECT employee_id "Employee ID", job_id "Job ID", hire_date "Start Date", department_id "Dept ID"
FROM employees
 UNION
SELECT employee_id "Employee ID", job_id "Job ID", start_date "Start Date", department_id "Dept ID"
FROM job_history)
ORDER BY "Employee ID", "Start Date";

SELECT employee_id "Employee"
FROM employees
 MINUS
SELECT employee_id "Employee"
FROM job_history;

SELECT employee_id "Employee ID", job_id "Job ID", salary "Salary"
FROM employees
 UNION ALL
SELECT employee_id "Employee ID", job_id "Job ID", NVL(NULL, 0)
FROM job_history;
