CREATE OR REPLACE VIEW view_copy_d_songs AS
SELECT title "Title", artist "Artist"
FROM copy_d_songs;

SELECT * FROM view_copy_d_songs;

DROP VIEW view_copy_d_songs;

SELECT * FROM view_copy_d_songs;

CREATE VIEW view_top_3_salaries AS
SELECT last_name "Last Name", salary "Salary"
FROM employees
WHERE ROWNUM <= 3
ORDER BY salary DESC;

SELECT * FROM view_top_3_salaries;

CREATE VIEW view_dept_max_salary AS
SELECT e.last_name "Last Name", e.salary "Salary", e.department_id "Dept ID", d.max_salary "Maximum Salary"
FROM employees e,
(SELECT department_id, MAX(salary) max_salary
 FROM employees
 GROUP BY department_id) d
WHERE e.department_id = d.department_id;

SELECT * FROM view_dept_max_salary;
