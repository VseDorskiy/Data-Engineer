SELECT --Mitarbeiter.Vorname, Mitarbeiter.Nachname, Positionen.Bezeichnung,
	Tiere.Tiername, Tierart.TierartBezeichnung, count(Mitarbeiter.MitarbeiterID) as 'Anzahl der Mitarbeiter'
from Pflegetaetigkeit_Tier
join Mitarbeiter on Mitarbeiter.MitarbeiterID = Pflegetaetigkeit_Tier.MitarbeiterID
join Tiere on Tiere.TierID = Pflegetaetigkeit_Tier.TierID
Join Tierart on Tierart.TierartID = Tiere.TierartID
join Positionen on Positionen.PositionID  = Mitarbeiter.PositionID
group by Tiere.Tiername
order by count(Mitarbeiter.MitarbeiterID) DESC