SELECT last_name "Last Name", TRUNC(salary*1.05333, 2) "Salary With 5.333% Raise"
FROM employees
WHERE department_id = 80;

SELECT ROUND(845.553, 1) "Example"
FROM dual;
SELECT ROUND(30695.348, 2) "Example"
FROM dual;
SELECT ROUND(30695.348, -2) "Example"
FROM dual;
SELECT TRUNC(2.3454, 1) "Example"
FROM dual;

SELECT MOD(34, 8) "EXAMPLE"
FROM dual;
