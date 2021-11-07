DROP TRIGGER insert_trigger ON Records;
DROP TRIGGER update_trigger ON Records;
DROP TRIGGER delete_trigger ON Records;

CREATE TRIGGER insert_trigger
BEFORE INSERT ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes();

CREATE TRIGGER update_trigger
BEFORE UPDATE ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes1();

CREATE TRIGGER delete_trigger
BEFORE DELETE ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes2();

/* INSERT */
INSERT INTO Records VALUES('Sparki','2020-04-10','chicken',1019);

/* UPDATE */
UPDATE Records
SET name = 'Beli'
WHERE name = 'Bob';

/* DELETE */
DELETE FROM Records WHERE name = 'Pearl';

/* DISPLAY */
SELECT * FROM Changelog;