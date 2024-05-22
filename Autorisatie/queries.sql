--1a. Selecteer ZorgInNatura en geef bijbehorende ZIN specificaties obv ZinID
--Vraag een ZINspecificatie op obv ID en geef daarbij de overlappende ZorgInNatura onder dezelfde Bemiddeling.

-- n.b. SQLite ondersteund geen variabele vandaar dat ZorgInNaturaID op meer plekken moet worden ingevuld. Altijd dezelfde invullen

-- Vraag een ZINspecificatie op obv ID en geef daarbij de overlappende ZorgInNatura onder dezelfde Bemiddeling
-- n.b. SQLite ondersteund geen variabele vandaar dat ZorgInNaturaID op meer plekken moet worden ingevuld. Altijd dezelfde
--      dus kan vervangen worden door een variabele. 
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


-- 1b. Als 1a maar hou rekening met maximale inzagedatum en identificatie raadpleger.

 -- Vraag een ZINspecificatie op obv ID en geef daarbij de overlappende ZorgInNatura onder dezelfde Bemiddeling
-- n.b. SQLite ondersteund geen variabele vandaar dat ZorgInNaturaID op meer plekken moet worden ingevuld. Altijd dezelfde
--      dus kan vervangen worden door een variabele. 

-- 1. selecteer gewenste ZIN specificatie
SELECT *
     , date(strftime('%Y-06-01', z1.toewijzingEinddatum), '+1 year') as maxDate
  FROM Bemiddeling b1
     , ZorgInNatura z1
 WHERE b1.bemiddelingID = z1.bemiddelingID
   AND z1.zorgInNaturaID = "ZIN7"
-- AND (z1.instelling = 'ZA5' or z1.uitvoerendZorgkantoor = 'ZK12') -- ter controle, moet overeenkomen met raadpleger
-- 2. combineer met einddatum is leeg maar begindatum kleiner is dan de einddatum van geselecteerde (overlap met einde)
 UNION
SELECT *
     , date(strftime('%Y-06-01', z1.toewijzingEinddatum), '+1 year') as maxDate -- de maximale inzagedatum 
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
									 -- AND (z2.instelling = 'ZA5' or z2.uitvoerendZorgkantoor = 'ZK12') -- ter controle, moet overeenkomen met raadpleger
                                    )
-- 3. combineer met einddatum is groter dan de begin van geselecteerde (overlap met begin) maar niet na geselecteerde gestart						
 UNION
SELECT *
     , date(strftime('%Y-06-01', z1.toewijzingEinddatum), '+1 year') as maxDate -- de maximale inzagedatum
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
									 -- AND (z2.instelling = 'ZA5' or z2.uitvoerendZorgkantoor = 'ZK12') -- ter controle, moet overeenkomen met raadpleger
                                    )
   AND z1.toewijzingIngangsdatum <= (SELECT ifnull(z2.toewijzingEinddatum,date("9999-12-31")) as toewijzingEinddatum
                                       FROM ZorgInNatura z2 
                                      WHERE z2.zorgInNaturaID = "ZIN7"
									 -- AND (z2.instelling = 'ZA5' or z2.uitvoerendZorgkantoor = 'ZK12') -- ter controle, moet overeenkomen met raadpleger
                                    )
   AND maxDate >= date('now') -- hou rekening met het verstrijken van de inzage termijn
 ;


--2. Geef ZorgInNatura bij overdracht.
-- Geef alle bijbehorende specificaties op basis van een overdrachtID

SELECT *
  FROM Overdracht ov
	 , Overdrachtspecificatie ovs
	 , Bemiddeling bm
	 , Bemiddelingspecificatie zin
 WHERE ov.overdrachtID = "18c1f9a6-d6f9-4133-9c9a-2f88c1f25707" -- opgevraagde overdracht
--   AND ov.verantwoordelijkZorgkantoor = "ZK3" -- tbv autorisatiecontrole
   AND ov.overdrachtID = ovs.overdrachtID
   AND ovs.bemiddelingspecificatieID = zin.bemiddelingspecificatieID
   AND zin.bemiddelingID = bm.bemiddelingID
;