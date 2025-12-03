SELECT distinct Arzt.Vorname as Arzt_Vorname,
	Arzt.Nachname as Arzt_Nachname,	
	Vertreter.Vorname as Vertreter_Vorname,
	Vertreter.Nachname as Vertreter_Nachname,
	--Tierart.TierartBezeichnung as Tierart,
	Beginn,
	Ende

from Zuordnung_Vertretung_Arzt
join Arzt on Arzt.ArztID = Zuordnung_Vertretung_Arzt.ArztID
join Arzt as Vertreter on Vertreter.ArztID =  Zuordnung_Vertretung_Arzt.VertretungsnummerArztID
JOIN Zuordnung_Arzt_Tier on Zuordnung_Arzt_Tier.ArztID = Arzt.ArztID
JOIN Tiere on Zuordnung_Arzt_Tier.TierID = Tiere.TierID
JOIN Tierart on Tierart.TierartID = Tiere.TierartID