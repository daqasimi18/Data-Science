/* A */
INSERT INTO Classes VALUES('Nelson', 'bb', 'Gt. Britain', 9, 16, 34000);
INSERT INTO Ships VALUES('Nelson', 'Nelson', '1927-01-01');
INSERT INTO Ships VALUES('Nelson', 'Rodney', '1927-01-01');

/* B */
INSERT INTO Classes VALUES('Vittorio', 'bb', 'Italia', 9, 15, 41000);
INSERT INTO Ships VALUES('Vittorio Veneto', 'Vittorio Veneto', '1940-01-01');
INSERT INTO Ships VALUES('Vittorio Veneto', 'Italia', '1940-01-01');
INSERT INTO Ships VALUES('Vittorio Veneto', 'Roma', '1942-01-01');

/* C */
DELETE FROM Ships
WHERE name IN
	(SELECT ship
     FROM Outcomes
     WHERE result = 'sunk'
	);

/* D */
UPDATE Classes
SET bore = bore * 2.5 , displacement = displacement / 1.1 ;

/* E */
DELETE FROM Classes
WHERE class IN
	(SELECT class FROM Classes NATURAL LEFT OUTER JOIN Ships GROUP BY class HAVING COUNT(name) < 3);