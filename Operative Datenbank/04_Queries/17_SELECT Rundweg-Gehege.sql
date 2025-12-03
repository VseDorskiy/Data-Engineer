select distinct
 Rundweg.Bezeichnung as Rundweg,
 ja_nein.Bezeichnung as Barrierfrei,
 Rundweg.Laenge_in_meter as 'Länge in m',
 Rundweg.Geehdauer_in_minuten as 'Gehdauer in min',
 Gehege.Bezeichnung as 'Gehege'
	

from Zuordnung_Gehege_Tier_Rundweg

join Rundweg on Rundweg.RundwegID = Zuordnung_Gehege_Tier_Rundweg.RundwegID
join Zuordnung_Gehege_Tier on  Zuordnung_Gehege_Tier.ZuordnungGehegeTierID = Zuordnung_Gehege_Tier_Rundweg.ZuordnungGehegeTierID
join Gehege on Gehege.GehegeID = Zuordnung_Gehege_Tier.GehegeID
join ja_nein on ja_nein.ja_neinID = Rundweg.Barrierfrei