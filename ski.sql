-- clean up
DROP TABLE trail_conditions;
DROP TABLE trails;
DROP TABLE invoices;
DROP TABLE rental_equipment;
DROP TABLE lift_tickets;
DROP TABLE enrollments;
DROP TABLE lesson_topics;
DROP TABLE lessons;
DROP TABLE instructors;
DROP TABLE reservations;
DROP TABLE customers;

DROP SEQUENCE customer_id_seq;
DROP SEQUENCE reservation_id_seq;
DROP SEQUENCE instructor_id_seq;
DROP SEQUENCE trail_id_seq;
DROP SEQUENCE lesson_id_seq;
DROP SEQUENCE topic_id_seq;
DROP SEQUENCE ticket_id_seq;
DROP SEQUENCE rental_id_seq;

--DROP INDEX customers_customer_id_idx;
--DROP INDEX reservations_customer_id_idx;
--DROP INDEX instructors_name_idx;
--DROP INDEX trails_name_idx;

DROP SYNONYM t;
DROP SYNONYM tc;
DROP SYNONYM eq;

DROP VIEW enrollment_details;
DROP VIEW trail_info;
DROP VIEW tickets;

-- sequences
CREATE SEQUENCE customer_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE reservation_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE instructor_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE trail_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE lesson_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE topic_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ticket_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE rental_id_seq START WITH 1 INCREMENT BY 1;

-- customers
CREATE TABLE customers
(customer_id INT CONSTRAINT customers_customer_id_nn NOT NULL,
 parent_id INT,
 name VARCHAR2(40) CONSTRAINT customers_name_nn NOT NULL,
 age INT NOT NULL,
 email VARCHAR2(50) CONSTRAINT customers_email_nn NOT NULL,
 phone VARCHAR2(10),
 membership VARCHAR(3) CONSTRAINT customers_membership_nn NOT NULL,
 CONSTRAINT customers_customer_id_pk PRIMARY KEY (customer_id),
 CONSTRAINT customers_parent_id_fk FOREIGN KEY (parent_id)
 REFERENCES Customers(customer_id),
 CONSTRAINT customers_membership_chk CHECK (Membership IN ('Yes', 'No')));

--DESCRIBE customers;

INSERT INTO customers (customer_id, parent_id, name, age, phone, email, membership)
VALUES (customer_id_seq.NEXTVAL, NULL, 'Potato Spud', 35, '5551234578', 'potato.spud@example.com', 'Yes');

INSERT INTO customers (customer_id, parent_id, name, age, phone, email, membership)
VALUES (customer_id_seq.NEXTVAL, 1, 'Sweet Potato', 8, '5559876543', 'sweet.potato@example.com', 'Yes');

INSERT INTO customers (customer_id, parent_id, name, age, phone, email, membership)
VALUES (customer_id_seq.NEXTVAL, 1, 'Mashed Potato', 10, '5552345678', 'mashed.potato@example.com','Yes');

--SELECT customer_id "ID", parent_id "Parent ID", name "Name", age "Age", email "EMail", phone "Phone", membership "Membership"
--FROM customers;

-- instructors
CREATE TABLE instructors
(instructor_id NUMBER(3) CONSTRAINT instructors_instructor_id_pk PRIMARY KEY,
 name VARCHAR2(40) CONSTRAINT instructors_name_nn NOT NULL,
 certification VARCHAR(50) CONSTRAINT instructors_certification_nn NOT NULL);

--DESCRIBE instructors;

INSERT INTO instructors (instructor_id, name, certification)
VALUES (instructor_id_seq.NEXTVAL, 'Seasoned Potato', 'Russet Ridge Certification of Expertise');

INSERT INTO instructors (instructor_id, name, certification)
VALUES (instructor_id_seq.NEXTVAL, 'Half-Baked Potato', 'Russet Ridge Basic Certification');

--SELECT instructor_id "ID", name "Name", certification "Cert"
--FROM instructors;

-- lessons & lesson topics
CREATE TABLE lessons (
    lesson_id INTEGER,
    instructor_id INTEGER,
    lesson_date DATE CONSTRAINT lessons_lesson_date_nn NOT NULL,
    price DECIMAL(7, 2) CONSTRAINT lessons_price_nn NOT NULL,
    max_size INT CONSTRAINT lessons_max_size_nn NOT NULL,
    CONSTRAINT pk_lessons
      PRIMARY KEY (lesson_id, instructor_id),
    CONSTRAINT lessons_instructor_id_fk
      FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
);

