select Titel.Bezeichnung AS Titel, Anrede.Bezeichnung AS Anrede, Vorname, Nachname, Positionen.Bezeichnung AS Position,
		Mitarbeiter.Strasse, Hausnummer, Mitarbeiter.Ort, PLZ.PLZ 
		from Mitarbeiter
JOIN Titel On Titel.TitelID = Mitarbeiter.TitelID
JOIN Anrede on Anrede.AnredeID = Mitarbeiter.AnredeID
JOIN PLZ ON PLZ.PLZID = Mitarbeiter.PLZID
JOIN Positionen on Positionen.PositionID = Mitarbeiter.PositionID
