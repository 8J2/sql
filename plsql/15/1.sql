CREATE VIEW view_d_songs AS
SELECT id "ID", title "Song Title", artist "Artist"
FROM d_songs
WHERE type_code =
(SELECT code
 FROM d_types
 WHERE description = 'New Age');

SELECT * FROM view_d_songs;

CREATE OR REPLACE VIEW view_d_songs AS
SELECT id "ID", title "Song Title", artist "Artist", type_code "Type Code"
FROM d_songs
WHERE type_code =
(SELECT code
 FROM d_types
 WHERE description = 'New Age');

SELECT * FROM view_d_songs;

CREATE VIEW jason_d_events AS
SELECT e.name "Name", e.event_date "Date", t.description "Theme Description"
FROM d_events e JOIN (SELECT code, description FROM d_themes) t
ON e.theme_code = t.code;

SELECT * FROM jason_d_events;
