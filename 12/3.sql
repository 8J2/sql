CREATE TABLE copy_f_promotional_menus
AS (SELECT * FROM f_promotional_menus);

ALTER TABLE copy_f_promotional_menus
MODIFY(start_date DATE DEFAULT SYSDATE);

INSERT INTO copy_f_promotional_menus (code, name, end_date, give_away)
VALUES ('120', 'New Customer', '01-Jun-2005', '10% discount coupon');

SELECT * FROM copy_f_promotional_menus;
