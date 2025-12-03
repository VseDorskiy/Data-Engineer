SELECT distinct 
		--Aktiv.Tiername as Tier1,
		Aktiv_Tierart.TierartBezeichnung As 'Tierart1',
		--Passiv.Tiername as Tier2,
		Passiv_Tierart.TierartBezeichnung As 'Tierart2'
		
from Inkompatibilitaeten
join Tiere as Passiv on Passiv.TierID = Inkompatibilitaeten.TierID_passiv
join Tiere as Aktiv on  Aktiv.TierID = Inkompatibilitaeten.TierID_aktiv
join Tierart as Aktiv_Tierart on Aktiv_Tierart.TierartID = Aktiv.TierartID
join Tierart as Passiv_Tierart on Passiv_Tierart.TierartID = Passiv.TierartID;
