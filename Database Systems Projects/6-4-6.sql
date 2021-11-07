/* A */
SELECT AVG(speed) FROM PC;

/* B */
SELECT AVG(speed)
FROM PC
WHERE PC.price >= 1000;

/* C */
SELECT AVG(PC.price)
FROM PC, Product
WHERE Product.maker = 'A';

/* D */
SELECT AVG(PC.price), AVG(Laptop.price)
FROM PC, Laptop
WHERE maker IN
	(SELECT maker
	 FROM Product
	 WHERE PC.maker = 'D' AND Laptop.maker = 'D'
	);

/* E */
SELECT speed, AVG(PC.price)
FROM PC
GROUP BY speed;

/* F */
SELECT Product.maker, AVG(Laptop.screen)
FROM Product, Laptop
WHERE Product.maker = Laptop.mker
GROUP BY Product.maker;

/* G */
SELECT Product.maker
FROM Product, PC
WHERE  PC.model = Product.model
GROUP BY maker
HAVING COUNT(maker) >= 3;

/* H */
SELECT Product.maker
FROM Product, PC
WHERE Product.model = PC.model AND PC.price >= ALL(SELECT PC.price FROM PC);

/* I */
SELECT PC.speed, AVG(PC.price)
FROM PC
WHERE PC.speed >= 2.0
GROUP BY PC.speed;

/* J */
SELECT AVG(PC.hd)
FROM (
		(SELECT Product.maker
		 FROM Printer, Product
		 where Printer.model = Product.model)
		INTERSECT
		(SELECT Product.maker
		 FROM PC, Product
		 WHERE PC.model = Product.model
		)) AS F1,
		(SELECT Product.maker, PC.hd
		 FROM PC, Product
		 WHERE Product.model = PC.model) AS F2
WHERE F1.maker = F2.maker;

