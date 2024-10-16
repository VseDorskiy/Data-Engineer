SELECT Tiere.Tiername,
	Tierart.TierartBezeichnung as Tierart,
	Ort, 
	Land.Bezeichnung as Land,
	von, 
	bis,
	Tiere.im_Zoo_seit,
	Krankheitsfall.Behandlungsgrund, Behandlungsdatum,Behandlung_abgeschlossen_am
FROM Tierhistorie
join Tiere on Tiere.TierID = Tierhistorie.TierID
join Land on Land.LandID = Tierhistorie.LandID
join Tierart on Tierart.TierartID = Tiere.TierartID
LEFT join Krankheitsfall on Krankheitsfall.TierID = Tiere.TierID
;