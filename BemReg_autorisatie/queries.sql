-- 1. selecteer gewenste ZIN specificatie
SELECT *
  FROM Bemiddeling b1
     , ZorgInNatura z1
 WHERE b1.bemiddelingID = z1.bemiddelingID
   AND z1.zorgInNaturaID = "ZIN7"
   
-- 2. combineer met einddatum is leeg maar begindatum kleiner is dan de einddatum van geselecteerde (overlap met einde)
 UNION
SELECT *
  FROM Bemiddeling b1
     , ZorgInNatura z1
 WHERE b1.bemiddelingID = z1.bemiddelingID
   AND z1.bemiddelingID = (SELECT z2.bemiddelingID 
                             FROM ZorgInNatura z2 
                            WHERE z2.zorgInNaturaID = "ZIN7"
                          )
   AND z1.toewijzingEinddatum is NULL
   AND z1.toewijzingIngangsdatum <= (SELECT ifnull(z2.toewijzingEinddatum,date("9999-12-31")) as toewijzingEinddatum  
                                       FROM ZorgInNatura z2 
                                      WHERE z2.zorgInNaturaID = "ZIN7"
                                    )
-- 3. combineer met einddatum is groter dan de begin van geselecteerde (overlap met begin) maar niet na geselecteerde gestart						
 UNION
SELECT *
  FROM Bemiddeling b1
     , ZorgInNatura z1
 WHERE b1.bemiddelingID = z1.bemiddelingID
   AND z1.bemiddelingID = (SELECT z2.bemiddelingID 
                             FROM ZorgInNatura z2 
                            WHERE z2.zorgInNaturaID = "ZIN7"
                          )
   AND z1.toewijzingEinddatum >= (SELECT z2.toewijzingIngangsdatum
                                       FROM ZorgInNatura z2 
                                      WHERE z2.zorgInNaturaID = "ZIN7"
                                    )
   AND z1.toewijzingIngangsdatum <= (SELECT ifnull(z2.toewijzingEinddatum,date("9999-12-31")) as toewijzingEinddatum
                                       FROM ZorgInNatura z2 
                                      WHERE z2.zorgInNaturaID = "ZIN7"
                                    )	
 ;