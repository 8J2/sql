SELECT COUNT(id) "Total Songs"
FROM d_songs;

SELECT COUNT(DISTINCT loc_type) "Different Locations"
FROM d_venues;

SELECT COUNT(song_id) "Total Song IDs", COUNT(DISTINCT cd_number) "Unique CD Numbers"
FROM d_track_listings;

SELECT COUNT(email) "Customers With Email"
FROM d_clients
WHERE email IS NOT NULL;
