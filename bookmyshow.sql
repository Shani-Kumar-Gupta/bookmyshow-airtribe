CREATE DATABASE bookmyshow;
USE bookmyshow;
SELECT DATABASE();

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

CREATE TABLE theatresMoviesMapping (
  show_id INT NOT NULL,
  theatre_id INT NOT NULL,
  movie_id INT NOT NULL,
  FOREIGN KEY (show_id) REFERENCES shows(show_id),
  FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);