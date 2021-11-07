/* A */
DROP TABLE IF EXISTS classes; 
CREATE TABLE classes(
  class varchar(16), 
  stype varchar(2), 
  country varchar(16), 
  numguns integer, 
  bore integer, 
  displacement integer,
  PRIMARY KEY(class, country)
  ); 

/* B */
DROP TABLE IF EXISTS outcomes;
CREATE TABLE outcomes(
  ship varchar(16), 
  battle varchar(16), 
  result varchar(16),
  PRIMARY KEY(battle)
  ); 

DROP TABLE IF EXISTS battles; 
CREATE TABLE battles(
  name varchar(16), 
  bdate date,
  FOREIGN KEY(name) REFERENCES outcomes(battle)
  );


/* C */
ALTER TABLE outcomes;
CREATE TABLE outcomes(
  ship varchar(16), 
  battle varchar(16), 
  result varchar(16),
  PRIMARY KEY(ship)
  ); 

DROP TABLE IF EXISTS ships;
CREATE TABLE ships(
  name varchar(16), 
  class varchar(16), 
  launched date,
  FOREIGN KEY(name) REFERENCES outcomes(ship)
  ); 

/* D */
ALTER TABLE ships;
CREATE TABLE ships(
  name varchar(16), 
  class varchar(16) CHECK(class IN(SELECT class FROM classes WHERE numguns <= 14)), 
  launched date,
  FOREIGN KEY(name) REFERENCES outcomes(ship)
  );



