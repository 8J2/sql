SELECT CASE duration
       WHEN '2 min' THEN 'shortest'
       WHEN '10 min' THEN 'longest'
       ELSE duration
END "Play Times"
FROM d_songs;

SELECT first_name "First Name", last_name "Last Name",
       manager_id "Manager ID", commission_pct "Commission Percent",
       COALESCE(manager_id, commission_pct, 99999) "Review"
FROM employees
WHERE department_id = 80 OR department_id = 90;
