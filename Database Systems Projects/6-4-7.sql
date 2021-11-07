/* A */
SELECT class, COUNT(*)
FROM Classes;

/* B */
SELECT AVG(numGuns)
FROM Classes;

/* C */
SELECT AVG(numGuns)
FROM Classes, Ships
WHERE Classes.class = Ships.class;


/* D */
SELECT Classes.class, MIN(Ships.launched) AS f_laun
FROM Classes, Ships
WHERE Classes.class = Ships.class
GROUP BY Classes.class;

/* E */
SELECT Ships.class, COUNT(*)
FROM Ships, Outcomes
WHERE Ships.name = Outcomes.ship AND Outcomes.result = 'sunk'
GROUP BY Ships.class;


