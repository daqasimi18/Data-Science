/* A */
CREATE VIEW RichExec AS 
SELECT name, address, cert, networth
FROM MovieExec
WHERE networth >= 10000000;

/* B */
CREATE VIEW StudioPres(name, address, cert) AS
SELECT MovieExec.name, MovieExec.address, MovieExec.cert
FROM MovieExec, Studio
WHERE MovieExec.cert = Studio.presC;

/* C */
CREATE VIEW ExecutiveStar(name, address, gender, birthdate, cert, networth) AS
SELECT MovieStar.name, MovieStar.address, MovieStar.gender, MovieStar.birthdate, MovieExec.cert, MovieExec.networth
FROM MovieExec, MovieStar
WHERE MovieStar.name = MovieExec.name AND MovieStar.address = MovieExec.address;
