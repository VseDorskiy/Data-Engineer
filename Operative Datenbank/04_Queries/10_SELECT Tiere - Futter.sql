select distinct Tiere.Tiername, Tierart.TierartBezeichnung as Tierart, 
Mahlzeit.Bezeichnung as Futter--Mahlzeit_Futter.Menge, Einheit_Futtermenge.Bezeichnung
from Tiere

JOIN Fuetterung on Tiere.TierID = Fuetterung.TierID
JOIN Mahlzeit on Mahlzeit.MahlzeitID = Fuetterung.MahlzeitID
Join Tierart on Tierart.TierartID = Tiere.TierartID
join Mahlzeit_Futter on Mahlzeit_Futter.MahlzeitID = Mahlzeit.MahlzeitID
join Einheit_Futtermenge on Einheit_Futtermenge.EinheitFuttermengeID = Mahlzeit_Futter.EinheitFuttermengeID
