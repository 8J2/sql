SELECT employees.employee_id "Emp ID", departments.department_name "Dept Name"
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT employees.last_name "Last name", departments.department_name "Dept Name", employees.salary "Salary", countries.country_name "Country name"
FROM employees, departments, locations, countries
WHERE employees.department_id = departments.department_id
AND departments.location_id = locations.location_id
AND locations.country_id = countries.country_id;

SELECT employees.last_name "Last name", departments.department_name "Dept Name", employees.salary "Salary", countries.country_name "Country name"
FROM employees, departments, locations, countries
WHERE departments.department_id (+)= employees.department_id
AND locations.location_id (+)= departments.location_id
AND countries.country_id (+)= locations.country_id;
