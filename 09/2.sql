SELECT manager_id "Mgr ID", job_id "Job ID", SUM(salary) "Total Salary"
FROM employees
GROUP BY ROLLUP (manager_id, job_id);
