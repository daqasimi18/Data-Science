/* This table is for storing the sum of cost from the pets Record table and It's used in question 3*/
CREATE TABLE Result(
    visit_date DATE,
    description VARCHAR(64),
    cost MONEY,
    idd INTEGER
);




/* 1 */
CREATE OR REPLACE FUNCTION hundred_trigger() RETURNS trigger AS
$$
BEGIN
    IF((('2021-03-14'-NEW.birth)/365) > 100)
    THEN
        RAISE NOTICE 'Pet is over 100 years old';
        INSERT INTO Records
        VALUES(NEW.name, NEW.birth, NEW.type, NEW.id);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER morethanhundred
AFTER INSERT ON Records
FOR EACH ROW
WHEN ((('2021-03-14'-NEW.birth)/365) >= 100)
    EXECUTE PROCEDURE hundred_trigger();
/* Test Cases */
INSERT INTO Records VALUES('Stapa', '1919-03-14','dog',1009);
INSERT INTO Records VALUES('Sapai', '2019-03-14','dog',1010);
 
 
 
 

/* 2 */
CREATE OR REPLACE FUNCTION delete_this_trigger() RETURNS trigger AS
$$
BEGIN
    IF(NEW.cost = NULL)
    THEN
        INSERT INTO Visits
        VALUES(visit_date, description, NULL, idd);
    ELSE
        INSERT INTO Visits VALUES(NEW.visit_date, NEW.description, NEW.cost, NEW.idd);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER deletetrigger
BEFORE DELETE ON Visits
FOR EACH ROW
WHEN (OLD.cost = NULL)
    EXECUTE PROCEDURE delete_this_trigger();
/* Test Cases */
INSERT INTO Visits VALUES('2021-03-14','Sore Throat',NULL,1008);
DELETE FROM Visits WHERE cost = NULL; 





/* 3 */
CREATE OR REPLACE FUNCTION visit_cost_trigger() RETURNS trigger AS
$$
BEGIN
     INSERT INTO Result SELECT * FROM Visits;
     RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER visit_trigger
BEFORE INSERT ON Visits
FOR EACH ROW
EXECUTE PROCEDURE visit_cost_trigger();
/* Test Cases */
INSERT INTO Visits VALUES('2021-03-12','Stomach',300,1003);
SELECT idd, SUM(cost) FROM Result GROUP BY idd;

CREATE OR REPLACE FUNCTION visit_cost_trigger1() RETURNS trigger AS
$$
BEGIN
     INSERT INTO Result SELECT * FROM Visits;
     RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER visit_trigger1
AFTER INSERT ON Visits
FOR EACH ROW
EXECUTE PROCEDURE visit_cost_trigger1();
/* Test Cases */
INSERT INTO Visits VALUES('2021-03-12','Stomach',290,1003);
SELECT idd, SUM(cost) FROM Result GROUP BY idd;
 
 
 
 
 
 
 
/* 4 */
CREATE OR REPLACE FUNCTION name_trigger() RETURNS trigger AS
$$
BEGIN
    IF(NEW.name IN(SELECT name FROM Records))
    THEN
        INSERT INTO Records VALUES(NEW.name || ' Jr.', NEW.birth, NEW.type, NEW.id);
        RETURN OLD;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER name_check
BEFORE INSERT ON Records
FOR EACH ROW
EXECUTE PROCEDURE name_trigger();
/* Test Cases */
INSERT INTO Records VALUES('Glace','2019-02-01','cat',1022); 