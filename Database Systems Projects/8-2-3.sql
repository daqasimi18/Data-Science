/* A */
/* No it not. Because the view is made of two different relations. */

/* B */
CREATE TRIGGER NewPCInsert
INSTEAD OF INSERT ON NewPC
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
(INSERT INTO Product VALUES(NewRow.maker, NewRow.model, 'pc'))
(INSERT INTO PC VALUES(NewRow.model, NewRow.speed, NewRow.ram, NewRow.hd, NewRow.price));

/* C */
CREATE TRIGGER NewPCUpdate
INSTEAD OF UPDATE ON NewPC
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
UPDATE PC SET price = NewPC.price
WHERE model = NewPC.model;

/* D */
CREATE TRIGGER NewPCDelete
INSTEAD OF DELETE ON NewPC
REFERENCING OLD ROW AS OldRow
FOR EACH ROW
(DELETE FROM Product WHERE model = OldRow.model)
(DELETE FROM PC WHERE model = OldRow.model);