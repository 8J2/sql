SELECT last_name "Last Name", NVL(overtime_rate, 0) "Overtime Status"
FROM f_staffs;

SELECT last_name "Last Name", NVL(manager_id, 9999) "Manager ID"
FROM f_staffs;

SELECT first_name "First Name", NVL(specialty, 'No specialty') "Specialty"
FROM d_partners;
