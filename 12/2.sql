CREATE TABLE copy_f_staffs AS (SELECT * FROM f_staffs);

UPDATE copy_f_staffs
SET overtime_rate = overtime_rate + .85
WHERE id = 12;

UPDATE copy_f_staffs
SET overtime_rate = NVL(overtime_rate, 0) + .75
WHERE id = 9;

SELECT * FROM copy_f_staffs;

CREATE TABLE copy_f_orders AS (SELECT * FROM f_orders);

INSERT INTO copy_f_orders (order_number, order_date, order_total, cust_id, staff_id)
VALUES (5680, '12-Jun-2004', 159.78, 145, 9);
INSERT INTO copy_f_orders (order_number, order_date, order_total, cust_id, staff_id)
VALUES (5691, '23-Sep-2004', 145.98, 225, 12);
INSERT INTO copy_f_orders (order_number, order_date, order_total, cust_id, staff_id)
VALUES (5701, '4-Jul-2004', 229.31, 230, 12);

SELECT * FROM copy_f_orders;

CREATE TABLE copy_f_customers AS (SELECT * FROM f_customers);

INSERT INTO copy_f_customers (id, first_name, last_name, address, city, state, zip, phone_number)
VALUES (145, 'Katie', 'Hernandez', '92 Chico Way', 'Los Angeles', 'CA', 98008, '8586667641');
INSERT INTO copy_f_customers (id, first_name, last_name, address, city, state, zip, phone_number)
VALUES (225, 'Daniel', 'Spode', '1923 Silverado', 'Denver', 'CO', 80219, '7193343523');
INSERT INTO copy_f_customers (id, first_name, last_name, address, city, state, zip, phone_number)
VALUES (230, 'Adam', 'Zurn', '5 Admiral Way', 'Seattle', 'WA', NVL(NULL, 0), '4258879009');

SELECT * FROM copy_f_customers;
