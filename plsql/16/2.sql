CREATE INDEX cd_num_idx
ON d_track_listings(cd_number);

CREATE SYNONYM dj_tracks
FOR d_tracks_listings;

CREATE SYNONYM track_list
FOR d_track_listings;

SELECT * FROM user_synonyms;
