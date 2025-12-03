select distinct --Tiere.Tiername, Tierart.TierartBezeichnung, Gattung.GattungsBezeichnung,
Mahlzeit.Bezeichnung as Futtermischung, Mahlzeit_Futter.Menge, Einheit_Futtermenge.Bezeichnung as Einheit, 
Futter.Bezeichnung as Futter, Futterarten.Futterartbezeichnung as Futterart
from Fuetterung

JOIN Tiere on Tiere.TierID = Fuetterung.TierID
JOIN Mahlzeit on Mahlzeit.MahlzeitID = Fuetterung.MahlzeitID
Join Tierart on Tierart.TierartID = Tiere.TierartID
join Mahlzeit_Futter on Mahlzeit_Futter.MahlzeitID = Mahlzeit.MahlzeitID
join Einheit_Futtermenge on Einheit_Futtermenge.EinheitFuttermengeID = Mahlzeit_Futter.EinheitFuttermengeID
join Gattung on Gattung.GattungID = Tierart.GattungID
join Futter on Futter.FutterID = Mahlzeit_Futter.FutterID
join Futterarten on Futterarten.FutterartID = Futter.FutterartID
WHERE Gattung.GattungsBezeichnung LIKE '%Großkatzen'