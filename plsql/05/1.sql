SELECT last_name "Last Name", TO_CHAR(birthdate, 'Month DD, YYYY') "Birthdate"
FROM f_staffs;

SELECT 'The promotion began on the ' || TO_CHAR(start_date, 'ddthsp "of" Month YYYY') "Start Date"
FROM f_promotional_menus
WHERE code = 110;

SELECT id "ID", first_name ||' '|| last_name "Name", TO_CHAR(salary, '$999.99') "Salary"
FROM f_staffs;

SELECT TO_CHAR(start_date, 'Day') "Day"
FROM f_promotional_menus
WHERE code = 110;

SELECT TO_CHAR(low_range, '$99999.99') ||' to '|| TO_CHAR(high_range, '$99999.99') "Price Range"
FROM d_packages;
