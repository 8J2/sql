SELECT year "Year", title "CDs"
FROM d_cds
ORDER BY year, title;

SELECT title "Our Collection"
FROM d_cds
ORDER BY title DESC;

SELECT department_id, last_name, manager_id
FROM employees
WHERE employee_id < 125
ORDER BY department_id DESC, last_name DESC;
