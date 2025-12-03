select Tiername, 
	Geschlecht_Tiere.Bezeichnung, 
	Groesse, Einheiten_Groesse_Tiere.Bezeichnung, 
	Gewicht, Einheiten_Gewicht_Tiere.Bezeichnung,
	Tierart.TierartBezeichnung, Gattung.GattungsBezeichnung
	from Tiere
join Geschlecht_Tiere on Geschlecht_Tiere.GeschlechtTierID  = Tiere.GeschlechtTierID 
join Einheiten_Groesse_Tiere on Einheiten_Groesse_Tiere.EinheitGroesseTierID = Tiere.EinheitGroesseTierID
join Einheiten_Gewicht_Tiere on Einheiten_Gewicht_Tiere.EinheitGewichtTierID = Tiere.EinheitGewichtTierID
join Tierart on Tierart.TierartID = Tiere.TierartID
join Gattung on Gattung.GattungID = Tierart.GattungID
