CREATE TABLE seq_d_songs AS
(SELECT * FROM d_songs);

SELECT * FROM seq_d_songs;

CREATE SEQUENCE seq_d_songs_seq
    INCREMENT BY 2
    START WITH 100
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;

SELECT * FROM user_sequences;

INSERT INTO seq_d_songs
(id, title, duration, artist, type_code)
VALUES (seq_d_songs_seq.NEXTVAL, 'Island Fever', '5 min', 'Hawaiian Islanders', 12);

INSERT INTO seq_d_songs
(id, title, duration, artist, type_code)
VALUES (seq_d_songs_seq.NEXTVAL, 'Castle of Dreams', '4 min', 'The Wanderers', 77);

SELECT * FROM seq_d_songs;

SELECT seq_d_songs_seq.CURRVAL
FROM dual;
