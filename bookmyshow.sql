CREATE DATABASE bookmyshow_db1;

USE bookmyshow_db1;

SELECT DATABASE();

/* Table Creation */
/* THEATRES Table */
CREATE TABLE theatres (
  theatre_id INT NOT NULL AUTO_INCREMENT,
  theatre_name VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  theatre_location VARCHAR(50) NOT NULL,
  theatre_rating FLOAT,
  PRIMARY KEY (theatre_id)
);

/* MOVIES TABLE */
CREATE TABLE movies (
  movie_id INT NOT NULL AUTO_INCREMENT,
  movie_name VARCHAR(100) NOT NULL UNIQUE,
  movie_duration VARCHAR(15) NOT NULL,
  movie_language VARCHAR(50) NOT NULL,
  movie_rating FLOAT,
  movie_release_date DATE,
  PRIMARY KEY (movie_id)
);

/* Screen Table */
CREATE TABLE screens (
  screen_id INT NOT NULL AUTO_INCREMENT,
  screen_type VARCHAR(10) NOT NULL,
  PRIMARY KEY (screen_id)
);

/* SHOWS Table */
CREATE TABLE shows (
  show_id INT NOT NULL AUTO_INCREMENT,
  show_time VARCHAR(30) NOT NULL,
  show_date DATE NOT NULL,
  movie_id INT NOT NULL,
  screen_id INT NOT NULL,
  PRIMARY KEY (show_id),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (screen_id) REFERENCES screens(screen_id)
);

/* MAPPING Tables */
CREATE TABLE theatresShowsMapping (
  id INT NOT NULL AUTO_INCREMENT,
  show_id INT NOT NULL,
  theatre_id INT NOT NULL,
  FOREIGN KEY (show_id) REFERENCES shows(show_id),
  FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id),
  UNIQUE (show_id, theatre_id),
  PRIMARY KEY (id)
);

/* Insert Data to Theatres Table */
INSERT INTO
  theatres (
    theatre_id,
    theatre_name,
    city,
    theatre_location,
    theatre_rating
  )
VALUES
  (
    201,
    'PVR Cinemas Pvt Ltd',
    'Gurgaon',
    'Golf Course Rd',
    4
  ),
  (
    202,
    'Inox Cinema',
    'Gurgaon',
    'Sapphire Mall NH-8',
    4.4
  ),
  (
    203,
    'Apna Cinema',
    'Varanasi',
    'Main Road, 3/14',
    3.4
  ),
  (
    204,
    'Lulu Cinema',
    'Noida',
    'Test location',
    4.0
  ),
  (
    205,
    'Anupama Theatre',
    'Bengaluru',
    'S C Road',
    4.1
  );
  
/* Show details of all available theatres */
SELECT * FROM theatres;

/* Insert Data to Movies Table */
INSERT INTO
  movies (
    movie_id,
    movie_name,
    movie_duration,
    movie_language,
    movie_rating,
    movie_release_date
  )
VALUES
  (
    301,
    'Salaar',
    '2 Hours 30 Min',
    'Hindi',
    4.4,
    '2024-01-02'
  ),
  (
    302,
    'Dunki',
    '2 Hours',
    'Hindi',
    4,
    '2023-12-23'
  ),
  (
    303,
    'Fighter',
    '2 Hours 45 Min',
    'Hindi',
    4.2,
    '2024-01-08'
  ),
  (
    304,
    'Inception',
    '1 Hours 45 Min',
    'English',
    4.7,
    '2022-10-24'
  ),
  (
    305,
    'Oppenheimer',
    '2 Hours 10 Min',
    'English',
    4.9,
    '2023-12-11'
  );

/* Show list of all movies */
SELECT * FROM movies;

/* Insert data into screen table */
INSERT INTO screens (screen_id, screen_type) VALUES
(501, '2D'),
(502, '3D');

/* List all available screens */
SELECT * FROM screens;

/* Insert Data to Shows Table */
INSERT INTO
  shows (show_id, show_time, show_date, movie_id, screen_id)
VALUES
  (401, '3 PM', '2024-02-09', 301, 501),
  (402, '6 PM', '2024-02-09', 302, 501),
  (403, '9 AM', '2024-02-15', 303, 502),
  (404, '12 PM', '2024-03-01', 304, 501),
  (405, '12 PM', '2024-02-29', 305, 502),
  (406, '3 PM', '2024-02-29', 302, 502),
  (407, '9 PM', '2024-02-21', 302, 501),
  (408, '6 PM', '2024-02-15', 303, 501),
  (409, '9 AM', '2024-02-17', 304, 501),
  (410, '12 PM', '2024-02-18', 304, 501);
  
/* List all shows */
SELECT * FROM shows;

/* Insert Theatres and Shows mapping table */
INSERT INTO theatresShowsMapping (id, show_id, theatre_id) VALUES 
(601, 401, 201),
(602, 402, 202),
(603, 403, 203),
(604, 404, 204),
(605, 405, 205),
(606, 406, 202),
(607, 407, 201),
(608, 408, 201),
(609, 409, 201),
(610, 410, 205);

/*
 P2 - Write a query to list down all the shows on a given date at a given theatre along with their respective show timings.
 */
SELECT
  *
FROM
  theatresShowsMapping
JOIN shows ON theatresShowsMapping.show_id = shows.show_id
JOIN theatres ON theatresShowsMapping.theatre_id = theatres.theatre_id
JOIN movies ON shows.movie_id = movies.movie_id
AND theatresShowsMapping.theatre_id = 201 AND shows.show_date = '2024-02-09';

/* Drop Tables If you want */
DROP TABLE theatres;

DROP TABLE movies;

DROP TABLE shows;

DROP TABLE screens;

DROP TABLE theatresMoviesShowsMapping;