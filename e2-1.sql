SELECT DISTINCT last_name, address, state, city, zip
FROM f_customers;

SELECT first_name
FROM f_staffs;
SELECT first_name || ' ' || last_name AS "DJs on Demand Clients"
FROM d_clients;
SELECT DISTINCT quantity
FROM f_order_lines;
SELECT order_number
FROM f_orders;

SELECT last_name "EMPLOYEE LAST NAME", salary "CURRENT SALARY", salary * 1.05 "SALARY WITH 5% RAISE"
FROM f_staffs;
