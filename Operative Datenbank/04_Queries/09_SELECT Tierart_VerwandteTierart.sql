select 
	Tier.TierartBezeichnung as Tierart, 
	Verwandte.TierartBezeichnung as 'Verwandte Tierart'
from Zuordnung_Tierart_Tierart
join Tierart as Tier ON Tier.TierartID = Zuordnung_Tierart_Tierart.TierartID
join Tierart as Verwandte ON Verwandte.TierartID = Zuordnung_Tierart_Tierart.Verwandte_Arten