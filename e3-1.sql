SELECT last_name
FROM f_staffs
WHERE last_name LIKE '%e%' AND last_name LIKE '%i%';

SELECT first_name ||' '|| last_name "Name"
FROM f_staffs
WHERE salary > 6.5 AND staff_type != 'Order Taker';

SELECT loc_type "Venues"
FROM d_venues
WHERE loc_type != 'Private Home';
