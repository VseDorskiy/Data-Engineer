SELECT    Gehege.Bezeichnung as Gehege,
		  Gebaeude.GebaeudeID as 'Gebäude Nr.',
		  Gebaeude.Lage as 'Gebäude Lage',  
		  Gebaeude.Groesse_in_qm as 'Gebäudegröße in qm',
		  Gebaeude.Etagen as 'Anzahl der Etagen in Gebäude'
		

from Zuordnung_Gehege_Gebaeude
join Gehege on Gehege.GehegeID = Zuordnung_Gehege_Gebaeude.GehegeID
join Gebaeude on Gebaeude.GebaeudeID = Zuordnung_Gehege_Gebaeude.GebaeudeID;