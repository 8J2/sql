ALTER TABLE o_employees
ADD (termination VARCHAR2(30) DEFAULT TO_CHAR(SYSDATE,'Month ddth, yyyy'));

SELECT termination FROM o_employees;

ALTER TABLE o_employees
ADD (start_date TIMESTAMP WITH LOCAL TIME ZONE);

SELECT start_date FROM o_employees;

RENAME o_jobs TO o_job_description;
