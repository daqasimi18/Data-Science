/* 8.2.2 */
/* A */
/* Yes, the given view is updatable. */

/* B */
CREATE TRIGGER DisneyComedyInsert
INSTEAD OF INSERT ON DisneyComedies 
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
INSERT INTO Movies(title, year, length, studioName, genre)
VALUES(NewRow.title, NewRow.year, NewRow.length, 'Disney', 'comedy');

/* C */
CREATE TRIGGER NewDisneyComedy
INSTEAD OF UPDATE ON DisneyComedies 
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
UPDATE Movies SET length NewRow.length
WHERE title = NewRow.title AND Year = NewRow.year AND studioName = 'Disney' AND genre = 'comedy';