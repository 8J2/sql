SELECT * FROM user_updatable_columns
WHERE table_name = UPPER(table_name)
AND (updatable = 'NO' OR insertable = 'NO' OR deletable = 'NO');

CREATE OR REPLACE VIEW view_copy_d_songs AS
SELECT * FROM copy_d_songs;

INSERT INTO view_copy_d_songs
(id, title, duration, artist, type_code)
VALUES (88, 'Mello Jello', '2', 'The What', 4);

SELECT * FROM copy_d_songs;
