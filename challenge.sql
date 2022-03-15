CREATE DATABASE sql_challenge_1;
SET SQL_SAFE_UPDATES = 0;
USE sql_challenge_1;

--    VERY EASY CHALLENGE    --

CREATE TABLE top_cars (
car_make VARCHAR(45) NOT NULL PRIMARY KEY,
car_model VARCHAR(45),
car_year INT
);

INSERT INTO top_cars (car_make, car_model, car_year)
VALUES 
('Lamborghini', 'Aventador', 2020),
('Toyota', 'Supra', 2000),
('Nissan', 'Skyline-GTR', 2010);

INSERT INTO top_cars (car_make, car_model, car_year)
VALUES 
('Honda', 'Civic', 1998),
('Lightning', 'Mcqueen', 2008);



--    EASY CHALLENGE    --

CREATE TABLE top_books (
book_title VARCHAR(100) NOT NULL PRIMARY KEY,
book_publish_date DATE,
book_author VARCHAR(45)
);

INSERT INTO top_books (book_title, book_publish_date, book_author)
VALUES
('Get money', '2000-10-05', 'Bobby Shmurda'),
('Harry Potter', '2010-04-08', 'J.K. Rowling'),
('The Beach', '2005-12-25', 'Philbert Arena'),
('To the top', '2013-09-09', 'Albert Fuego'),
('Elevator', '2018-09-12', 'Elmer Bobseld');

INSERT INTO top_books (book_title, book_publish_date, book_author)
VALUES
('Coding for dummies', '2000-10-05', 'Bill Shmill'),
('Enlightenment', '2000-10-05', 'Bob Phrog');

DELETE FROM top_books ORDER BY book_publish_date DESC LIMIT 1;

SELECT COUNT(*) FROM top_books;



--    MEDIUM CHALLENGE    --

CREATE TABLE top_movies (
movie_title VARCHAR(100) NOT NULL PRIMARY KEY,
movie_release_date DATE,
movie_rating ENUM('G', 'PG', 'PG-13', 'R')
);

INSERT INTO top_movies (movie_title, movie_release_date, movie_rating)
VALUES
('The Adam Project', '2022-03-20', 'PG-13'),
('Turning Red', '2022-02-10', 'PG'),
('Dog', '2022-05-12', 'PG-13'),
('Badhaai Do', '2022-03-03', 'PG-13'),
('Fresh', '2022-05-15', 'R'),
('Free Guy', '2022-01-30', 'PG-13'),
('No Exit', '2022-05-20', 'R'),
('Diary of a wimpy kid', '2021-06-07', 'PG'),
('The Power of the Dog', '2022-03-30', 'R'),
('Rumble', '2021-11-20', 'PG');

SELECT * FROM top_movies
WHERE movie_title LIKE '%s%';



--    HARD CHALLENGE    --

ALTER TABLE top_movies ADD director_firstname VARCHAR(30); 
ALTER TABLE top_movies ADD director_lastname VARCHAR(30);

UPDATE top_movies SET director_firstname = 'Isaac', 
director_lastname= 'Santos' WHERE movie_title = 'Diary of a wimpy kid' ;

UPDATE top_movies SET director_firstname = 'Seth', 
director_lastname= 'Mulia' WHERE movie_title = 'Rumble' ;

UPDATE top_movies SET director_firstname = 'Drew', 
director_lastname= 'Woods' WHERE movie_title = 'Free Guy' ;

SELECT director_firstname, director_lastname, 
CONCAT (director_firstname,' ', director_lastname) AS director
FROM top_movies;

SELECT * FROM top_movies ORDER BY director_lastname ASC;

DELETE FROM top_movies WHERE director_lastname BETWEEN 'r%' AND 'z%';

SELECT * FROM top_movies LIMIT 3;



--    VERY HARD CHALLENGE    --

ALTER TABLE top_cars ADD car_price INT; 
ALTER TABLE top_cars ADD car_color VARCHAR(45);

SELECT car_make, car_model,
CONCAT (car_make,', ', car_model) AS car
FROM top_cars;

SELECT car_make, COUNT(*) FROM top_cars GROUP BY car_make;