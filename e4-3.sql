SELECT name "Event", ROUND(MONTHS_BETWEEN(SYSDATE, event_date), 0) "Months ago"
FROM d_events
WHERE name = 'Vigil wedding';

SELECT TO_DATE('01-Jan-2024') - ROWNUM "Days"
FROM dual
CONNECT BY ROWNUM < 366
ORDER BY "Days";

SELECT LAST_DAY('07-Jun-2005') "End of month"
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 6) "Appointment"
FROM dual;

SELECT ROUND(MONTHS_BETWEEN('01-Jan-2025', '12-Aug-2024'), 0)
FROM dual;
