CREATE TABLE copy_d_cds AS (SELECT * FROM d_cds);

DESC copy_d_cds;

INSERT INTO copy_d_cds (cd_number, title, producer, year)
VALUES (97, 'Celebrate the Day', 'R & B Inc.', '2003');
INSERT INTO copy_d_cds (cd_number, title, producer, year)
VALUES (98, 'Holiday Tunes for All Ages', 'Tunes are Us', '2004');
INSERT INTO copy_d_cds (cd_number, title, producer, year)
VALUES (99, 'Party Music', 'Old Town Records', '2004');
INSERT INTO copy_d_cds (cd_number, title, producer, year)
VALUES (100, 'Best of Rock and Roll', 'Old Town Records', '2004');

SELECT * FROM copy_d_cds
WHERE cd_number > 96 AND cd_number < 101;

CREATE TABLE copy_d_songs AS (SELECT * FROM d_songs);

DESC copy_d_songs;

INSERT INTO copy_d_songs
VALUES (52, 'Surfing Summer', 'Not known', NULL, 12);
INSERT INTO copy_d_songs
VALUES (53, 'Victory Victory', '5 min', NULL, 12);

SELECT * FROM copy_d_songs;

CREATE TABLE copy_d_clients AS (SELECT * FROM d_clients);

DESC copy_d_clients;

INSERT INTO copy_d_clients (client_number, first_name, last_name, phone, email)
VALUES (6655, 'Ayako', 'Dahish', 3608859030, 'dahisha@harbor.net');
INSERT INTO copy_d_clients (client_number, first_name, last_name, phone, email)
VALUES (6689, 'Nick', 'Neuville', 9048953049, 'nnicky@charter.net');

SELECT * FROM copy_d_clients;

CREATE TABLE copy_d_events AS (SELECT * FROM d_events);

DESC copy_d_events;

INSERT INTO copy_d_events (id, name, event_date, description, cost, venue_id, package_code, theme_code, client_number)
VALUES (110, 'Ayako Anniversary', '07-Jul-2004', 'Party for 50, sixties dress, decorations', NVL(NULL, 0), 245, 79, 240, 6655);
INSERT INTO copy_d_events (id, name, event_date, description, cost, venue_id, package_code, theme_code, client_number)
VALUES (115, 'Neuville Sports Banquet', '09-Sep-2004', 'Barbecue at residence, college alumni, 100 people', NVL(NULL, 0), 315, 87, 340, 6689);

SELECT * FROM copy_d_events;
