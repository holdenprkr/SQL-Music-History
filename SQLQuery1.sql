--SELECT column_name(s)
--FROM table_name
--WHERE column_name IN (value1, value2, ...);

DELETE FROM Artist
WHERE Id IN (29, 30, 31)

INSERT INTO Genre (Label) VALUES ('Techno');

select SongLength from Song where Id = 18;

update Song
set SongLength = 515
where Id = 18;

select SongLength from Song where Id = 18;

delete from Song where Id = 18;

SELECT s.Title, al.Title, ar.ArtistName FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.Id
LEFT JOIN Artist ar ON s.ArtistId = ar.Id
WHERE AlbumId = 23

--Show how many songs exist for each album
SELECT al.Title, COUNT(*) AS Songs
FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.Id
GROUP BY al.Title

--Show how many songs exist for each artist
SELECT ar.ArtistName, COUNT(*) AS Songs
FROM Song s
LEFT JOIN Artist ar ON s.ArtistId = ar.Id
GROUP BY ar.ArtistName

UPDATE Song
SET GenreId = 9
WHERE Id IN (22, 23, 24, 25)

--Show how many songs exist for each genre
SELECT g.[Label], COUNT(*) AS Songs
FROM Song s
LEFT JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.[Label]

SELECT Title, AlbumLength AS Duration
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

SELECT s.Title, s.SongLength AS Duration, al.Title AS Album
FROM Song s 
LEFT JOIN Album al ON s.AlbumId = al.Id
Where s.SongLength = (SELECT MAX(s.SongLength) FROM Song s)
