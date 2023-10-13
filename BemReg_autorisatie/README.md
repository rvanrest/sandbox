# TEST-queries en data voor Bemiddelingsregister

repo voor het testen van sql-queries op het bemiddelingsregsiter. 

## Database
De data zit in een Sqlite database. De data zit dus in een single-file: **[Dummy_BemReg.sqlite](Dummy_BemReg.sqlite)**. Er hoeft dus geen server gedraaid te worden of andere runtimes geinstalleerd. Er is enkel een tool nodig om de file te openen en een mogelijkheid om queries tegenaan te draaien. 

De data is te benaderen en queries uitvoeren dmv 
- DB Browser for SQLite [hier te vinden](https://sqlitebrowser.org) 
- Visual Studio Code met extensions: [VSC](https://code.visualstudio.com) + extensions [sqlite viewer](https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer) en [sqlite](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)


Meer informatie over SQLite is [hier (Official site)](https://www.sqlite.org/index.html) of [hier (SQLite tutorial)](https://www.sqlitetutorial.net) te vinden.

## ERD


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


## Queries
#### 1. Selecteer ZorgInNatura en geef bijbehorende ZIN specificaties 
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
**Resultaat matrix**
|          | **ZIN1** | **ZIN2** | **ZIN3** | **ZIN4** | **ZIN5** | **ZIN6** | **ZIN7** |
|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| **ZIN1** |    ja    |          |    ja    |          |          |          |          |
| **ZIN2** |          |    ja    |    ja    |          |          |          |    ja    |
| **ZIN3** |    ja    |    ja    |    ja    |          |    ja    |          |    ja    |
| **ZIN4** |          |          |          |    ja    |          |          |          |
| **ZIN5** |          |          |    ja    |          |    ja    |          |          |
| **ZIN6** |          |          |          |          |          |    ja    |    ja    |
| **ZIN7** |          |    ja    |    ja    |          |          |    ja    |    ja    |

 *bijv vraag ZIN1 krijg ZIN1 en ZIN3*
