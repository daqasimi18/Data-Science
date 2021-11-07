/* SECTION 1 */
CREATE TABLE Records(
	name VARCHAR(64) NOT NULL,
	birth date,
	type VARCHAR(64) CHECK(type IN('dog', 'cat', 'sheep', 'chicken', 'other')),
	id INTEGER,
	PRIMARY KEY(id));

CREATE TABLE Visits(
	visit_date DATE NOT NULL,
	description VARCHAR(64) NOT NULL,
	cost MONEY NOT NULL,
	idd INTEGER,
	FOREIGN KEY(idd) REFERENCES Records(id));

/* SECTION 2 */
INSERT INTO Records VALUES('Billy', '2018-02-03', 'cat', 1001);
INSERT INTO Records VALUES('Bob', '2017-05-01', 'dog', 1002);
INSERT INTO Records VALUES('Delon', '2019-08-13', 'sheep', 1003);
INSERT INTO Records VALUES('Pearl', '2020-01-05', 'dog', 1004);
INSERT INTO Records VALUES('Glace', '2019-01-23', 'chicken', 1005);


INSERT INTO Visits VALUES('2021-02-24', 'Is doing well', '50', 1001);
INSERT INTO Visits VALUES('2021-02-22', 'Bob looks healthy now', '80', 1002);
INSERT INTO Visits VALUES('2021-02-21', 'Delon needs a brush', '20', 1003);
INSERT INTO Visits VALUES('2021-02-20', 'Pearl needs a mouth wash', '30', 1004);
INSERT INTO Visits VALUES('2021-02-19', 'Glace got a nail cut', '40', 1005);
INSERT INTO Visits VALUES('2021-01-24', 'Billy looks sad after the visit', '45', 1001);
INSERT INTO Visits VALUES('2021-01-22', 'The place is clean', '25', 1002);
INSERT INTO Visits VALUES('2021-01-21', 'Delon needs to run', '15', 1003);
INSERT INTO Visits VALUES('2021-01-20', 'The place looks messy', '50', 1004);

/* SECTION 3 */
/* a */
SELECT name, AGE(birth)
FROM Records NATURAL JOIN Visits
GROUP BY name, birth
ORDER BY COUNT(visit_date) DESC
LIMIT 1;

/* b */
SELECT name, SUM(cost), COUNT(visit_date) FROM Visits
NATURAL JOIN Records
GROUP BY name
ORDER BY COUNT(visit_date) DESC;

/* c */
SELECT type, COUNT(*)
FROM Records
GROUP BY type;

/* d */
SELECT name, SUM(cost)
FROM Records NATURAL JOIN Visits
GROUP BY name, birth
ORDER BY COUNT(idd) ASC LIMIT 1;

/* e */
SELECT type 
FROM Records
GROUP BY type
ORDER BY COUNT(type) DESC LIMIT 1; 