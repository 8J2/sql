ALTER TABLE emp
ADD CONSTRAINT emp_fk FOREIGN KEY (department_id)
REFERENCES dept(department_id)
ON DELETE CASCADE;

SELECT COUNT(*) AS "Num emps"
FROM emp;

DELETE dept
WHERE department_id = 10;

SELECT COUNT(*) AS "Num emps"
FROM emp;

SELECT e.last_name "Last name", e.salary "Salary", e.department_id "Department ID", ROUND(avg_sal) "Avg salary"
FROM employees e JOIN
(SELECT department_id, AVG(salary) avg_sal
 FROM employees
 GROUP BY department_id) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_sal;
