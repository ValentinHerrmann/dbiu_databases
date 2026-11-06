The following Databases are based on [datenbanken-im-unterricht.de](https://www.datenbanken-im-unterricht.de/catalog.php) / [dbiu.de](https://www.dbiu.de/).





### Available SQLite Databases

The following SQLite databases are available in the respective version of [this package](https://pypi.org/project/dbiu_databases).
and can be used in [sql_testing_tools](https://pypi.org/project/sql-testing-tools/) by calling Ba.setBaseName with `"dbiu.basename"` or number (`1` to `19`).

Each database section below shows the UML class diagram (PNG/SVG download, Mermaid source) and one-line table schemes following the course conventions (primary keys underlined, foreign keys under-dotted).

Each database section below shows the UML class diagram (PNG/SVG download, Mermaid source) and one-line table schemes following the course conventions (primary keys underlined, foreign keys under-dotted).

Each database section below shows the UML class diagram (PNG/SVG download, Mermaid source) and one-line table schemes following the course conventions (primary keys underlined, foreign keys under-dotted).

If used in other contexts, the database files can be accessed with `importlib.resources.path('dbiu_databases', 'base.db')` after installing the correct version of the module.


1. `dbiu.bahn`: https://www.dbiu.de/bahn
2. `dbiu.bayern`: https://www.dbiu.de/bayern
3. `dbiu.bundestag`: https://www.datenbanken-im-unterricht.de/downloads/bundestag.zip
4. `dbiu.bundestag_einfach`: https://www.dbiu.de/bundestagsmitglieder
5. `dbiu.film_fernsehen`: https://www.dbiu.de/filmundfernsehen
6. `dbiu.haushaltsausstattung`: https://www.dbiu.de/haushaltsausstattung
7. `dbiu.straftaten`: https://www.datenbanken-im-unterricht.de/downloads/kriminalstatistik-erweitert.zip
8. `dbiu.straftaten_einfach`: https://www.dbiu.de/kriminalstatistik
9. `dbiu.kunstsammlung`: https://www.dbiu.de/kunstsammlung
10. `dbiu.ladepunkte`: https://www.dbiu.de/ladepunkte
11. `dbiu.laenderspiele`: https://www.dbiu.de/laenderspiele
12. `dbiu.lebensmittel`: https://www.dbiu.de/lebensmittel
13. `dbiu.schulstatistik`: https://www.dbiu.de/schulstatistik
14. `dbiu.studierende`: https://www.dbiu.de/studierende
15. `dbiu.unfallstatistik`: https://www.dbiu.de/unfallstatistik
16. `dbiu.videospiele_einfach`: https://www.dbiu.de/videospiele
17. `dbiu.videospiele`: https://www.dbiu.de/videospiele2
18. `dbiu.wetterdaten`: https://www.dbiu.de/wetterdaten
19. `dbiu.terra`: https://terra.sachsen.schule/ (not by dbiu; base on `Dürr, M., Radermacher, K.: "Einsatz von Datenbanksystemen - Ein Leitfaden für die Praxis". Berlin u.a.: Springer-Verlag 1990.`)

#### Database in version: 1 - dbiu.bahn

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bahn.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bahn.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bahn_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bahn_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bahn.png" alt="UML bahn" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Bahnhof(int b̲a̲h̲n̲h̲o̲f̲_̲n̲r̲, String bundesland, String name, String abkuerzung, int kategorie, String strasse, String plz, String ort, String aufgabentraeger)
Betriebsstelle(int i̲d̲, int strecke_nr, int richtung, int km_i, String km_l, String bezeichnung, String art, String kuerzel)
Bruecke(int i̲d̲, int strecke_nr, int richtung, int von_km_i, int bis_km_i, String von_km_l, String bis_km_l, float laenge)
Streckenabschnitt(int i̲d̲, int strecke_nr, int richtung, float laenge, int von_km_i, int bis_km_i, String von_km_l, String bis_km_l, String elektrifizierung, String bahnnutzung, String geschwindigkeit, String strecke_ku, String gleisanzahl, String bahnart)
Tunnel(int i̲d̲, int strecke_nr, int richtung, int von_km_i, int bis_km_i, String von_km_l, String bis_km_l, float laenge, String bezeichnung)
```


#### Database in version: 2 - dbiu.bayern

**UML (m:n direkt):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_mn.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_mn.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_mn_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_mn_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_mn.png" alt="UML bayern_mn" style="max-width: 100%;"/>

**UML (m:n mit Beziehungstabelle):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_1n-1n.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_1n-1n.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_1n-1n_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_1n-1n_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bayern_1n-1n.png" alt="UML bayern_1n-1n" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Freizeitpark(int i̲d̲, String name, String g̣ẹṃẹịṇḍẹṣc̣ḥḷụẹṣṣẹḷ, String strasse, String url, float breitengrad, float laengengrad)
Gemeinde(String s̲c̲h̲l̲u̲e̲s̲s̲e̲l̲, String regierungsbezirk, String kreis, String name, String zusatz, String plz, float flaeche, int einwohner_m, int einwohner_w)
Nachbargemeinde(String g̲̣e̲̣m̲̣e̲̣i̲̣n̲̣d̲̣e̲̣s̲̣c̲̣h̲̣l̲̣u̲̣e̲̣s̲̣s̲̣e̲̣l̲̣_̲̣1̲̣, String g̲̣e̲̣m̲̣e̲̣i̲̣n̲̣d̲̣e̲̣s̲̣c̲̣h̲̣l̲̣u̲̣e̲̣s̲̣s̲̣e̲̣l̲̣_̲̣2̲̣)
Radweg(String r̲a̲d̲w̲e̲g̲_̲i̲d̲, String name)
Radweg_zu_Gemeinde(String r̲̣a̲̣d̲̣w̲̣e̲̣g̲̣_̲̣i̲̣d̲̣, String g̲̣e̲̣m̲̣e̲̣i̲̣n̲̣d̲̣e̲̣s̲̣c̲̣h̲̣l̲̣u̲̣e̲̣s̲̣s̲̣e̲̣l̲̣)
Schwimmbad(int i̲d̲, String name, String art, String g̣ẹṃẹịṇḍẹṣc̣ḥḷụẹṣṣẹḷ, String strasse, String url, float breitengrad, float laengengrad)
Wanderweg(String w̲a̲n̲d̲e̲r̲w̲e̲g̲_̲i̲d̲, String name)
Wanderweg_zu_Gemeinde(String w̲̣a̲̣n̲̣d̲̣e̲̣r̲̣w̲̣e̲̣g̲̣_̲̣i̲̣d̲̣, String g̲̣e̲̣m̲̣e̲̣i̲̣n̲̣d̲̣e̲̣s̲̣c̲̣h̲̣l̲̣u̲̣e̲̣s̲̣s̲̣e̲̣l̲̣)
Zoo(int i̲d̲, String name, String g̣ẹṃẹịṇḍẹṣc̣ḥḷụẹṣṣẹḷ, String strasse, String url, float breitengrad, float laengengrad)
```


#### Database in version: 3 - dbiu.bundestag

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag.png" alt="UML bundestag" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Mandat(int m̲̣d̲̣b̲̣_̲̣i̲̣d̲̣, int w̲̣a̲̣h̲̣l̲̣p̲̣e̲̣r̲̣i̲̣o̲̣d̲̣e̲̣_̲̣i̲̣d̲̣, String liste)
MdB(int i̲d̲, String partei, String nachname, String vorname, Date geburtsdatum, Date sterbedatum, String geschlecht, String familienstand, String religion, String beruf)
Wahlperiode(int i̲d̲, Date von, Date bis)
```


#### Database in version: 4 - dbiu.bundestag_einfach

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag_einfach.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag_einfach.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/bundestag_einfach.png" alt="UML bundestag_einfach" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Bundestag(int i̲d̲, String vorname, String nachname, String geschlecht, Date geburtsdatum, String beruf, String partei, String liste)
```


#### Database in version: 5 - dbiu.film_fernsehen

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/film_fernsehen.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/film_fernsehen.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/film_fernsehen_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/film_fernsehen_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/film_fernsehen.png" alt="UML film_fernsehen" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Film(String i̲d̲, String titel, int jahr, int laufzeit, String regisseur, String genre1, String genre2, int fsk)
Serie(String i̲d̲, String titel, String originalsprache, String sender, int startjahr, int endjahr, int staffeln, int episoden)
```


#### Database in version: 6 - dbiu.haushaltsausstattung

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/haushaltsausstattung.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/haushaltsausstattung.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/haushaltsausstattung.png" alt="UML haushaltsausstattung" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Haushaltsausstattung(String a̲u̲s̲s̲t̲a̲t̲t̲u̲n̲g̲, int j̲a̲h̲r̲, float prozent)
```


#### Database in version: 7 - dbiu.straftaten

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten.png" alt="UML straftaten" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Straftat(String s̲c̲h̲l̲u̲e̲s̲s̲e̲l̲, String typ, String oberkategorie, String unterkategorie, String bezeichnung)
Bevoelkerung(int i̲d̲, String bundesland, String geschlecht, String nationalitaet, int anzahl)
Faelle(int i̲d̲, String ṣṭṛạf̣ṭạṭ_̣ṣc̣ḥḷụẹṣṣẹḷ, String bundesland, int anzahl, int versuche, int tatort_klein, int tatort_gross, int mit_schusswaffeneinsatz, int aufgeklaert)
Opfer(int i̲d̲, String ṣṭṛạf̣ṭạṭ_̣ṣc̣ḥḷụẹṣṣẹḷ, String bundesland, int altersgruppe_von, int altersgruppe_bis, String geschlecht, int anzahl)
Tatverdaechtige(int i̲d̲, String ṣṭṛạf̣ṭạṭ_̣ṣc̣ḥḷụẹṣṣẹḷ, String bundesland, int altersgruppe_von, int altersgruppe_bis, String geschlecht, String nationalitaet, int anzahl)
```


#### Database in version: 8 - dbiu.straftaten_einfach

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten_einfach.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten_einfach.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/straftaten_einfach.png" alt="UML straftaten_einfach" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Straftaten(String s̲c̲h̲l̲u̲e̲s̲s̲e̲l̲, String typ, String oberkategorie, String unterkategorie, String bezeichnung, int anzahl, int versuche, int tatort_klein, int tatort_gross, int mit_schusswaffeneinsatz, int aufgeklaert, int tatverdaechtige_m, int tatverdaechtige_w, int davon_nichtdeutsche)
```


#### Database in version: 9 - dbiu.kunstsammlung

**UML (m:n direkt):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_mn.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_mn.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_mn_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_mn_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_mn.png" alt="UML kunstsammlung_mn" style="max-width: 100%;"/>

**UML (m:n mit Beziehungstabelle):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_1n-1n.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_1n-1n.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_1n-1n_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_1n-1n_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/kunstsammlung_1n-1n.png" alt="UML kunstsammlung_1n-1n" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Ausstellung(int i̲d̲, String stadt, String ausstellungsort, String titel, Date von, Date bis)
Kuenstler(int i̲d̲, String vorname, String nachname, String geburtsort, int geburtsjahr, int sterbejahr)
Kunstwerk(int i̲d̲, String inventarnr, String titel, String jahr, String material, int hoehe, int breite, int tiefe)
Kunstwerk_zu_Ausstellung(int k̲̣u̲̣n̲̣s̲̣t̲̣w̲̣e̲̣r̲̣k̲̣_̲̣i̲̣d̲̣, int a̲̣u̲̣s̲̣s̲̣t̲̣e̲̣l̲̣l̲̣u̲̣n̲̣g̲̣_̲̣i̲̣d̲̣)
Kunstwerk_zu_Kuenstler(int k̲̣u̲̣n̲̣s̲̣t̲̣w̲̣e̲̣r̲̣k̲̣_̲̣i̲̣d̲̣, int k̲̣u̲̣e̲̣n̲̣s̲̣t̲̣l̲̣e̲̣r̲̣_̲̣i̲̣d̲̣)
```


#### Database in version: 10 - dbiu.ladepunkte

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/ladepunkte.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/ladepunkte.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/ladepunkte_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/ladepunkte_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/ladepunkte.png" alt="UML ladepunkte" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Ladesaeule(int i̲d̲, int ṣṭạṭịọṇ_̣ịḍ, String art, Date inbetriebnahme, float breitengrad, float laengengrad)
Ladestation(int i̲d̲, String betreiber, String adresse, String ort, String plz, String landkreis, String bundesland)
Ladesteckdose(int i̲d̲, int ṣạẹụḷẹ_̣ịḍ, String typ, float leistung)
```


#### Database in version: 11 - dbiu.laenderspiele

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/laenderspiele.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/laenderspiele.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/laenderspiele.png" alt="UML laenderspiele" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Laenderspiele(int i̲d̲, Date datum, String heim_team, String gast_team, int heim_tore, int gast_tore, String turnier, String stadt, String land)
```


#### Database in version: 12 - dbiu.lebensmittel

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/lebensmittel.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/lebensmittel.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/lebensmittel.png" alt="UML lebensmittel" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Naehrwert(int i̲d̲, String name, String kategorie, int kilokalorien, float proteine, float wasser, float kohlenhydrate, float zucker, float ballaststoffe, float fette)
```


#### Database in version: 13 - dbiu.schulstatistik

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/schulstatistik.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/schulstatistik.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/schulstatistik.png" alt="UML schulstatistik" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Schulstatistik(String g̲e̲m̲e̲i̲n̲d̲e̲s̲c̲h̲l̲u̲e̲s̲s̲e̲l̲, int s̲c̲h̲u̲l̲j̲a̲h̲r̲_̲s̲t̲a̲r̲t̲, String s̲c̲h̲u̲l̲a̲r̲t̲, String gemeindename, int schulen, int lehrkraefte, int klassen, int schueler, int unterrichtswochenstunden)
```


#### Database in version: 14 - dbiu.studierende

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/studierende.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/studierende.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/studierende_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/studierende_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/studierende.png" alt="UML studierende" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Studiengang(String s̲c̲h̲l̲u̲e̲s̲s̲e̲l̲, String beschreibung)
Studierende(String s̲̣t̲̣u̲̣d̲̣i̲̣e̲̣n̲̣g̲̣a̲̣n̲̣g̲̣_̲̣s̲̣c̲̣h̲̣l̲̣u̲̣e̲̣s̲̣s̲̣e̲̣l̲̣, int j̲a̲h̲r̲, int deutsch_m, int deutsch_w, int auslaendisch_m, int auslaendisch_w)
```


#### Database in version: 15 - dbiu.unfallstatistik

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/unfallstatistik.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/unfallstatistik.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/unfallstatistik.png" alt="UML unfallstatistik" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Unfaelle(String v̲e̲r̲k̲e̲h̲r̲s̲b̲e̲t̲e̲i̲l̲i̲g̲u̲n̲g̲, String f̲e̲h̲l̲v̲e̲r̲h̲a̲l̲t̲e̲n̲, int j̲a̲h̲r̲, int anzahl)
```


#### Database in version: 16 - dbiu.videospiele_einfach

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_einfach.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_einfach.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_einfach.png" alt="UML videospiele_einfach" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Videospiel(String i̲d̲, String titel, Date veroeffentlichung, String land, int usk)
```


#### Database in version: 17 - dbiu.videospiele

**UML (m:n direkt):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_mn.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_mn.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_mn.png" alt="UML videospiele_mn" style="max-width: 100%;"/>

**UML (m:n mit Beziehungstabelle):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_1n-1n.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_1n-1n.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_1n-1n_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_1n-1n_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/videospiele_1n-1n.png" alt="UML videospiele_1n-1n" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Format(String i̲d̲, String beschreibung)
Genre(String i̲d̲, String beschreibung)
Plattform(String i̲d̲, String beschreibung)
Videospiel(String i̲d̲, String titel, Date veroeffentlichung, String land, int usk)
Videospiel_zu_Plattform(String s̲̣p̲̣i̲̣e̲̣l̲̣_̲̣i̲̣d̲̣, String p̲̣l̲̣a̲̣t̲̣t̲̣f̲̣o̲̣r̲̣m̲̣_̲̣i̲̣d̲̣)
Videospiel_zu_Genre(String s̲̣p̲̣i̲̣e̲̣l̲̣_̲̣i̲̣d̲̣, String g̲̣e̲̣n̲̣r̲̣e̲̣_̲̣i̲̣d̲̣)
Videospiel_zu_Format(String s̲̣p̲̣i̲̣e̲̣l̲̣_̲̣i̲̣d̲̣, String f̲̣o̲̣r̲̣m̲̣a̲̣t̲̣_̲̣i̲̣d̲̣)
```


#### Database in version: 18 - dbiu.wetterdaten

**UML:** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/wetterdaten.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/wetterdaten.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/wetterdaten.png" alt="UML wetterdaten" style="max-width: 100%;"/>

**Tabellenschema:**

```text
Wettermessung(Date d̲a̲t̲u̲m̲, String s̲t̲a̲n̲d̲o̲r̲t̲, float sonnenscheindauer, float niederschlagshoehe, float luftdruck, float windstaerke, float breitengrad, float laengengrad)
```


#### Database in version: 19 - dbiu.terra

**UML (m:n direkt):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_mn.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_mn.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_mn_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_mn_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_mn.png" alt="UML terra_mn" style="max-width: 100%;"/>

**UML (m:n mit Beziehungstabelle):** [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_1n-1n.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_1n-1n.pdf) · Hochformat: [PNG](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_1n-1n_portrait.png) · [PDF](https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_1n-1n_portrait.pdf)

<img src="https://raw.githubusercontent.com/ValentinHerrmann/dbiu_databases/main/dbiu_databases/terra_1n-1n.png" alt="UML terra_1n-1n" style="max-width: 100%;"/>

**Tabellenschema:**

```text
aufgaben(int i̲d̲, String aufgabe, String loesung, int schwierigkeit, String hinweis)
BERG(String B̲_̲N̲A̲M̲E̲, String GEBIRGE, float HOEHE, int JAHR, float LAENGE, float BREITE)
EBENE(String E̲_̲N̲A̲M̲E̲, float HOEHE, float FLAECHE)
FLUSS(String F̲_̲N̲A̲M̲E̲, String FLUSS, String ṢẸẸ, String ṂẸẸṚ, int LAENGE, float LAENGEU, float BREITEU, float LAENGEM, float BREITEM)
GEHT_UEBER_IN(String ṂẸẸṚ1̣, String ṂẸẸṚ2̣)
GEO_BERG(int i̲d̲, String Ḷ_̣ỊḌ, String LT_ID, String Ḅ_̣ṆẠṂẸ)
GEO_EBENE(String LT_ID, String Ḷ_̣ỊḌ, String Ẹ_̣ṆẠṂẸ)
GEO_FLUSS(int i̲d̲, String Ḷ_̣ỊḌ, String LT_ID, String F̣_̣ṆẠṂẸ)
GEO_INSEL(String LT_ID, String Ḷ_̣ỊḌ, String Ị_̣ṆẠṂẸ)
GEO_MEER(int i̲d̲, String LT_ID, String Ḷ_̣ỊḌ, String Ṃ_̣ṆẠṂẸ)
GEO_SEE(int i̲d̲, String LT_ID, String Ḷ_̣ỊḌ, String S_NAME)
GEO_WUESTE(String LT_ID, String Ḷ_̣ỊḌ, String Ẉ_̣ṆẠṂẸ)
HAT_SITZ_IN(String ṢṬ_̣ṆẠṂẸ, String LT_ID, String Ḷ_̣ỊḌ, String ẠḄḲỤẸṚẒỤṆG̣)
INSEL(String I̲_̲N̲A̲M̲E̲, String INSELGRUPPE, float FLAECHE, float LAENGE, float BREITE)
IST_BENACHBART_ZU(int i̲d̲, String ḶẠṆḌ1̣, String ḶẠṆḌ2̣)
IST_MITGLIED_VON(String Ḷ_̣ỊḌ, String ẠḄḲỤẸṚẒỤṆG̣, String ART)
KONTINENT(String K̲_̲N̲A̲M̲E̲, float FLAECHE)
LAND(String L̲_̲I̲D̲, String L_NAME, float EINWOHNER, float FLAECHE, String HAUPTSTADT, String LT_ID)
LANDTEIL(int i̲d̲, String LT_ID, String Ḷ_̣ỊḌ, String LT_NAME, float EINWOHNER, String LAGE, String HAUPTSTADT)
LIEGT_AN(int i̲d̲, String ṢṬ_̣ṆẠṂẸ, String LT_ID, String Ḷ_̣ỊḌ, String F̣_̣ṆẠṂẸ, String Ṣ_̣ṆẠṂẸ, String Ṃ_̣ṆẠṂẸ)
MEER(String M̲_̲N̲A̲M̲E̲, float TIEFE)
ORGANISATION(int i̲d̲, String O_NAME, String ABKUERZUNG)
SEE(String S̲_̲N̲A̲M̲E̲, float TIEFE, float FLAECHE)
STADT(String S̲T̲_̲N̲A̲M̲E̲, String Ḷ_̣ỊḌ, String LT_ID, int EINWOHNER, float BREITE, float LAENGE)
UMFASST(int i̲d̲, String Ḷ_̣ỊḌ, String Ḳ_̣ṆẠṂẸ, float PROZENT)
WUESTE(int i̲d̲, String W_NAME, float FLAECHE, String WUESTENART)
```
