CREATE VIEW V2 AS
SELECT d.department_name "Department Name", min_sal "Lowest Salary", max_sal "Highest Salary", ROUND(avg_sal) "Average Salary"
FROM dept d JOIN
(SELECT department_id, MIN(salary) min_sal, MAX(salary) max_sal, AVG(salary) avg_sal
 FROM emp
 GROUP BY department_id) e
ON d.department_id = e.department_id;

SELECT * FROM v2;

CREATE VIEW Dept_Managers_view AS
SELECT department_name "DEPT_NAME", SUBSTR(e.first_name, 1, 1) ||'.'|| last_name "MGR_NAME"
FROM employees e JOIN departments d ON (e.employee_id = d.manager_id)
WITH READ ONLY;

SELECT * FROM dept_managers_view;

UPDATE dept_managers_view
SET dept_name = NULL
WHERE MGR_NAME = 'S.King';

DROP VIEW v2;