CREATE TABLE lesson_topics
(topic_id NUMBER(3) CONSTRAINT lesson_topics_topic_id_pk PRIMARY KEY,
 topic_name VARCHAR2(20) CONSTRAINT lesson_topics_topic_name_nn NOT NULL,
 description VARCHAR2(40) CONSTRAINT lesson_topics_description_nn NOT NULL);

--DESCRIBE lesson;
--DESCRIBE lesson_topics;

INSERT INTO lessons (lesson_id, instructor_id, lesson_date, price, max_size)
VALUES (lesson_id_seq.NEXTVAL, 1, SYSDATE, 49.99, 5);

INSERT INTO lessons (lesson_id, instructor_id, lesson_date, price, max_size)
VALUES (lesson_id_seq.NEXTVAL, 2, SYSDATE-2, 29.99, 1);

--SELECT lesson_id "ID", instructor_id "Instructor ID", lesson_date "Date", price "Price", max_size "Max size"
--FROM lessons;

INSERT INTO lesson_topics (topic_id, topic_name, description)
VALUES (topic_id_seq.NEXTVAL, 'Advanced skiing', 'Group lesson for experienced skiers');

INSERT INTO lesson_topics (topic_id, topic_name, description)
VALUES (topic_id_seq.NEXTVAL, 'First time skiing', 'One-on-one beginner skiing lesson');

--SELECT topic_id "ID", topic_name "Name", description "Desc"
--FROM lesson_topics;

