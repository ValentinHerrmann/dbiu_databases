PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Lieferant (
     Nr          INTEGER    PRIMARY KEY,
     Name        CHAR(30)   NOT NULL,
     Strasse     CHAR(30),
     PLZ         INTEGER,
     Ort         CHAR(25),
     Sperre      CHAR (1)       
);
INSERT INTO Lieferant VALUES(1,'Firma Gerti Schmidtner','Dr.Gesslerstr.59',93051,'Regensburg','0');
INSERT INTO Lieferant VALUES(2,'Rauch GmbH','Burgallee 23',90403,'Nürnberg','0');
INSERT INTO Lieferant VALUES(3,'Shimano GmbH','Rosengasse 122',51143,'Köln','0');
INSERT INTO Lieferant VALUES(4,'Suntour LTD','65 Melton Street',NULL,'London','0');
INSERT INTO Lieferant VALUES(5,'MSM GmbH','St-Rotteneckstr.13',93047,'Regensburg','0');
CREATE TABLE Kunde (
     Nr          INTEGER    PRIMARY KEY,
     Name        CHAR(30)   NOT NULL,
     Strasse     CHAR(30),
     PLZ         INTEGER,
     Ort         CHAR(20),
     Sperre      CHAR (1)       
);
INSERT INTO Kunde VALUES(1,'Fahrrad Shop','Obere Regenstr. 4',93059,'Regensburg','0');
INSERT INTO Kunde VALUES(2,'Zweirad-Center Staller','Kirschweg 20',44267,'Dortmund','0');
INSERT INTO Kunde VALUES(3,'Maier Ingrid','Universitätsstr. 33',93055,'Regensburg','1');
INSERT INTO Kunde VALUES(4,'Rafa - Seger KG','Liebigstr. 10',10247,'Berlin','0');
INSERT INTO Kunde VALUES(5,'Biker Ecke','Lessingstr. 37',22087,'Hamburg','0');
INSERT INTO Kunde VALUES(6,'Fahrräder Hammerl','Schindlerplatz 7',81739,'München','0');
CREATE TABLE Personal (
     Persnr      INTEGER    PRIMARY KEY,
     Name        CHAR(30)   NOT NULL,
     Strasse     CHAR(30),
     PLZ         INTEGER,
     Ort         CHAR(20),
     GebDatum    DATE       NOT NULL,
     Stand       CHAR(6),
     Vorgesetzt  INTEGER,
     Gehalt      NUMERIC(8,2),
     Beurteilung CHAR(1),
     Aufgabe     CHAR(18),
     Constraint FK_Personal FOREIGN KEY (Vorgesetzt) REFERENCES Personal(Persnr)
                            ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO Personal VALUES(1,'Maria Forster','Ebertstr. 28',93051,'Regensburg','1999-07-05','verh',NULL,4800,'2','Manager');
INSERT INTO Personal VALUES(2,'Anna Kraus','Kramgasse 5',93047,'Regensburg','1995-07-09','led',1,2300,'3','Vertreter');
INSERT INTO Personal VALUES(3,'Ursula Rank','Dreieichstr. 12',60594,'Frankfurt','1987-09-04','verh',6,2700,'1','Facharbeiterin');
INSERT INTO Personal VALUES(4,'Heinz Rolle','In der Au 5',90455,'Nürnberg','1977-10-12','led',1,3300,'3','Sekretär');
INSERT INTO Personal VALUES(5,'Johanna Köster','Wachtelstr. 7',90427,'Nürnberg','2004-02-07','ges',1,2100,'5','Vertreter');
INSERT INTO Personal VALUES(6,'Marianne Lambert','Fraunhofer Str 3',92224,'Landshut','1994-05-22','verh',NULL,4100,'1','Meister');
INSERT INTO Personal VALUES(7,'Thomas Noster','Mahlergasse 10',93047,'Regensburg','1992-09-17','verh',6,2500,'5','Arbeiter');
INSERT INTO Personal VALUES(8,'Renate Wolters','Lessingstr. 9',86159,'Augsburg','1999-07-14','led',1,3300,'4','Sachbearbeiterin');
INSERT INTO Personal VALUES(9,'Ernst Pach','Olgastr. 99',70180,'Stuttgart','2007-03-29','led',6,800,NULL,'Azubi');
CREATE TABLE Artikel (
     Anr         INTEGER    PRIMARY KEY,
     Bezeichnung CHAR(30)   NOT NULL,
     Netto       NUMERIC(7,2),
     Steuer      NUMERIC(7,2),
     Preis       NUMERIC(7,2),
     Farbe       CHAR(10),
     Mass        CHAR(15),
     Einheit     CHAR(2)    NOT NULL,
     Typ         CHAR(1)    NOT NULL
);
INSERT INTO Artikel VALUES(100001,'Herren-City-Rad',588.24,111.76,700,'blau','26 Zoll','ST','E');
INSERT INTO Artikel VALUES(100002,'Damen-City-Rad',546.22,103.78,650,'rot','26 Zoll','ST','E');
INSERT INTO Artikel VALUES(200001,'Herren-City-Rahmen lackiert',336.13,63.87,400,'blau',NULL,'ST','Z');
INSERT INTO Artikel VALUES(200002,'Damen-City-Rahmen lackiert',336.13,63.87,400,'rot',NULL,'ST','Z');
INSERT INTO Artikel VALUES(300001,'Herren-City-Rahmen geschweisst',310.92,59.08,370,NULL,NULL,'ST','Z');
INSERT INTO Artikel VALUES(300002,'Damen-City-Rahmen geschweisst',310.92,59.08,370,NULL,NULL,'ST','Z');
INSERT INTO Artikel VALUES(400001,'Rad',58.82,11.18,70,NULL,'26 Zoll','ST','Z');
INSERT INTO Artikel VALUES(500001,'Rohr 25CrMo4 9mm',6.3,1.2,7.5,NULL,'9mm','CM','F');
INSERT INTO Artikel VALUES(500002,'Sattel',42.02,7.98,50,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500003,'Gruppe Deore LX',5.88,1.12,7,NULL,'LX','ST','F');
INSERT INTO Artikel VALUES(500004,'Gruppe Deore XT',5.04,0.96,6,NULL,'XT','ST','F');
INSERT INTO Artikel VALUES(500005,'Gruppe XC-LTD',6.72,1.28,8,NULL,'XC-LTD','ST','F');
INSERT INTO Artikel VALUES(500006,'Felgensatz',33.61,6.39,40,NULL,'26 Zoll','ST','F');
INSERT INTO Artikel VALUES(500007,'Bereifung Schwalbe',16.81,3.19,20,NULL,'26 Zoll','ST','F');
INSERT INTO Artikel VALUES(500008,'Lenker + Vorbau',78.98999999999999,15.01,94,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500009,'Sattelstuetze',4.62,0.88,5.5,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500010,'Pedalsatz',33.61,6.39,40,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500011,'Rohr 34CrMo4 2.1mm',3.36,0.64,4,NULL,'2,1mm','CM','F');
INSERT INTO Artikel VALUES(500012,'Rohr 34CrMo3 2.4mm',3.61,0.6899999999999999,4.3,NULL,'2,4mm','CM','F');
INSERT INTO Artikel VALUES(500013,'Tretlager',25.21,4.79,30,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500014,'Gabelsatz',10.08,1.92,12,NULL,NULL,'ST','F');
INSERT INTO Artikel VALUES(500015,'Schlauch',6.72,1.28,8,NULL,'26 Zoll','ST','F');
CREATE TABLE Lager (
     Artnr       INTEGER    PRIMARY KEY,
     Lagerort    CHAR(6),
     Bestand     SMALLINT   NOT NULL,
     Mindbest    SMALLINT,
     Reserviert  SMALLINT,
     Bestellt    SMALLINT,
     Constraint FK_Lager_Artikel FOREIGN KEY (Artnr) REFERENCES Artikel(Anr)
                              ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Lager VALUES(100001,'001002',3,0,2,0);
INSERT INTO Lager VALUES(100002,'001001',6,0,3,0);
INSERT INTO Lager VALUES(200001,NULL,0,0,0,0);
INSERT INTO Lager VALUES(200002,'004004',2,0,0,0);
INSERT INTO Lager VALUES(300001,NULL,0,0,0,0);
INSERT INTO Lager VALUES(300002,'002001',7,0,2,0);
INSERT INTO Lager VALUES(400001,'005001',1,0,0,0);
INSERT INTO Lager VALUES(500001,'003005',8050,6000,184,0);
INSERT INTO Lager VALUES(500002,'002002',19,20,2,10);
INSERT INTO Lager VALUES(500003,'001003',15,10,0,0);
INSERT INTO Lager VALUES(500004,'004001',18,10,0,0);
INSERT INTO Lager VALUES(500005,'003002',2,0,0,0);
INSERT INTO Lager VALUES(500006,'003004',21,20,0,0);
INSERT INTO Lager VALUES(500007,'002003',62,40,0,0);
INSERT INTO Lager VALUES(500008,'003003',39,20,1,0);
INSERT INTO Lager VALUES(500009,'002007',23,20,0,0);
INSERT INTO Lager VALUES(500010,'001006',27,20,1,0);
INSERT INTO Lager VALUES(500011,'001007',3250,3000,161,0);
INSERT INTO Lager VALUES(500012,'004002',720,600,20,0);
INSERT INTO Lager VALUES(500013,'005002',20,20,2,0);
INSERT INTO Lager VALUES(500014,'005003',27,20,1,0);
INSERT INTO Lager VALUES(500015,'002004',55,40,0,0);
CREATE TABLE Lieferung (
     Anr         INTEGER,
     Liefnr      INTEGER,
     Lieferzeit  SMALLINT,
     Nettopreis  NUMERIC(7,2),
     Bestellt    SMALLINT,
     Constraint PK_Lieferung PRIMARY KEY (Anr, Liefnr),
     Constraint FK_Lieferung_Artikel FOREIGN KEY (Anr) REFERENCES Artikel(Anr)
                              ON DELETE CASCADE ON UPDATE CASCADE,
     Constraint FK_Lieferant FOREIGN KEY (Liefnr) REFERENCES Lieferant(Nr)
                             ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Lieferung VALUES(500001,5,1,5.5,0);
INSERT INTO Lieferung VALUES(500002,2,4,36.6,10);
INSERT INTO Lieferung VALUES(500002,1,5,35.1,0);
INSERT INTO Lieferung VALUES(500003,3,6,5.6,0);
INSERT INTO Lieferung VALUES(500003,4,5,5.45,0);
INSERT INTO Lieferung VALUES(500003,2,4,5.7,0);
INSERT INTO Lieferung VALUES(500004,3,2,4.7,0);
INSERT INTO Lieferung VALUES(500004,4,3,4.5,0);
INSERT INTO Lieferung VALUES(500005,4,5,5.7,0);
INSERT INTO Lieferung VALUES(500006,1,1,26,0);
INSERT INTO Lieferung VALUES(500007,1,2,15.5,0);
INSERT INTO Lieferung VALUES(500008,1,4,73,0);
INSERT INTO Lieferung VALUES(500009,1,2,4,0);
INSERT INTO Lieferung VALUES(500009,2,1,4.3,0);
INSERT INTO Lieferung VALUES(500010,1,3,29.9,0);
INSERT INTO Lieferung VALUES(500011,5,1,2.6,0);
INSERT INTO Lieferung VALUES(500012,5,1,3.2,0);
INSERT INTO Lieferung VALUES(500013,1,4,21,0);
INSERT INTO Lieferung VALUES(500014,1,5,9,0);
INSERT INTO Lieferung VALUES(500015,1,1,6,0);
CREATE TABLE Teilestruktur (
     Artnr       INTEGER,
     Einzelteilnr INTEGER,
     Anzahl      SMALLINT,
     Einheit     CHAR(2),
     Constraint PK_Teilestruktur PRIMARY KEY (Artnr, Einzelteilnr),
     Constraint FK_Artnr_Artikel FOREIGN KEY (Artnr) REFERENCES Artikel(Anr)
                              ON DELETE CASCADE ON UPDATE CASCADE,
     Constraint FK_ETeil_Artikel FOREIGN KEY (Einzelteilnr) REFERENCES Artikel(Anr)
                              ON DELETE NO ACTION ON UPDATE CASCADE
);
INSERT INTO Teilestruktur VALUES(100001,200001,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,500002,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,500003,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,400001,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,500008,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,500009,1,'ST');
INSERT INTO Teilestruktur VALUES(100001,500010,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,200002,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,500002,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,500004,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,400001,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,500008,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,500009,1,'ST');
INSERT INTO Teilestruktur VALUES(100002,500010,1,'ST');
INSERT INTO Teilestruktur VALUES(200001,300001,1,'ST');
INSERT INTO Teilestruktur VALUES(200002,300002,1,'ST');
INSERT INTO Teilestruktur VALUES(300001,500001,180,'CM');
INSERT INTO Teilestruktur VALUES(300001,500011,161,'CM');
INSERT INTO Teilestruktur VALUES(300001,500012,20,'CM');
INSERT INTO Teilestruktur VALUES(300001,500013,1,'ST');
INSERT INTO Teilestruktur VALUES(300001,500014,1,'ST');
INSERT INTO Teilestruktur VALUES(300002,500001,360,'CM');
INSERT INTO Teilestruktur VALUES(300002,500011,106,'CM');
INSERT INTO Teilestruktur VALUES(300002,500012,20,'CM');
INSERT INTO Teilestruktur VALUES(300002,500013,1,'ST');
INSERT INTO Teilestruktur VALUES(300002,500014,1,'ST');
INSERT INTO Teilestruktur VALUES(400001,500007,2,'ST');
INSERT INTO Teilestruktur VALUES(400001,500006,1,'ST');
INSERT INTO Teilestruktur VALUES(400001,500015,2,'ST');
CREATE TABLE Auftrag (
     AuftrNr     INTEGER    PRIMARY KEY,
     Datum       DATE,
     Kundnr      INTEGER    NOT NULL,
     Persnr      INTEGER,
     Constraint FK_Auftrag_Kunde FOREIGN KEY (Kundnr) REFERENCES Kunde(Nr)
                                 ON DELETE NO ACTION ON UPDATE CASCADE,
     Constraint FK_Auftrag_Personal FOREIGN KEY (Persnr) REFERENCES Personal(Persnr)
                                    ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO Auftrag VALUES(1,'2025-01-04',1,2);
INSERT INTO Auftrag VALUES(2,'2025-01-06',3,5);
INSERT INTO Auftrag VALUES(3,'2025-01-07',4,2);
INSERT INTO Auftrag VALUES(4,'2025-01-18',6,5);
INSERT INTO Auftrag VALUES(5,'2025-02-03',1,2);
CREATE TABLE Auftragsposten (
     PosNr       INTEGER    PRIMARY KEY,
     AuftrNr     INTEGER    NOT NULL,
     Artnr       INTEGER    NOT NULL,
     Anzahl      SMALLINT,
     Gesamtpreis NUMERIC(7,2),
     Constraint AK_Auftragsposten UNIQUE (AuftrNr, Artnr),
     Constraint FK_Auftrag_Auftrag FOREIGN KEY (AuftrNr) REFERENCES Auftrag(AuftrNr)
                                   ON DELETE CASCADE ON UPDATE CASCADE,
     Constraint FK_Auftrag_Artikel FOREIGN KEY (Artnr) REFERENCES Artikel(Anr)
                                ON DELETE NO ACTION ON UPDATE CASCADE
);
INSERT INTO Auftragsposten VALUES(101,1,200002,2,800);
INSERT INTO Auftragsposten VALUES(201,2,100002,3,1950);
INSERT INTO Auftragsposten VALUES(202,2,200001,1,400);
INSERT INTO Auftragsposten VALUES(301,3,100001,1,700);
INSERT INTO Auftragsposten VALUES(302,3,500002,2,100);
INSERT INTO Auftragsposten VALUES(401,4,100001,1,700);
INSERT INTO Auftragsposten VALUES(402,4,500001,4,30);
INSERT INTO Auftragsposten VALUES(403,4,500008,1,94);
INSERT INTO Auftragsposten VALUES(501,5,500010,1,40);
INSERT INTO Auftragsposten VALUES(502,5,500013,1,30);
CREATE TABLE Reservierung (
     Posnr       INTEGER,
     Artnr       INTEGER,
     Anzahl      SMALLINT,
     Constraint PK_Reservierung PRIMARY KEY (Posnr, Artnr),
     Constraint FK_Teil_Auftrag FOREIGN KEY (Posnr) REFERENCES Auftragsposten(PosNr)
                              ON DELETE NO ACTION ON UPDATE CASCADE,
     Constraint FK_Teil_Artikel FOREIGN KEY (Artnr) REFERENCES Artikel(Anr)
                             ON DELETE NO ACTION ON UPDATE CASCADE
);
INSERT INTO Reservierung VALUES(101,300002,2);
INSERT INTO Reservierung VALUES(201,100002,3);
INSERT INTO Reservierung VALUES(202,500001,180);
INSERT INTO Reservierung VALUES(202,500011,161);
INSERT INTO Reservierung VALUES(202,500012,20);
INSERT INTO Reservierung VALUES(202,500013,1);
INSERT INTO Reservierung VALUES(202,500014,1);
INSERT INTO Reservierung VALUES(301,100001,1);
INSERT INTO Reservierung VALUES(302,500002,2);
INSERT INTO Reservierung VALUES(401,100001,1);
INSERT INTO Reservierung VALUES(402,500001,4);
INSERT INTO Reservierung VALUES(403,500008,1);
INSERT INTO Reservierung VALUES(501,500010,1);
INSERT INTO Reservierung VALUES(502,500013,1);
COMMIT;
