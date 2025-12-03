SELECT Tiere.Tiername, Tierart.TierartBezeichnung, count(Zuordnung_Arzt_Tier.ArztID) as 'Anzahl der Ärzte'
      --, Arzt.Vorname, Arzt.Nachname 
FROM Arzt

JOIN Zuordnung_Arzt_Tier on Zuordnung_Arzt_Tier.ArztID = Arzt.ArztID
JOIN Tiere on Zuordnung_Arzt_Tier.TierID = Tiere.TierID
JOIN Tierart on Tierart.TierartID = Tiere.TierartID
GROUP BY Tiere.Tiername