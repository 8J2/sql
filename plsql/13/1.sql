CREATE TABLE grad_candidates
 (student_id NUMBER(6),
  last_name VARCHAR2 (30),
  first_name VARCHAR2 (20),
  credits NUMBER(3),
  graduation_date DATE);

DESCRIBE grad_candidates;

CREATE TABLE graduate_table AS (SELECT * FROM grad_candidates);

INSERT INTO graduate_table (student_id, last_name, first_name, credits, graduation_date)
VALUES (012345, 'Surname', 'Name', 50, '08-May-2026');
