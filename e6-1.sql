SELECT last_name "Last Name", department_name "Dept Name"
FROM employees CROSS JOIN departments;

SELECT department_id "Dept ID", department_name "Dept Name", location_id "Location ID", city "City"
FROM departments NATURAL JOIN locations;

SELECT department_id "Dept ID", department_name "Dept Name", location_id "Location ID", city "City"
FROM departments NATURAL JOIN locations
WHERE department_id = 20 OR department_id = 50;
