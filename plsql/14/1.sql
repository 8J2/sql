CREATE TABLE global_locations
(id NUMBER(4) NOT NULL,
 name VARCHAR(40),
 date_opened DATE NOT NULL,
 address VARCHAR2(40) NOT NULL,
 city VARCHAR2(20) NOT NULL,
 zip NUMBER(5),
 phone NUMBER(10),
 email VARCHAR2(40) CONSTRAINT global_loc_email_uk UNIQUE,
 manager_id NUMBER(4),
 emergency VARCHAR2(30));

DESCRIBE global_locations;
