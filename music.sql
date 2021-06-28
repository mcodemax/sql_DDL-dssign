-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music



CREATE TABLE artists_grouped
(
  id SERIAL PRIMARY KEY,
  artists TEXT[] NOT NULL
);

INSERT INTO artists_grouped
  (artists)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');


CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

INSERT INTO album
  (title)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');


CREATE TABLE producers_grouped
(
  id SERIAL PRIMARY KEY,
  producers TEXT[] NOT NULL
);

INSERT INTO producers_grouped
  (producers)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INTEGER REFERENCES artists_grouped,
  album INTEGER REFERENCES album,
  producers INTEGER REFERENCES producers_grouped
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
  ('Shallow', 216, '09-27-2018', 4, 4, 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
  ('Dark Horse', 215, '12-17-2013', 7, 7, 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 8, 8),
  ('Complicated', 244, '05-14-2002', 9, 9, 9),
  ('Say My Name', 240, '11-07-1999', 10, 10, 10);
