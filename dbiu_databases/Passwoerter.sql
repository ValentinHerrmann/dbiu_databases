PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS 'Passwort' (
  'benutzername' varchar(100) NOT NULL,
  'passwort' varchar(100) NOT NULL,
  'ipAdresse' varchar(100) NOT NULL,
  'zuletztOnline' timestamp NOT NULL DEFAULT current_timestamp 
);
INSERT INTO Passwort VALUES('charliebird','hallo123','::ffff:c0a8:020a','2020-09-22 07:31:45');
INSERT INTO Passwort VALUES('youngPrez','DP1gs.gs1dP!','2001:db8::1428:57ab','2019-12-13 08:45:54');
INSERT INTO Passwort VALUES('PrinceDavis','monkey','2001:0db8:85a3:08d3::0370:7344','2019-12-13 08:45:59');
INSERT INTO Passwort VALUES('monalisa','il0vey0u','::ffff:c0a8:01c9','2020-09-22 07:33:01');
INSERT INTO Passwort VALUES('thomas.mueller','q2w3e4r5','2001:db8:0:8d3:0:8a2e:70:7344','2020-03-12 12:47:08');
CREATE TABLE IF NOT EXISTS 'Passwort_gehasht' (
  'benutzername' varchar(100) NOT NULL,
  'passwort' varchar(100) NOT NULL,
  'ipAdresse' varchar(100) NOT NULL,
  'zuletztOnline' timestamp NOT NULL DEFAULT current_timestamp 
);
INSERT INTO Passwort_gehasht VALUES('charliebird','10b43971a8295f3720f38fbcdd9d6ac6','::ffff:c0a8:020a','2020-09-22 07:31:45');
INSERT INTO Passwort_gehasht VALUES('monalisa','070533adf175c483ec0cf932cf2e2e8c','::ffff:c0a8:01c9','2020-09-22 05:33:01');
INSERT INTO Passwort_gehasht VALUES('PrinceDavis','d0763edaa9d9bd2a9516280e9044d885','2001:0db8:85a3:08d3::0370:7344','2019-12-13 08:45:59');
INSERT INTO Passwort_gehasht VALUES('thomas.mueller','161f3088004aea5c226e238809f870ca','2001:db8:0:8d3:0:8a2e:70:7344','2021-02-15 11:20:04');
INSERT INTO Passwort_gehasht VALUES('youngPrez','9ce244cd2524cbc392f3e5aa426491c3','2001:db8::1428:57ab','2021-02-15 11:19:16');
COMMIT;
