SELECT manager_id
FROM employees
HAVING AVG(salary) < 16000
GROUP BY manager_id;

SELECT cd_number, COUNT(title)
FROM d_cds
WHERE cd_number < 93
GROUP BY cd_number;

SELECT ID, MAX(ID), artist AS Artist
FROM d_songs
WHERE duration IN('3 min', '6 min', '10 min')
HAVING ID < 50
GROUP BY ID, artist;

SELECT loc_type, rental_fee AS Fee
FROM d_venues
WHERE id < 100
ORDER BY Fee;

SELECT MAX(salary) "Max Salary", MIN(salary) "Min Salary", department_id "Dept ID"
FROM employees
GROUP BY department_id;
