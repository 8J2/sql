SELECT first_name, last_name, address
FROM f_customers
WHERE id = 456;

SELECT name, start_date, end_date
FROM f_promotional_menus
WHERE give_away = 'ballpen and highlighter';

SELECT 'The ' || year || ' recording in our database is ' || title "Oldest"
FROM d_cds
WHERE year = '1997';

SELECT producer, title
FROM d_cds
WHERE title = 'Carpe Diem';

SELECT title, year
FROM d_cds
WHERE year < 2000;
