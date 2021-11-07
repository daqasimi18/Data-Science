/* A */
CREATE OR REPLACE FUNCTION revertPCPrice() RETURNS trigger AS
$$
BEGIN
    IF (OLD.price < NEW.price)
    THEN
        UPDATE PC
        SET price = OLD.price
        WHERE speed = NEW.speed;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER PCPriceTrigger
AFTER UPDATE OF price ON PC
FOR EACH ROW
WHEN (OLD.price < NEW.price)
EXECUTE PROCEDURE revertPCPrice();

/* B */
CREATE OR REPLACE FUNCTION ProductPrinter() RETURNS trigger AS
$$
BEGIN
    IF (NEW.model NOT IN (SELECT model FROM Product WHERE type = 'printer'))
    THEN
        RAISE NOTICE 'Printer model not in Product; returning null';
        RETURN NULL;
    ELSE
        INSERT INTO Printer VALUES(NEW.model, NEW.color, NEW.type, NEW.price);                 
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
                          
CREATE TRIGGER ProductPrinterTrigger
BEFORE INSERT ON Printer
FOR EACH ROW
EXECUTE PROCEDURE ProductPrinter();                          

/* C */                         
CREATE OR REPLACE FUNCTION LaptopPrice() RETURNS trigger AS
$$
BEGIN
    IF ((SELECT SUM(NEW.price)/COUNT(Product.maker) FROM Laptop, Product GROUP BY Product.maker) >= 1500)
    THEN
        RETURN NEW;
    ELSE
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
                          
CREATE TRIGGER Laptop_price_trigger
AFTER INSERT ON Laptop
FOR EACH ROW
WHEN(NEW.price = NULL)                          
EXECUTE PROCEDURE LaptopPrice();                          
                          
/* D */
CREATE OR REPLACE FUNCTION HDPCRAM() RETURNS trigger AS
$$
BEGIN
    RAISE NOTICE 'HD is not 100 times more than RAM; reverting';
    IF ((NEW.hd/1000)*100 >= NEW.ram)
    THEN
        RETURN NEW;
    ELSE
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql; 
                                                  
CREATE TRIGGER RAMPCHD
BEFORE UPDATE OF ram ON PC
FOR EACH ROW
WHEN (NEW.hd*100 < NEW.ram)
EXECUTE PROCEDURE HDPCRAM();

/* E */
CREATE OR REPLACE FUNCTION PCLPPR() RETURNS trigger AS
$$
BEGIN
    IF (NEW.model NOT IN(SELECT model FROM PC))
    THEN
        INSERT INTO PC VALUES(NEW.model, NEW.speed, NEW.ram, NEW.hd, NEW.price);
    ELSE
        RETURN NULL;                 
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
                          
CREATE TRIGGER LPPCPR
BEFORE INSERT ON PC
FOR EACH ROW
EXECUTE PROCEDURE PCLPPR(); 

                         
CREATE OR REPLACE FUNCTION PCLPPR1() RETURNS trigger AS
$$
BEGIN
    IF (NEW.model NOT IN(SELECT model FROM Laptop))
    THEN
        INSERT INTO Laptop VALUES(NEW.model, NEW.speed, NEW.ram, NEW.hd, NEW.screen, NEW.price);
    ELSE
        RETURN NULL;                 
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql; 
                          
CREATE TRIGGER LPPCPR1
BEFORE INSERT ON Laptop
FOR EACH ROW
EXECUTE PROCEDURE PCLPPR1(); 

                         
CREATE OR REPLACE FUNCTION PCLPPR2() RETURNS trigger AS
$$
BEGIN
    IF (NEW.model NOT IN(SELECT model FROM Printer))
    THEN
        INSERT INTO Printer VALUES(NEW.model, NEW.color, NEW.type, NEW.price);
    ELSE
        RETURN NULL;                 
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;  
                          
CREATE TRIGGER LPPCPR2
BEFORE INSERT ON Printer
FOR EACH ROW
EXECUTE PROCEDURE PCLPPR2();                       