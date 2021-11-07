									/* 7.3.1 */
/* A */
DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie(
    title VARCHAR(100),
    year INTEGER,
    length INTEGER,
    genre VARCHAR(50),
    studioName VARCHAR(50),
    producerC INTEGER,
    PRIMARY KEY (title, year)
);

/* B */
ALTER TABLE Movie;
CREATE TABLE Movie(
    title VARCHAR(100),
    year INTEGER,
    length INTEGER,
    genre VARCHAR(50),
    studioName VARCHAR(50),
    producerC INTEGER,
    PRIMARY KEY (title, year),
    FOREIGN KEY(producerC) REFERENCES MovieExec(cert)
);

/* C */
ALTER TABLE Movie;
CREATE TABLE Movie(
    title VARCHAR(100),
    year INTEGER,
    length INTEGER CHECK(length > 60 OR length < 250),
    genre VARCHAR(50),
    studioName VARCHAR(50),
    producerC INTEGER,
    PRIMARY KEY (title, year),
    FOREIGN KEY(producerC) REFERENCES MovieExec(cert)
);

/* D */
DROP TABLE IF EXISTS MovieStar;
CREATE TABLE MovieStar(
	name VARCHAR(50) ADD CONSTRAINT ONE
		CHECK(name NOT IN(SELECT name FROM MovieExec)),
	address VARCHAR(50),
	gender VARCHAR(10),
	birthdate DATE
);

DROP TABLE IF EXISTS MovieExec;
CREATE TABLE MovieExec (
    name VARCHAR(30) ADD CONSTRAINT TWO
    	CHECK(name NOT IN(SELECT name FROM MovieStar)),
    address VARCHAR(255),
    cert INTEGER PRIMARY KEY,
    netWorth INTEGER
);

/* E */
ALTER TABLE IF EXISTS MovieStar;
CREATE TABLE MovieStar(
	name VARCHAR(50) ADD CONSTRAINT ONE
		CHECK(name NOT IN(SELECT name FROM MovieExec)),
	address VARCHAR(50) CHECK(address NOT IN(SELECT address FROM MovieStar)),
	gender VARCHAR(10),
	birthdate DATE
);

ALTER TABLE IF EXISTS MovieExec;
CREATE TABLE MovieExec(
    name VARCHAR(30) ADD CONSTRAINT TWO
    	CHECK(name NOT IN(SELECT name FROM MovieStar)),
    address VARCHAR(255) CHECK(address NOT IN(SELECT address FROM MovieExec)),
    cert INTEGER PRIMARY KEY,
    netWorth INTEGER
);
