# TEST-queries en data voor Bemiddelingsregister

repo voor het testen van sql-queries op het bemiddelingsregsiter. 

- [TEST-queries en data voor Bemiddelingsregister](#test-queries-en-data-voor-bemiddelingsregister)
  - [Database](#database)
  - [ERD](#erd)
  - [Testdata](#testdata)
    - [Client](#client)
    - [Bemiddeling](#bemiddeling)
    - [ZorgInNatura](#zorginnatura)
      - [schematisch](#schematisch)
    - [Overdracht](#overdracht)
    - [Overdrachtspecificatie](#overdrachtspecificatie)
  - [Queries](#queries)
      - [1a. Selecteer ZorgInNatura en geef bijbehorende ZIN specificaties obv ZinID](#1a-selecteer-zorginnatura-en-geef-bijbehorende-zin-specificaties-obv-zinid)
      - [1b. Als 1a maar hou rekening met maximale inzagedatum en identificatie raadpleger.](#1b-als-1a-maar-hou-rekening-met-maximale-inzagedatum-en-identificatie-raadpleger)
      - [2. Geef ZorgInNatura bij overdracht.](#2-geef-zorginnatura-bij-overdracht)


## Database
De data zit in een Sqlite database. De data zit dus in een single-file: **[Dummy_BemReg.sqlite](Dummy_BemReg.sqlite)**. Er hoeft dus geen server gedraaid te worden of andere runtimes geinstalleerd. Er is enkel een tool nodig om de file te openen en een mogelijkheid om queries tegenaan te draaien. 

De data is te benaderen en queries uitvoeren dmv 
- DB Browser for SQLite [hier te vinden](https://sqlitebrowser.org) 
- Visual Studio Code met extensions: [VSC](https://code.visualstudio.com) + extensions [sqlite viewer](https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer) en [sqlite](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)


Meer informatie over SQLite is [hier (Official site)](https://www.sqlite.org/index.html) of [hier (SQLite tutorial)](https://www.sqlitetutorial.net) te vinden.

## ERD

zie [informatiemodel](https://informatiemodel.istandaarden.nl/iWlz-Bemiddeling-1/) onder registers.

Van elke entiteit zijn alleen de voor dit doel relevante attributen opgenomen. 

## Testdata
De database bevat de volgende testdata

### Client
| clientID | bsn  |
|----------|------|
| C1       | bsn1 |

### Bemiddeling
| bemiddelingID | clientID | verant.ZK | verant.Ingangsdatum | verantw.Einddatum |
|---------------|----------|-----------|---------------------|-------------------|
| BEM1          | C1       | ZK1       | 2022-01-01          |                   |
| BEM2          | C1       | ZK3       | 2022-01-01          | 2022-12-31        |

### ZorgInNatura
| zorgInNaturaID | bemiddelingID | toewijzingIngangsdatum | instelling | uitvoerendZorgkantoor | vaststellingMoment | toewijzingEinddatum |
|----------------|---------------|------------------------|------------|-----------------------|--------------------|---------------------|
| ZIN1           | BEM1          | 2023-01-01             | ZA1        | ZK1                   | 2023-07-01         | 2023-11-30          |
| ZIN2           | BEM1          | 2023-01-01             | ZA2        | ZK1                   | 2023-01-01         | 2023-06-30          |
| ZIN3           | BEM1          | 2023-01-01             | ZA3        | ZK2                   | 2023-01-01         |                     |
| ZIN4           | BEM2          | 2022-01-01             | ZA4        | ZK1                   | 2022-01-01         | 2022-12-31          |
| ZIN5           | BEM1          | 2023-12-01             | ZA5        | ZK1                   | 2023-12-01         |                     |
| ZIN6           | BEM1          | 2022-01-01             | ZA1        | ZK1                   | 2022-01-01         | 2022-12-31          |
| ZIN7           | BEM1          | 2022-01-01             | ZA5        | ZK1                   | 2022-01-01         | 2023-03-31          |
| ZIN8           | BEM2          | 2022-01-01             | ZA6        | ZK1                   | 2022-01-01         | 2022-12-31          |

#### schematisch
| 2022-Q4 | 2023-Q1 | 2023-Q2 | 2023-Q3 | 2023-Q4 | 2024-Q1 |  oo  |
|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:----:|
|         |         |         |   ZIN1  |   ZIN1  |         |      |
|         |   ZIN2  |   ZIN2  |         |         |         |      |
|         |   ZIN3  |   ZIN3  |   ZIN3  |   ZIN3  |   ZIN3  | ZIN3 |
|   ZIN4  |         |         |         |         |         |      |
|         |         |         |         |         |   ZIN5  | ZIN5 |
|   ZIN6  |         |         |         |         |         |      |
|   ZIN7  |   ZIN7  |         |         |         |         |      |
|   ZIN8  |         |         |         |         |         |      |

### Overdracht
| overdrachtID | verantwoordelijkZorgkantoor | bemiddelingID |
|--------------|-----------------------------|---------------|
| OV1          | ZK3                         | BEM2          |

### Overdrachtspecificatie
| overdrachtspecificatieID | overdrachtID | zorgInNaturaID |
|--------------------------|--------------|----------------|
| OVS1                     | OV1          | ZIN4           |
| OVS2                     | OV1          | ZIN8           |

## Queries
#### 1a. Selecteer ZorgInNatura en geef bijbehorende ZIN specificaties obv ZinID
Vraag een ZINspecificatie op obv ID en geef daarbij de overlappende ZorgInNatura onder dezelfde Bemiddeling.

> n.b. SQLite ondersteund geen variabele vandaar dat ZorgInNaturaID op meer plekken moet worden ingevuld. Altijd dezelfde invullen

```sql
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
```
**Resultaat matrix 1a**
|          | **ZIN1** | **ZIN2** | **ZIN3** | **ZIN4** | **ZIN5** | **ZIN6** | **ZIN7** | **ZIN8** |
|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| **ZIN1** |    ja    |          |    ja    |          |          |          |          |          |
| **ZIN2** |          |    ja    |    ja    |          |          |          |    ja    |          |
| **ZIN3** |    ja    |    ja    |    ja    |          |    ja    |          |    ja    |          |
| **ZIN4** |          |          |          |    ja    |          |          |          |    ja    |
| **ZIN5** |          |          |    ja    |          |    ja    |          |          |          |
| **ZIN6** |          |          |          |          |          |    ja    |    ja    |          |
| **ZIN7** |          |    ja    |    ja    |          |          |    ja    |    ja    |          |
| **ZIN8** |          |          |          |    ja    |          |          |          |    ja    |

 *bijv vraag ZIN1 krijg ZIN1 en ZIN3*

 #### 1b. Als 1a maar hou rekening met maximale inzagedatum en identificatie raadpleger.
 Vraag een ZINspecificatie op obv ID en geef daarbij de overlappende ZorgInNatura onder dezelfde Bemiddeling. Hou daarbij rekening met:
 - De opgevraagde zinID
 - de maximale inzagedatum van de ZorgInNatura van de overlappende ZorgInNatura onder dezelfde bemiddeling. De inzagedatum is nu:
   - een jaar na de einddatum tot 1 juni van dat volgende jaar. 

> n.b. SQLite ondersteund geen variabele vandaar dat ZorgInNaturaID op meer plekken moet worden ingevuld. Altijd dezelfde invullen


 ```sql
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
 
 ```
 **Resultaat matrix 1b**
| vraag \ antwoord | **ZIN1** | **ZIN2** | **ZIN3** | **ZIN4** | **ZIN5** | **ZIN6** | **ZIN7** | **ZIN8** |
|:----------------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
|     **ZIN1**     |    ja    |          |    ja    |          |          |          |          |          |
|     **ZIN2**     |          |    ja    |    ja    |          |          |          |    ja    |          |
|     **ZIN3**     |    ja    |    ja    |    ja    |          |    ja    |          |    ja    |          |
|     **ZIN4**     |          |          |          |    ja    |          |          |          |   nee    |
|     **ZIN5**     |          |          |    ja    |          |    ja    |          |          |          |
|     **ZIN6**     |          |          |          |          |          |    ja    |    ja    |          |
|     **ZIN7**     |          |    ja    |    ja    |          |          |   nee    |    ja    |          |
|     **ZIN8**     |          |          |          |   nee    |          |          |          |    ja    |

#### 2. Geef ZorgInNatura bij overdracht.
Geef alle bijbehorende specificaties op basis van een overdrachtID

```sql
SELECT *
  FROM Overdracht ov
	 , Overdrachtspecificatie ovs
	 , ZorgInNatura zin
	 , Bemiddeling bm
 WHERE ov.overdrachtID = "OV1" -- opgevraagde overdracht
   AND ov.verantwoordelijkZorgkantoor = "ZK3" -- tbv autorisatiecontrole
   AND ov.overdrachtID = ovs.overdrachtID
   AND ovs.zorgInNaturaID = zin.zorgInNaturaID
   AND zin.bemiddelingID = bm.bemiddelingID
;
```
