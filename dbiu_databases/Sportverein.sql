PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS 'Sportverein' (
  'vorname' varchar(15)  NOT NULL,
  'nachname' varchar(25)  NOT NULL,
  'gebDat' date  NOT NULL,
  'sportart' varchar(15)  NOT NULL,
  'vereinsbeitritt' int(4) NOT NULL,
  PRIMARY KEY ('vorname', 'nachname', 'gebDat')
);
INSERT INTO Sportverein VALUES('Andy','Tür ','2009-01-03','Fussball',2015);
INSERT INTO Sportverein VALUES('Ann','Geber ','2009-01-29','Turnen',2017);
INSERT INTO Sportverein VALUES('Ann','Zeiger','2009-11-11','Turnen',2015);
INSERT INTO Sportverein VALUES('Ann','Zug','2009-11-24','Turnen',2016);
INSERT INTO Sportverein VALUES('Anna','Nass ','2009-01-16','Judo',2016);
INSERT INTO Sportverein VALUES('Ben','Nimmdich ','2009-02-11','Judo',2018);
INSERT INTO Sportverein VALUES('Bernhard','Diener ','2009-02-24','Fussball',2015);
INSERT INTO Sportverein VALUES('Bill','Yard ','2009-03-09','Parkur',2016);
INSERT INTO Sportverein VALUES('Cindy','Kerzenan','2009-12-07','Volleyball',2017);
INSERT INTO Sportverein VALUES('Clair','Grube','2009-10-29','Turnen',2018);
INSERT INTO Sportverein VALUES('Ellen','Bogen','2009-12-11','Volleyball',2019);
INSERT INTO Sportverein VALUES('Ellen','Lang','2009-10-03','Turnen',2016);
INSERT INTO Sportverein VALUES('Erkan','Alles ','2009-04-04','Judo',2018);
INSERT INTO Sportverein VALUES('Frank','Reich ','2009-04-17','Volleyball',2019);
INSERT INTO Sportverein VALUES('Gerd','Nehr ','2009-04-30','Fussball',2016);
INSERT INTO Sportverein VALUES('Harry','Bo','2009-12-20','Fussball',2018);
INSERT INTO Sportverein VALUES('Hella','Wahnsinn','2009-08-25','Bewegungskünste',2017);
INSERT INTO Sportverein VALUES('Ina','Rein ','2009-05-13','Bewegungskünste',2017);
INSERT INTO Sportverein VALUES('Inge','Neur','2009-12-02','Volleyball',2019);
INSERT INTO Sportverein VALUES('Ismir','Schnuppe ','2009-05-26','Fussball',2018);
INSERT INTO Sportverein VALUES('Jim','Panse ','2009-08-12','Bewegungskünste',2016);
INSERT INTO Sportverein VALUES('Kai','Sehr ','2009-06-08','Parkur',2015);
INSERT INTO Sportverein VALUES('Ken','Wott','2009-03-22','Volleyball',2019);
INSERT INTO Sportverein VALUES('Klara','Himmel','2009-09-07','Bewegungskünste',2018);
INSERT INTO Sportverein VALUES('Marion','Nette ','2009-06-21','Parkur',2016);
INSERT INTO Sportverein VALUES('Marta','Pfahl ','2009-07-04','Judo',2017);
INSERT INTO Sportverein VALUES('Mira','Belle','2009-07-17','Judo',2018);
INSERT INTO Sportverein VALUES('Rosa','Blume','2009-09-20','Turnen',2015);
INSERT INTO Sportverein VALUES('Rosa','Wolke','2009-10-16','Turnen',2017);
INSERT INTO Sportverein VALUES('Sam','Urai ','2009-07-30','Bewegungskünste',2015);
COMMIT;
