select Mitarbeiter.Vorname as Mitarbeiter_Vorname,
	Mitarbeiter.Nachname as Mitarbeiter_Nachname,
	Vertreter.Vorname as Vertreter_Vorname,	 
	Vertreter.Nachname as Vertreter_Nachname,
	Vertretungsgrund.Bezeichnung as Vertretungsgrund,
	Beginn,
	Ende
from Zuordnung_Vertretung
join Mitarbeiter on Mitarbeiter.MitarbeiterID = Zuordnung_Vertretung.MitarbeiterID
join Mitarbeiter as Vertreter on Vertreter.MitarbeiterID = Zuordnung_Vertretung.VertreterID
join Vertretungsgrund on Vertretungsgrund.VertretungsgrundID = Zuordnung_Vertretung.VertretungsgrundID