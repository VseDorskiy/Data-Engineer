SELECT Tiere.Tiername,
	Tierart.TierartBezeichnung as Tierart,
	Tiere.Geburtsdatum,
	Krankheitsfall.Behandlungsgrund,
	Krankheitsfall.Behandlungsdatum, 
	Krankheitsfall.Behandlung_abgeschlossen_am,
	Krankheitsfall.Medikation,	
	Titel.Bezeichnung as Titel, 
	Arzt.Vorname, 
	Arzt.Nachname
FROM Krankheitsfall
join Arzt on Arzt.ArztID = Krankheitsfall.ArztID
join Tiere on Tiere.TierID = Krankheitsfall.TierID
join Tierart on Tierart.TierartID = Tiere.TierartID
join Titel on Titel.TitelID = Arzt.TitelID

