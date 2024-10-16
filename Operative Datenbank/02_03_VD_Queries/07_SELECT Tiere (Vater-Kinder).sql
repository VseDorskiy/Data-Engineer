SELECT Tier.Tiername as Vater, Tier.Geburtsdatum as 'Vater Geburtsdatum', 
	Kind.Tiername as Kind, Kind.Geburtsdatum as 'Kind Geburtsdatum', 
	Geschlecht_Tiere.Bezeichnung as 'Kind Geschlecht',
	Tierart.TierartBezeichnung as Tierart
	
from Tiere as Tier
join Tiere as Kind ON Tier.TierID = Kind.Vatertier
join Tierart on Tierart.TierartID = Kind.TierartID
join Geschlecht_Tiere on Geschlecht_Tiere.GeschlechtTierID = Kind.GeschlechtTierID