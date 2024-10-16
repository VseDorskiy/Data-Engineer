select Gebaeude.GebaeudeID as 'Gebäude Nr.',
	   Gebaeude.Groesse_in_qm as 'Gebäudegröße in qm', 
	   Futter.Bezeichnung as Futter,
	   Futterarten.Futterartbezeichnung as Futterart,
	   Futterlager.Aktuellebestand,
	   Futterlager.Meldebestand,
	   Einheit_Futtermenge.Bezeichnung as Einheit,
	   Futterlager.Datum,
	   Futterlager.Uhrzeit
	   
FROM Futterlager
	   
join Gebaeude on Gebaeude.GebaeudeID = Futterlager.GebaeudeID
join Futter on Futter.FutterID = Futterlager.FutterID
join Futterarten on Futterarten.FutterartID = Futter.FutterartID
join Einheit_Futtermenge ON Einheit_Futtermenge.EinheitFuttermengeID = Futterlager.EinheitFuttermengeID