-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


--these are one way tix
-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passenger
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  company TEXT NOT NULL
);

INSERT INTO airline
  (company)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

CREATE TABLE departure
(
  id SERIAL PRIMARY KEY,
  depart_time TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

INSERT INTO departure
  (depart_time, from_city, from_country)
VALUES
  ('2018-04-08 09:00:00', 'Washington DC', 'United States'),
  ('2018-12-19 12:45:00', 'Tokyo', 'Japan'),
  ('2018-01-02 07:00:00', 'Los Angeles', 'United States'),
  ('2018-04-15 16:50:00', 'Seattle', 'United States'),
  ('2018-08-01 18:30:00', 'Paris', 'France'),
  ('2018-10-31 01:15:00', 'Dubai', 'UAE'),
  ('2019-02-06 06:00:00', 'New York', 'United States'),
  ('2018-12-22 14:42:00', 'Cedar Rapids', 'United States'),
  ('2019-02-06 16:28:00', 'Charlotte', 'United States'),
  ('2019-01-20 19:30:00', 'Sao Paolo', 'Brazil');

CREATE TABLE arrival
(
  id SERIAL PRIMARY KEY,
  arrival_time TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO arrival
  (arrival_time, to_city, to_country)
VALUES
  ('2018-04-08 12:00:00', 'Seattle', 'United States'),
  ('2018-12-19 16:15:00', 'London', 'United Kingdom'),
  ('2018-01-02 08:03:00', 'Las Vegas', 'United States'),
  ('2018-04-15 21:00:00', 'Mexico City', 'Mexico'),
  ('2018-08-01 21:50:00', 'Casablanca', 'Morocco'),
  ('2018-10-31 12:55:00', 'Beijing', 'China'),
  ('2019-02-06 07:47:00', 'Charlotte', 'United States'),
  ('2018-12-22 15:56:00', 'Chicago', 'United States'),
  ('2019-02-06 19:18:00', 'New Orleans', 'United States'),
  ('2019-01-20 22:45:00', 'Santiago', 'Chile');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passengerid INTEGER REFERENCES passenger,
  seat TEXT NOT NULL UNIQUE,
  airlineid INTEGER REFERENCES airline,
  departureid INTEGER REFERENCES departure,
  arrivalid INTEGER REFERENCES arrival
);

INSERT INTO tickets
  (passengerid, seat, airlineid, departureid, arrivalid)
VALUES --only thing diff is going to be airline and seat
  (1, '33B', 1, 1, 1),
  (2, '8A', 2, 2, 2),
  (3, '12F', 3, 3, 3),
  (4, '20A', 3, 4, 4),
  (5, '23D', 4, 5, 5),
  (6, '18C', 5, 6, 6),
  (7, '9E', 1, 7, 7),
  (8, '1A', 6, 8, 8),
  (9, '32B', 6, 9, 9),
  (10, '10D', 7, 10, 10);

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');