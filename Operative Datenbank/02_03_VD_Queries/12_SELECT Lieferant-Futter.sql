select Lieferanten.Firmenname, Futter.Bezeichnung as Futter, Futterarten.Futterartbezeichnung as Futterart,
		Futter_Lieferanten.Menge, Einheit_Futtermenge.Bezeichnung as Einheit,
		Futter_Lieferanten.'Preis_(EK)_netto', 
		Futter_Lieferanten.Menge*Futter_Lieferanten.'Preis_(EK)_netto' as 'Gesamtpreis netto',
		Waehrung.Bezeichnung as 'Währung', Futter_Lieferanten.Datum as Lieferungsdatum
from Futter_Lieferanten

join Futter on Futter.FutterID = Futter_Lieferanten.FutterID
join Lieferanten on Lieferanten.LieferantenID = Futter_Lieferanten.LieferantenID
join Futterarten on Futterarten.FutterartID = Futter.FutterartID
join Einheit_Futtermenge on Einheit_Futtermenge.EinheitFuttermengeID = Futter_Lieferanten.EinheitFuttermengeID
join Waehrung on Waehrung.WaehrungID = Futter_Lieferanten.WaehrungID
WHERE Datum > '2023-05-01'
