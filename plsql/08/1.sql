SELECT ROUND(AVG(cost), 2) "Average Cost"
FROM d_events;

SELECT SUM(salary) "Sum of salaries"
FROM f_staffs
WHERE id IN(12, 9);
