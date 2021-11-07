CREATE TABLE Changelog(
    name VARCHAR(64),
    birth date,
    type VARCHAR(64),
    id INTEGER,
    operation VARCHAR(115),
    accessed_time VARCHAR(300)
);

/* INSERT COPY */
CREATE OR REPLACE FUNCTION record_changes() RETURNS trigger AS
$$
BEGIN
    INSERT INTO Changelog
    VALUES(NEW.name, NEW.birth, NEW.type, NEW.id, 'INSERT', CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER insert_trigger
AFTER INSERT ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes();

/* UPDATE COPY */
CREATE OR REPLACE FUNCTION record_changes1() RETURNS trigger AS
$$
BEGIN
    INSERT INTO Changelog
    VALUES(NEW.name, NEW.birth, NEW.type, NEW.id, 'UPDATE', CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER update_trigger 
AFTER UPDATE ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes1();

/* DELETE COPY */
CREATE OR REPLACE FUNCTION record_changes2() RETURNS trigger AS
$$
BEGIN
    INSERT INTO Changelog
    VALUES(OLD.name, OLD.birth, OLD.type, OLD.id, 'DELETE', CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER delete_trigger
BEFORE DELETE ON Records
FOR EACH ROW
EXECUTE PROCEDURE record_changes2();

