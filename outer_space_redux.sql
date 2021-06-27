-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space_redux;

CREATE DATABASE outer_space_redux;

\c outer_space_redux

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

--make sure independent tables implenmented first??
CREATE TABLE orbited
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO orbited
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbited,
  galaxy_id INTEGER REFERENCES galaxies
  --moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy_id)
VALUES
  ('Earth', 1.00, (SELECT orbited.id FROM orbited WHERE name = 'The Sun'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way')),
  ('Mars', 1.88, (SELECT orbited.id FROM orbited WHERE name = 'The Sun'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way')),
  ('Venus', 0.62, (SELECT orbited.id FROM orbited WHERE name = 'The Sun'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way')),
  ('Neptune', 164.8, (SELECT orbited.id FROM orbited WHERE name = 'The Sun'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way')),
  ('Proxima Centauri', 0.03, (SELECT orbited.id FROM orbited WHERE name = 'Proxima Centauri'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way')),
  ('Gliese 876 b', 0.23, (SELECT orbited.id FROM orbited WHERE name = 'Gliese 876'),
    (SELECT galaxies.id FROM galaxies WHERE name = 'Milky Way'));

CREATE TABLE moons_grp
(
  id SERIAL PRIMARY KEY,
  name TEXT[],
  orbits_id INTEGER REFERENCES planets
);

INSERT INTO moons_grp
  (name, orbits_id)
VALUES
  ('{"The Moon"}', (SELECT id FROM planets WHERE name = 'Earth')),
  ('{"Phobos", "Deimos"}', (SELECT id FROM planets WHERE name = 'Mars')),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}',
    (SELECT id FROM planets WHERE name = 'Neptune'));

--from old stuff
-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


-- SELECT planets.name, planets.orbital_period_in_years, orbited.name, galaxies.name, moons_grp.name 
--   FROM planets 
--     FULL JOIN orbited ON planets.orbits_around_id = orbited.id
--     FULL JOIN galaxies ON planets.galaxy_id = galaxies.id
--     FULL JOIN moons_grp ON moons_grp.id = planets.id;