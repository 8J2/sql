CREATE SEQUENCE ct_seq;

SELECT ct_seq.NEXTVAL
FROM dual;

INSERT INTO emp
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (ct_seq.NEXTVAL, 'Kaare', 'Hansen', 'KHANSEN', '4496583212', SYSDATE, 'Manager', 6500, NULL, 100, 20);

CREATE INDEX emp_indx
ON emp(employee_id DESC,
UPPER(SUBSTR(first_name,1.1) ||' '|| last_name));

SELECT table_name, index_name, index_type FROM user_indexes
WHERE index_name = 'EMP_INDX';
