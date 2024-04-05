### eDocs volgnummer

<geen>

### Versienummer RFC

0.1

## Korte probleem omschrijving

In de situatie van een herindicatie voor een client die is verhuisd naar een andere zorgkantoorregio (en vaak i.c.m. pgb) kan er de situatie ontstaan dat: 
- het nieuw verantwoordelijke zorgkantoor niet weet dat de client al onder verantwoordelijkheid valt bij een ander zorgkantoor waar de client mogelijk zorglevering ontvangt; 
- dat het huidig verantwoordelijk verantwoordelijk zorgkantoor wel een notificatie heeft ontvangen dat de WlzIndicatie is vervallen (als gevolg van herindicatie) terwijl er nog dienstverlening is maar niet weet wat de nieuwe indicatie betref.  

## Korte omschrijving voorgestelde oplossing

Notificeer bij herindicatie het huidige verantwoordelijke zorgkantoor, het zorgkantoor dat de client op moment van herindicatie onder verantwoordelijkheid heeft. 

### RFC gevolgen voor het onderdeel/de onderdelen

Regels, Proces

### Welk ander onderdeel?

_No response_

### Betrokken partij RFC

CIZ

### Andere betrokken partij

_No response_

### Indiener RFC

Zorginstituut

### Andere organisatie / contactpersoon

_No response_


## Analyse
### Huidige situatie

Bij het vastleggen van een WlzIndicatie bepaalt het CIZ op basis van de postcode (BRP) van de client de regio en daarmee het verantwoordelijke zorgkantoor waar de client hoort. Op basis daarvan stuurt het CIZ een notificatie naar dat zorgkantoor. 

Bij een herindicatie bepaalt het CIZ opnieuw de dan geldende regio. Het kan dan gebeuren dat het zorgkantoor dat de notificatie "Nieuwe Indicatie" ontvangt, (nog) niet het zorgkantoor is dat nu het zorgkantoor is dat de client onder verantwoordelijkheid heeft. Dit ontstaat in het geval dat de client volgens de BRP al is verhuisd, maar dat de verantwoordelijkheid nog niet is overgedragen aan het zorgkantoor dat verantwoordelijk is voor de nieuwe regio van de client. 

De situatie die dan ontstaat is dat: 
- het nieuw verantwoordelijke zorgkantoor niet weet dat de client al onder verantwoordelijkheid valt bij een ander zorgkantoor en daar mogelijk zorg ontvangt, en 
- dat het huidig verantwoordelijk verantwoordelijk zorgkantoor wel een notificatie heeft ontvangen dat de WlzIndicatie is vervallen (als gevolg van herindicatie) terwijl er nog dienstverlening is maar niet weet wat de nieuwe indicatie betreft.
Wanneer een client pgb ontvangt vanuit de Wlz en verhuist naar een andere zorgkantoor-regio, wordt de client niet direct overgedragen. @@ opzoeken informatiemodel

Wanneer de client voor de overdrachtsdatum verhuist en voor de overdrachtsdatum een herindicatie ontvangt, krijgt het nieuwe zk een notificatie daarvan terwijl het huidige zk nog zorglevering verzorgt aan die client. 


### Bezwaren huidige situatie


## Wijzigingsvoorstel
### Voorstel aanpassing proces
Wanneer een WlzIndicatie vervalt, beeindigd het CIZ direct de contactinformatie bij die client. 

Een WlzIndicatie vervalt op het moment dat er een nieuwe Indicatiebesluit is afgegeveven of als de client is overleden. In de eerste situatie heeft het CIZ contact gehad met de client en kan het CIZ controleren of de contactinformatie nog actueel is. Is dit niet het geval is beeindigd het CIZ de geregisteerde contactinformatie. In de tweede situatie is de contactinformatie niet meer van toepassing en kan worden beeindigd.  

**Voordelen**
- Het juiste verantwoordelijke zorgkantoor ontvangt bij herindicatie de notificatie van "Nieuwe Indicatie"

**Nadelen**
- Wijkt af van de werkwijze bij een nieuwe client indicatie. 

## Uitwerking wijzigingsvoorstel per onderdeel
### ERD
*geen wijzigingen*

### Regels
Regel toevoegen < nog uit te werken>

### Proces
Proces aanvullen met controle op actualiteit contactinformatie bij herindicatie of vullen einddatum bij overlijden. 

### Gegevens
*geen wijzigingen*

### Koppelvlak
*geen wijzigingen*

## Overweging wijzigingsvoorstel(len)

| Oplossing     | Voordeel / Nadeel                | Overweging Referentiegroep |
| :------------ | :------------------------------- | :------------------------- |
| 1. ..         | Voordeel:                        |                            |
|               | Nadeel:                          |                            |
| #. Niets doen | Voordeel: geen wijziging nodig   |                            |
|               | Nadeel: probleem blijft aanwezig |                            |
...


## Conclusie

None

### Gekozen oplossing

_No response_

### Publicatiemoment

_No response_

### Implementatiemoment

_No response_

