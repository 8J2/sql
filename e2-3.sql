SELECT first_name, last_name, salary
FROM f_staffs
WHERE salary BETWEEN 5 AND 10;

SELECT loc_type "Location", comments "Comments"
FROM d_venues
WHERE loc_type = 'Private Home';

SELECT title
FROM d_cds
WHERE title LIKE '_a%';

SELECT first_name || ' ' || last_name "Partners"
FROM d_partners
WHERE auth_expense_amt IS NULL;
