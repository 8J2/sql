SELECT department_id "Dept ID", department_name "Dept Name", location_id "Location ID"
FROM departments JOIN locations USING (location_id)
WHERE location_id = 1400;

SELECT job_title "Job", first_name ||' '|| last_name "Name", email "Email"
FROM employees JOIN jobs USING (job_id)
WHERE job_title = 'Stock Clerk';
