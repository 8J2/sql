ALTER TABLE copy_d_clients
ADD CONSTRAINT copy_d_clients_pk PRIMARY KEY (client_number);

ALTER TABLE copy_d_events
ADD CONSTRAINT copy_d_events_fk FOREIGN KEY (client_number)
REFERENCES copy_d_clients (client_number);

SELECT * FROM USER_CONSTRAINTS
WHERE constraint_name = 'COPY_D_CLIENTS_PK';

SELECT * FROM USER_CONSTRAINTS
WHERE constraint_name = 'COPY_D_EVENTS_FK';

ALTER TABLE copy_d_clients
DROP CONSTRAINT copy_d_clients_pk;

INSERT INTO copy_d_events
(id, name, event_date, description, cost, venue_id, package_code, theme_code, client_number)
VALUES (140, 'Cline Bas Mitzvah', '15-Jul-2004', 'Church and Private Home formal', 4500, 105, 87, 77, 7125);

ALTER TABLE copy_d_clients
DISABLE CONSTRAINT copy_d_clients_pk;

ALTER TABLE copy_d_events
DISABLE CONSTRAINT copy_d_events_fk;

ALTER TABLE copy_d_clients
DISABLE CONSTRAINT copy_d_clients_pk;

INSERT INTO copy_d_events
(id, name, event_date, description, cost, venue_id, package_code, theme_code, client_number)
VALUES (140, 'Cline Bas Mitzvah', '15-Jul-2004', 'Church and Private Home formal', 4500, 105, 87, 77, 7125);

SELECT * FROM copy_d_events
WHERE id = 140;
