PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS 'Bundesland' (
  'name' varchar(20)  NOT NULL,
  'kuerzel' varchar(2) PRIMARY KEY NOT NULL,
  'hauptstadt' varchar(15) NOT NULL,
  'regierungschef' varchar(20)  NOT NULL,
  'bundesratsstimmen' int(1) NOT NULL,
  'flaeche' int(5) NOT NULL,
  'einwohnerzahl' decimal(4,2) NOT NULL,
  'wappen' varchar(130)  NOT NULL
);
INSERT INTO Bundesland VALUES('Brandenburg','BB','Potsdam','Dietmar Woidke',4,29654,2.49,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Brandenburg_Wappen.svg');
INSERT INTO Bundesland VALUES('Berlin','BE','','Michael Müller',4,892,3.52,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Berlin.svg');
INSERT INTO Bundesland VALUES('Baden-Württemberg','BW','Stuttgart','Winfried Kretschmann',6,35751,10.88,'https://de.wikipedia.org/wiki/Datei:Coat_of_arms_of_Baden-W%C3%BCrttemberg_(lesser).svg');
INSERT INTO Bundesland VALUES('Bayern','BY','München','Markus Söder',6,70550,12.84,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Bayern_Wappen.svg');
INSERT INTO Bundesland VALUES('Bremen','HB','','Andreas Bovenschulte',3,420,0.67,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Bremen_Wappen(Mittel).svg');
INSERT INTO Bundesland VALUES('Hessen','HE','Wiesbaden','Volker Bouffier',5,21115,6.18,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Hesse.svg');
INSERT INTO Bundesland VALUES('Hamburg','HH','—','Peter Tschentscher',3,755,1.79,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:DEU_Hamburg_COA.svg');
INSERT INTO Bundesland VALUES('Mecklenburg-Vorpomme','MV','Schwerin','Manuela Schwesig',3,23212,1.61,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Mecklenburg-Western_Pomerania_(great).svg');
INSERT INTO Bundesland VALUES('Niedersachsen','NI','Hannover','Stephan Weil',6,47593,7.93,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Lower_Saxony.svg');
INSERT INTO Bundesland VALUES('Nordrhein-Westfalen','NW','Düsseldorf','Armin Laschet',6,34113,17.87,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_North_Rhine-Westfalia.svg');
INSERT INTO Bundesland VALUES('Rheinland-Pfalz','RP','Mainz','Malu Dreyer',4,19854,4.05,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Rhineland-Palatinate.svg');
INSERT INTO Bundesland VALUES('Schleswig-Holstein','SH','Kiel','Daniel Günther',4,15802,2.86,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:DEU_Schleswig-Holstein_COA.svg');
INSERT INTO Bundesland VALUES('Saarland','SL','Saarbrücken','Tobias Hans',3,2567,1,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Wappen_des_Saarlands.svg');
INSERT INTO Bundesland VALUES('Sachsen','SN','Dresden','Michael Kretschmer',4,18449,4.09,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Saxony.svg');
INSERT INTO Bundesland VALUES('Sachsen-Anhalt','ST','Magdeburg','Reiner Haseloff',4,20452,2.25,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Wappen_Sachsen-Anhalt.svg');
INSERT INTO Bundesland VALUES('Thüringen','TH','Erfurt','Bodo Ramelow',4,16202,2.17,'https://de.wikipedia.org/wiki/Land_(Deutschland)#/media/Datei:Coat_of_arms_of_Thuringia.svg');
COMMIT;
