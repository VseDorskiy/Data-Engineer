SELECT 
	Titel.Bezeichnung as Titel,
	Anrede.Bezeichnung as Anrede,
	Arzt.Vorname,
	Arzt.Nachname,
	Arzt.Strasse,
	Arzt.Hausnummer,
	Arzt.PLZ,
	Arzt.Ort,
	Arzt.Telefonnummer,
	Arzt.E_Mail
FROM Arzt
JOIN Titel on Titel.TitelID = Arzt.TitelID
JOIN Anrede on Anrede.AnredeID = Arzt.AnredeID
Join Land on Land.LandID = Arzt.LandID