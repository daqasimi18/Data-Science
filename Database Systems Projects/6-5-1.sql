/* A */
INSERT INTO Product VALUES('C', 1100, 'pc');
INSERT INTO PC VALUES(1100, 3.2, 1024, 180, '2499');

/* B */
INSERT INTO Product(maker, model, type)
(SELECT maker, model::decimal + 1100, 'laptop'
FROM Product
WHERE Product.type = 'pc');
INSERT INTO Laptop(model, speed, ram, hd, screen, price)
(SELECT model::decimal + 1100, speed, ram, hd, 17, price + '500'
FROM PC);


/* C */
DELETE FROM PC
WHERE PC.hd < 100;

/* D */
DELETE FROM Laptop
WHERE model IN
	(SELECT Product.model
	 FROM Product, Laptop
	 WHERE Product.model = Laptop.model
	 AND maker IN
	((SELECT DISTINCT maker
      FROM Product
	 )
	EXCEPT
	(SELECT DISTINCT maker
	 FROM Product
	 WHERE type = 'printer')));

/* E */
UPDATE Product
SET maker = 'A'
WHERE maker = 'B';

/* F */
UPDATE PC
SET ram = ram * 2, hd = hd + 60;
     
/* G */
UPDATE Laptop
SET screen = screen + 1, price = price - '100'
WHERE Laptop.model IN
	(SELECT Product.model
     FROM Product, Laptop
     WHERE Laptop.model = Product.model AND Product.maker = 'B');