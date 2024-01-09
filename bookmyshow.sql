CREATE DATABASE bookmyshow;

USE bookmyshow;

SELECT
  DATABASE();

/* Table Creation */
/* USERS Table */
CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  mobile_no VARCHAR(10) UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
);

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
  movie_duration TIME NOT NULL,
  movie_rating FLOAT,
  movie_release_date DATE,
  PRIMARY KEY (movie_id)
);

/* SHOWS Table */
CREATE TABLE shows (
  show_id INT NOT NULL AUTO_INCREMENT,
  show_time TIME NOT NULL,
  show_date DATE NOT NULL,
  PRIMARY KEY (show_id)
);

/* MAPPING Tables */
CREATE TABLE theatresMoviesShowsMapping (
  show_id INT NOT NULL,
  theatre_id INT NOT NULL,
  movie_id INT NOT NULL,
  FOREIGN KEY (show_id) REFERENCES shows(show_id),
  FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id) FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  UNIQUE (show_id, theatre_id, movie_id)
);

/* Insert Data to Users Table */
INSERT INTO
  users (user_id, user_name, mobile_no, email, password)
VALUES
  (
    101,
    'ShaniKGupta',
    '7054048089',
    'shani.gupta_cs@outlook.com',
    'test@12345'
  ),
  (
    102,
    'Aman',
    '9875583734',
    'aman@gmail.com',
    'aman@admin'
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
    '4'
  ),
  (
    201,
    'Inox Cinema',
    'Gurgaon',
    'Sapphire Mall NH-8',
    '4.4'
  );

/* Insert Data to Movies Table */
INSERT INTO
  movies (
    movie_id,
    movie_name,
    movie_duration,
    movie_rating,
    movie_release_date
  )
VALUES
  (301, 'Salaar', '2:30:45', '4.4', '02-01-2024'),
  (302, 'Dunki', '2:15:25', '4', '23-12-2023');

/* Insert Data to Shows Table */
INSERT INTO
  shows (show_id, show_time, show_date)
VALUES
  (401, '01:30', '20-01-2024'),
  (402, '4:30', '23-01-2024');

/* Mapping Table Data Insertion */
INSERT INTO
  theatresMoviesShowsMapping (show_id, theatre_id, movie_id)
VALUES
  (401, 201, 301),
  (402, 202, 302);

/* Drop Tables If you want */
DROP TABLE theatres;

DROP TABLE movies;

DROP TABLE shows;

DROP TABLE theatresMoviesShowsMapping;