-- reservations
CREATE TABLE reservations
(reservation_id INT PRIMARY KEY,
 customer_id INT,
 reservation_date DATE CONSTRAINT reservations_reservation_date_nn NOT NULL,
 price DECIMAL(10, 2) CONSTRAINT reservations_price_nn NOT NULL,
 room_number INT,
 start_date DATE CONSTRAINT reservations_start_date_nn NOT NULL,
 end_date DATE CONSTRAINT reservations_end_date_nn NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

-- enrollments
CREATE TABLE enrollments (
    enrollment_id NUMBER CONSTRAINT pk_enrollment_id PRIMARY KEY,
    customer_id INTEGER CONSTRAINT fk_customer_id REFERENCES customers(customer_id) NOT NULL,
    lesson_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    registration_date DATE NOT NULL,
    total_price NUMBER(10,2) CONSTRAINT chk_total_price_non_negative CHECK (total_price >= 0) NOT NULL,
    number_of_participants NUMBER CONSTRAINT chk_number_of_participants_positive CHECK (number_of_participants > 0) NOT NULL,
    CONSTRAINT fk_lesson_id_instructor_id FOREIGN KEY (lesson_id, instructor_id) REFERENCES lessons(lesson_id, instructor_id)
);

--DESCRIBE enrollments;

INSERT INTO enrollments (enrollment_id, customer_id, lesson_id, instructor_id, registration_date, total_price, number_of_participants)
VALUES (1, 1, 1, 1, SYSDATE, 49.99, 3);

INSERT INTO enrollments (enrollment_id, customer_id, lesson_id, instructor_id, registration_date, total_price, number_of_participants)
VALUES (2, 2, 1, 1, SYSDATE, 49.99, 3);

INSERT INTO enrollments (enrollment_id, customer_id, lesson_id, instructor_id, registration_date, total_price, number_of_participants)
VALUES (3, 3, 1, 1, SYSDATE, 49.99, 3);

--SELECT enrollment_id "ID", customer_id "Customer ID", instructor_id "Instructor ID", registration_date "Registered", total_price "Price", number_of_participants "Participants"
--FROM enrollments;

-- lift tickets
CREATE TABLE lift_tickets
(ticket_id NUMBER(7) CONSTRAINT lift_tickets_ticket_id_nn NOT NULL,
 customer_id NUMBER(7) CONSTRAINT lift_tickets_customer_id_nn NOT NULL,
 title VARCHAR2(20) CONSTRAINT lift_tickets_title_nn NOT NULL,
 price DECIMAL(7, 2) CONSTRAINT lift_tickets_price_nn NOT NULL,
 purchase_date DATE CONSTRAINT lift_tickets_purchase_date_nn NOT NULL,
 expiration_date DATE CONSTRAINT lift_tickets_expiration_nn NOT NULL,
 CONSTRAINT lift_tickets_pk PRIMARY KEY (ticket_id, customer_id),
 CONSTRAINT lift_tickets_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

--DESCRIBE lift_tickets;

INSERT INTO lift_tickets (ticket_id, customer_id, title, price, purchase_date, expiration_date)
VALUES (ticket_id_seq.NEXTVAL, 1, 'Adult lift ticket', 179.99, SYSDATE+7, (SYSDATE+17));

INSERT INTO lift_tickets (ticket_id, customer_id, title, price, purchase_date, expiration_date)
VALUES (ticket_id_seq.NEXTVAL, 2, 'Child lift ticket', 129.99, SYSDATE+7, (SYSDATE+17));

INSERT INTO lift_tickets (ticket_id, customer_id, title, price, purchase_date, expiration_date)
VALUES (ticket_id_seq.NEXTVAL, 3, 'Child lift ticket', 129.99, SYSDATE+7, (SYSDATE+17));

--SELECT ticket_id "ID", customer_id "Customer ID", title "Title", price, purchase_date "Purchased", expiration_date "Expires"
--FROM lift_tickets;

-- rental equipment
CREATE TABLE rental_equipment
(rental_id INT CONSTRAINT rental_equipment_rental_id_pk PRIMARY KEY,
 eq_type VARCHAR(50) CONSTRAINT rental_equipment_eq_type_nn NOT NULL,
 eq_size VARCHAR(20),
 brand VARCHAR(50),
 price DECIMAL(10, 2) CONSTRAINT rental_equipment_price_nn NOT NULL,
 rental_date DATE CONSTRAINT rental_equipment_rental_date_nn NOT NULL,
 expiration_date DATE CONSTRAINT rental_equipment_expiration_nn NOT NULL);

--DESCRIBE rental_equipment;

INSERT INTO rental_equipment (rental_id, eq_type, eq_size, brand, price, rental_date, expiration_date)
VALUES (rental_id_seq.NEXTVAL, 'Skis', 'Small', 'Idaho Ski Co', '149.99', SYSDATE+7, SYSDATE+17);

INSERT INTO rental_equipment (rental_id, eq_type, eq_size, brand, price, rental_date, expiration_date)
VALUES (rental_id_seq.NEXTVAL, 'Skis', 'Large', 'Idaho Ski Co', '179.99', SYSDATE+7, SYSDATE+17);

INSERT INTO rental_equipment (rental_id, eq_type, eq_size, brand, price, rental_date, expiration_date)
VALUES (rental_id_seq.NEXTVAL, 'Helmet', 'Small', 'SpudRider', '59.99', SYSDATE+7, SYSDATE+17);

INSERT INTO rental_equipment (rental_id, eq_type, eq_size, brand, price, rental_date, expiration_date)
VALUES (rental_id_seq.NEXTVAL, 'Ski goggles', 'Medium', 'Idaho Ski Co', '49.99', SYSDATE+7, SYSDATE+17);

INSERT INTO rental_equipment (rental_id, eq_type, eq_size, brand, price, rental_date, expiration_date)
VALUES (rental_id_seq.NEXTVAL, 'Snowboard', 'Large', 'SpudRider', 60.00, SYSDATE+7, SYSDATE+17);

--SELECT rental_id "ID", eq_type "Type", eq_size "Size", brand "Brand", price "Price", rental_date "Rented", expiration_date "Expires"
--FROM rental_equipment;

-- invoices
CREATE TABLE invoices
(invoice_id INT,
 customer_id INT,
 total_price DECIMAL(10, 2) CONSTRAINT invoices_total_price_nn NOT NULL,
 payment_status VARCHAR(50) CONSTRAINT invoices_payment_status_nn NOT NULL,
 date_issued DATE CONSTRAINT invoices_date_issued_nn NOT NULL,
 due_date DATE CONSTRAINT invoices_due_date_nn NOT NULL,
 CONSTRAINT invoices_invoice_id_pk PRIMARY KEY (invoice_id, customer_id),
 CONSTRAINT invoices_customer_id
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

--DESCRIBE invoices;

INSERT INTO invoices (invoice_id, customer_id, total_price, payment_status, date_issued, due_date)
VALUES (1, 1, 499.99, 'Completed', SYSDATE, SYSDATE+17);

--SELECT invoice_id "ID", customer_id "Customer ID", total_price "Price", payment_status "Status", date_issued "Date", due_date "Due"
--FROM invoices;

-- trails & trail conditions
CREATE TABLE trails
(trail_id NUMBER(4) CONSTRAINT trails_trail_id_pk PRIMARY KEY,
 name VARCHAR2(40) CONSTRAINT trails_name_nn NOT NULL,
 length VARCHAR2(20) CONSTRAINT trails_length_nn NOT NULL,
 difficulty VARCHAR2(20) CONSTRAINT trails_difficulty_nn NOT NULL,
 location VARCHAR2(30) CONSTRAINT trails_location_nn NOT NULL);

CREATE TABLE trail_conditions
(date_updated DATE,
 trail_id NUMBER(4),
 condition VARCHAR2(30) CONSTRAINT trail_conditions_condition_nn NOT NULL,
 active_flag NUMBER(1) CONSTRAINT trail_conditions_active_flag_nn NOT NULL,
 CONSTRAINT trail_conditions_pk
   PRIMARY KEY (date_updated, trail_id),
 CONSTRAINT trail_conditions_trail_id_fk
   FOREIGN KEY (trail_id) REFERENCES trails(trail_id));

--DESCRIBE trails;
--DESCRIBE trail_conditions;

INSERT INTO trails (trail_id, name, length, difficulty, location)
VALUES (trail_id_seq.NEXTVAL, 'Potato Peak', 'H 550ft, V 275ft', 'Black Diamond', 'The top of Mount Potato');

INSERT INTO trails (trail_id, name, length, difficulty, location)
VALUES (trail_id_seq.NEXTVAL, 'Bunny Hill', 'H 280ft, V 80ft', 'Green Circle', 'West of the ski lodge');

--SELECT trail_id "ID", name "Name", length "Length", difficulty "Difficulty", location "Location"
--FROM trails;

INSERT INTO trail_conditions (date_updated, trail_id, condition, active_flag)
VALUES (SYSDATE, 1, 'Somewhat slushy. Bear warning', 1);

INSERT INTO trail_conditions (date_updated, trail_id, condition, active_flag)
VALUES (SYSDATE, 2, 'Moderately icey', 1);

-- indexes
--CREATE INDEX customers_customer_id_idx ON customers(customer_id);
CREATE INDEX reservations_customer_id_idx ON reservations(customer_id);
CREATE INDEX instructors_name_idx ON instructors(name);
CREATE INDEX trails_name_idx ON trails(name);

-- synonyms
CREATE SYNONYM t FOR trails;
CREATE SYNONYM tc FOR trail_conditions;
CREATE SYNONYM eq FOR rental_equipment;

-- views
CREATE VIEW enrollment_details AS
SELECT
    e.enrollment_id,
    c.customer_id,
    c.name AS customer_name,
    i.instructor_id,
    i.name AS instructor_name,
    e.registration_date,
    e.total_price,
    e.number_of_participants
FROM enrollments e
JOIN customers c ON e.customer_id = c.customer_id
JOIN Instructors i ON e.instructor_id = i.instructor_id;

CREATE VIEW trail_info AS
SELECT t.trail_id,
       t.name,
       tc.date_updated,
       tc.condition,
       tc.active_flag
FROM trails t
JOIN trail_conditions tc ON t.trail_id = tc.trail_id;

CREATE VIEW tickets AS
SELECT ticket_id, customer_id, title, price, purchase_date, expiration_date
FROM lift_tickets;

REVOKE ALL ON enrollment_details FROM PUBLIC;
REVOKE ALL ON trail_info FROM PUBLIC;
REVOKE ALL ON tickets FROM PUBLIC;

GRANT SELECT ON enrollment_details TO PUBLIC;
GRANT SELECT ON trail_info TO PUBLIC;
GRANT SELECT ON tickets TO PUBLIC;
