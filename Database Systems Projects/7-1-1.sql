/* A */
CREATE TABLE Movies(
    title VARCHAR(100),
    year INTEGER,
    length INTEGER,
    genre CHAR(10),
    inColor BIT(1),
    studioName CHAR(50),
    producerC INTEGER,
    PRIMARY KEY(title, year),
    FOREIGN KEY(producerC) REFERENCES MovieExec(cert)
);

/* B */
CREATE TABLE Movies(
    title VARCHAR(100),
    year INTEGER,
    length INTEGER,
    inColor BIT(1),
    studioName CHAR(100),
    producerC INTEGER NOT NULL,
    FOREIGN KEY(producerC) REFERENCES MovieExec(cert)
);

/* C */
CREATE TABLE Movies(
    title VARCHAR(255),
    year INTEGER,
    length INTEGER,
    inColor BIT(1),
    studioName CHAR(50),
    producerC INTEGER REFERENCES MovieExec(cert) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

/* D */
CREATE TABLE StarsIn(
    movieTitle VARCHAR(255) REFERENCES Movies(title),
    movieYear INTEGER,
    starName CHAR(30)
);

/* E */
CREATE TABLE StarsIn(
    movieTitle VARCHAR(255),
    movieYear INTEGER,
    starName CHAR(30) REFERENCES MovieStar(name)
        ON DELETE CASCADE
);

CREATE TABLE MovieStar(
    name VARCHAR(255),
    address VARCHAR(255),
    gender VARCHAR(10),
    birthdate date
);

CREATE TABLE MovieExec(
    name CHAR(30),
    address VARCHAR(255),
    cert INTEGER PRIMARY KEY,
    netWorth INTEGER
);

CREATE TABLE Studio (
    name CHAR(50) PRIMARY KEY,
    address VARCHAR(255),
    presC INTEGER
);