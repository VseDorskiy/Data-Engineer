/*
PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS Kunden_dim;
PRAGMA foreign_keys = ON;*/

---------------------------------Referenztabellen--------------------------------------------------

CREATE TABLE Einheiten_Gewicht_Tiere (
	EinheitGewichtTierID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Einheiten_Groesse_Tiere (
	EinheitGroesseTierID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Einheit_Futtermenge (
	EinheitFuttermengeID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Einheiten_Groesse_Gehege (
	EinheitGroesseGehegeID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Waehrung (
	WaehrungID                     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                    TEXT
);

CREATE TABLE Anrede (
	AnredeID 	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Titel (
	TitelID 	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT
);

CREATE TABLE Vertretungsgrund (
	VertretungsgrundID          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE MwSt (
	MwStSatzID                  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT,
    Wert                        REAL
);

CREATE TABLE Geschlecht_Mitarbeiter (
	GeschlechtMitarbeiterID     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE Geschlecht_Tiere (
	GeschlechtTierID            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE SozialerStatus (
	SozialerStatusID            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE Land (
	LandID                      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE PLZ (
	PLZID                       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Ort                         TEXT,
    Ortteil                     TEXT,
    PLZ                         TEXT
);

CREATE TABLE ja_nein (
	ja_neinID                   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

-----------------------------------------------------------------------------------------------------------------------

CREATE TABLE Infoblatt (
	InfoblattID 	        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	Bezeichnung	 	        TEXT,
    Anzahl_der_Blaetter     INTEGER
);

CREATE TABLE Rundweg (
	RundwegID 	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung	 	        TEXT,
    Barrierfrei             INTEGER NOT NULL,
    Laenge_in_meter         REAL,
    Geehdauer_in_minuten    INTEGER,
    InfoblattID             INTEGER NOT NULL,

FOREIGN KEY (InfoblattID) REFERENCES Infoblatt,
FOREIGN KEY (Barrierfrei) REFERENCES ja_nein(ja_neinID)
);

CREATE TABLE Gattung (
	GattungID 	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	GattungsBezeichnung	 	TEXT,
    Gattungs_info           TEXT
);

CREATE TABLE Tierart (
	TierartID 	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    TierartBezeichnung      TEXT,
	Lebensraum	 	        TEXT,
    Verhaltensweisen        TEXT,
    Abstammung              TEXT,
    --Verwandte_Arten         TEXT,
    GattungID               INTEGER NOT NULL,

FOREIGN KEY (GattungID) REFERENCES Gattung
);

CREATE TABLE Zuordnung_Tierart_Tierart (
	ZuordnungTierartTierartID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TierartID 	 	            INTEGER NOT NULL,
    Verwandte_Arten             INTEGER NOT NULL,               --------------------CHECK-----------------------
    
FOREIGN KEY (TierartID) REFERENCES Tierart (TierartID),
FOREIGN KEY (Verwandte_Arten) REFERENCES Tierart (TierartID)    --------------------CHECK-----------------------
);

CREATE TABLE Tierhistorie (
	TierhistorieID           	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TierID 	 	                INTEGER NOT NULL,
    Ort                         TEXT,
    LandID                      INTEGER NOT NULL,
    von                         NUMERIC,
    bis                         NUMERIC,

FOREIGN KEY (TierID) REFERENCES Tiere,
FOREIGN KEY (LandID) REFERENCES Land
);

CREATE TABLE Tiere (
	TierID                     	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Tiernummer 	                TEXT,
    Tiername                    TEXT,
    Groesse                     REAL,
    EinheitGroesseTierID        INTEGER NOT NULL,
    Gewicht                     REAL,
    EinheitGewichtTierID        INTEGER NOT NULL,
    Geburtsdatum                NUMERIC,
    Sterbedatum                 NUMERIC,
    im_Zoo_seit                 NUMERIC,
    im_Zoo_geboren              INTEGER NOT NULL,
    Vatertier                   INTEGER,
    Muttertier                  INTEGER,
    Bemerkung                   TEXT,
    GeschlechtTierID            INTEGER NOT NULL,
    TierartID                   INTEGER NOT NULL,

FOREIGN KEY (TierartID) REFERENCES Tierart,
FOREIGN KEY (GeschlechtTierID) REFERENCES Geschlecht_Tiere,
FOREIGN KEY (EinheitGroesseTierID) REFERENCES Einheiten_Groesse_Tiere,
FOREIGN KEY (EinheitGewichtTierID) REFERENCES Einheiten_Gewicht_Tiere,
FOREIGN KEY (im_Zoo_geboren) REFERENCES ja_nein (ja_neinID)
);

CREATE TABLE Inkompatibilitaeten (
	InkompatibilitaetenID       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    TierID_aktiv        	    INTEGER NOT NULL,
	TierID_passiv               INTEGER NOT NULL,
    Bemerkung                   TEXT,
    
FOREIGN KEY (TierID_aktiv) REFERENCES Tiere(TierID),   --------------------------CHECK-----------------------
FOREIGN KEY (TierID_passiv) REFERENCES Tiere(TierID)
);

----------------------------------------------------Arzt---------------------------------------------
CREATE TABLE Arzt (
	ArztID                  	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TitelID 	 	            INTEGER NOT NULL,
    AnredeID                    INTEGER NOT NULL,
    Vorname                     TEXT,
    Nachname                    TEXT,
    Strasse                     TEXT,
    Hausnummer                  TEXT,
    PLZ                         TEXT,
    Ort                         TEXT,
    LandID                      INTEGER NOT NULL,
    Telefonnummer               TEXT,
    E_Mail                      TEXT,
    Bemerkung                   TEXT,

FOREIGN KEY (TitelID) REFERENCES Titel,
FOREIGN KEY (AnredeID) REFERENCES Anrede,
FOREIGN KEY (LandID) REFERENCES Land
);

CREATE TABLE Zuordnung_Arzt_Tier (
	TierArztZuordnungID        	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ArztID 	 	                INTEGER NOT NULL,
    TierID                      INTEGER NOT NULL,

FOREIGN KEY (TierID) REFERENCES Tiere,
FOREIGN KEY (ArztID) REFERENCES Arzt
);

CREATE TABLE Zuordnung_Vertretung_Arzt (
	ZuordnungVertretungArztID 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    VertretungsnummerArztID     INTEGER NOT NULL,
	ArztID 	 	                INTEGER NOT NULL,
    Beginn                      NUMERIC,
    Ende                        NUMERIC,

FOREIGN KEY (ArztID) REFERENCES Arzt(ArztID),
FOREIGN KEY (VertretungsnummerArztID) REFERENCES Arzt(ArztID) -----------------------CHECK-------------------------------
);

CREATE TABLE Krankheitsfall (
	KrankheitsfallID                  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TierID 	 	                      INTEGER NOT NULL,
    Behandlungsgrund                  TEXT,
    Behandlungsdatum                  NUMERIC,
    Behandlung_bageschlossen_am       NUMERIC,
    meldepflichtige_Krankheit         INTEGER NOT NULL,
    Befund                            TEXT,
    Medikation                        TEXT,
    ArztID 	 	                      INTEGER NOT NULL,
    Bemerkung                         TEXT,


FOREIGN KEY (ArztID) REFERENCES Arzt,
FOREIGN KEY (TierID) REFERENCES Tier,
FOREIGN KEY (meldepflichtige_Krankheit) REFERENCES ja_nein (ja_neinID)
);

--------------------------Mitarbeiter-------------------------------------

CREATE TABLE Positionen (
	PositionID    	            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE Mitarbeiter (
	MitarbeiterID            	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	PositionID                  INTEGER NOT NULL,
    AnredeID                    INTEGER NOT NULL,
    TitelID                     INTEGER NOT NULL,
    GeschlechtMitarbeiterID     INTEGER NOT NULL,
    Vorname                     TEXT,
    Nachname                    TEXT,
    Strasse                     TEXT,   
    Hausnummer                  TEXT,
    PLZID                       INTEGER NOT NULL,
    Ort                         TEXT,
    NationalitaetID             INTEGER NOT NULL,
    Festnetznummer              TEXT,
    Handynummer                 TEXT,
    E_Mail                      TEXT,
    'Beschäftigt seit'          NUMERIC,
    Geburtsdatum                NUMERIC,
    Geburtsort                  TEXT,
    SozialerStatusID            INTEGER NOT NULL,
    Bemerkungen                 TEXT,

FOREIGN KEY (PositionID) REFERENCES Positionen,
FOREIGN KEY (AnredeID) REFERENCES Anrede,
FOREIGN KEY (TitelID) REFERENCES Titel,
FOREIGN KEY (GeschlechtMitarbeiterID) REFERENCES Geschlecht_Mitarbeiter,
FOREIGN KEY (NationalitaetID) REFERENCES Land(LandID),
FOREIGN KEY (SozialerStatusID) REFERENCES SozialerStatus
);

CREATE TABLE Zuordnung_Vertretung (
	VertretungsID               INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	MitarbeiterID               INTEGER NOT NULL,
    VertreterID                 INTEGER NOT NULL,
    VertretungsgrundID          INTEGER NOT NULL,
    Beginn                      NUMERIC,
    Ende                        NUMERIC,

FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
FOREIGN KEY (VertreterID) REFERENCES Mitarbeiter(MitarbeiterID),    --------------------CHECK----------------------------
FOREIGN KEY (VertretungsgrundID) REFERENCES Vertretungsgrund
);

CREATE TABLE Pflegetaetigkeit_Tier (
	Pflege_TierID                 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	MitarbeiterID                   INTEGER NOT NULL,
    TierID                          INTEGER NOT NULL,

FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter,
FOREIGN KEY (TierID) REFERENCES Tier
);

CREATE TABLE Pflegetaetigkeit_Tierart (
	Pflege_TierartID            INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	MitarbeiterID               INTEGER NOT NULL,
    TierartID                   INTEGER NOT NULL,

FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter,
FOREIGN KEY (TierartID) REFERENCES Tierart
);

---------------------------Gehege - Gebäude------------------------------------

CREATE TABLE GehegeArt (
	GehegeArtID                	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                 TEXT
);

CREATE TABLE Gehege (
	GehegeID                        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Bezeichnung                     TEXT,
    Wert_Groesse                    REAL,
	EinheitGroesseGehegeID          INTEGER NOT NULL,
    GehegeArtID                     INTEGER NOT NULL,
    Position                        TEXT,
    Bemerkung                       TEXT,

FOREIGN KEY (EinheitGroesseGehegeID) REFERENCES Einheiten_Groesse_Gehege,
FOREIGN KEY (GehegeArtID) REFERENCES GehegeArt
);

CREATE TABLE Zuordnung_Gehege_Tier (
	ZuordnungGehegeTierID       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	GehegeID                    INTEGER NOT NULL,
    TierID                      INTEGER NOT NULL,
    Beginn_Zeitraum             NUMERIC,
    Ende_Zeitraum               NUMERIC,
    Tag                         INTEGER NOT NULL,
    Nacht                       INTEGER NOT NULL,

FOREIGN KEY (GehegeID) REFERENCES Gehege,
FOREIGN KEY (TierID) REFERENCES Tier,
FOREIGN KEY (Tag) REFERENCES ja_nein(ja_neinID),
FOREIGN KEY (Nacht) REFERENCES ja_nein(ja_neinID)
);

CREATE TABLE Gebaeude (
	GebaeudeID                  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Etagen                      INTEGER,
    Lage                        TEXT,
    Groesse_in_qm               REAL
);

CREATE TABLE Zuordnung_Gehege_Gebaeude (
	ZuordnungGehegeGebaeudeID   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	GehegeID                    INTEGER NOT NULL,
    GebaeudeID                  INTEGER NOT NULL,

FOREIGN KEY (GehegeID) REFERENCES Gehege,
FOREIGN KEY (GebaeudeID) REFERENCES Gebaeude
);

CREATE TABLE Zuordnung_Gehege_Tier_Rundweg (
	ZuordnungGehegeTierRundwegID   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ZuordnungGehegeTierID          INTEGER NOT NULL,
    RundwegID                      INTEGER NOT NULL,
    
FOREIGN KEY (ZuordnungGehegeTierID) REFERENCES Zuordnung_Gehege_Tier,
FOREIGN KEY (RundwegID) REFERENCES RundwegID
);

------------------------Fuetterung und Futter-------------------------------------------
CREATE TABLE Futterarten (
    FutterartID                    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Futterartbezeichnung           TEXT
);


CREATE TABLE Mahlzeit (
	MahlzeitID                     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                    TEXT
);

CREATE TABLE Fuetterung (
	FuetterungID                   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	TierID                         INTEGER NOT NULL,
    MahlzeitID                     INTEGER NOT NULL,
    Datum                          NUMERIC,
    Uhrzeit                        NUMERIC,
    Erledigt                       INTEGER NOT NULL,  
    
FOREIGN KEY (TierID) REFERENCES Tier,
FOREIGN KEY (MahlzeitID) REFERENCES Mahlzeit,
FOREIGN KEY (Erledigt) REFERENCES ja_nein(ja_neinID)
);

CREATE TABLE Futter (
	FutterID                       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Bezeichnung                    TEXT,
    FutterartID                    INTEGER NOT NULL,

FOREIGN KEY (FutterartID) REFERENCES Futterarten
);

CREATE TABLE Mahlzeit_Futter (
	MahlzeitFutterID              INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    MahlzeitID                    INTEGER NOT NULL,
    FutterID                      INTEGER NOT NULL,
    Menge                         REAL,
    EinheitFuttermengeID          INTEGER NOT NULL,

FOREIGN KEY (MahlzeitID) REFERENCES Mahlzeit,
FOREIGN KEY (FutterID) REFERENCES Futter,
FOREIGN KEY (EinheitFuttermengeID) REFERENCES Einheit_Futtermenge
);

CREATE TABLE Lieferanten (
	LieferantenID                 INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Firmenname                    TEXT,
    Kontaktvorname                TEXT,
    Kontaktnachname               TEXT,
    Strasse                       TEXT,
    Hausnummer                    TEXT,
    PLZ                           TEXT,
    Stadt                         TEXT,
    LandID                        INTEGER NOT NULL,

FOREIGN KEY (LandID) REFERENCES Land
);

CREATE TABLE Futter_Lieferanten (
	Futter_LieferantenID          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FutterID                      INTEGER NOT NULL,
    LieferantenID                 INTEGER NOT NULL,
    Menge                         REAL,
    EinheitFuttermengeID          INTEGER NOT NULL,
    "Preis_(EK)_netto"            REAL,
    WaehrungID                    INTEGER NOT NULL,
    Bemerkung                     TEXT,
    Datum                         NUMERIC,
    RabattinProzent               REAL,
    
FOREIGN KEY (FutterID) REFERENCES Futter,
FOREIGN KEY (LieferantenID) REFERENCES Lieferanten,
FOREIGN KEY (EinheitFuttermengeID) REFERENCES Einheit_Futtermenge,
FOREIGN KEY (WaehrungID) REFERENCES Waehrung
);

CREATE TABLE Futterlager (
	Futter_LagerID                INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    GebaeudeID                    INTEGER NOT NULL,
    FutterID                      INTEGER NOT NULL,
    Aktuellebestand               REAL,
    Meldebestand                  REAL,
    EinheitFuttermengeID          INTEGER NOT NULL,
    Datum                         NUMERIC,
    Uhrzeit                       NUMERIC,
    
FOREIGN KEY (GebaeudeID) REFERENCES Gebaeude,
FOREIGN KEY (FutterID) REFERENCES Futter,
FOREIGN KEY (EinheitFuttermengeID) REFERENCES Einheit_Futtermenge
);