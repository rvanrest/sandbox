# Notificatie: Nieuwe Indicatie aan het zorgkantoor

Notificatie aan het zorgkantoor als het CIZ een nieuwe Wlz-indicatie heeft geregistreerd voor een cliënt die in de regio van dit zorgkantoor woont

## Aanleiding
**De trigger voor de notificatie is:** de registratie van een Wlz indicatie in het Indicatieregister

## Instructie
**Stel notificatie op voor:** het zorgkantoor van de regio waarin de client volgens zijn BRP-adres woont. Als er geen BRP-adres is, stel dan notificatie op voor: het zorgkantoor van de regio waarin de client volgens zijn verblijfadres woont

## Flow
![image](/notificaties/bpmn/nieuwe_indicatie_zorgkantoor.svg)

## Inhoud van de notificatie

| Variabele | Waarde | toelichting | 
| :-- | :-- | :-- |
| timestamp | {timestamp} | | 
| afzenderIDType | "KVK" | |
| afzenderID | "62253778" | |
| ontvangerIDType | "UZOVI" | |
| ontvangerID | {uzovi-code ontvanger} | |
| ontvangerKenmerk | NULL | |
| eventType | "NIEUWE_INDICATIE_ZORGKANTOOR" | |
| subjectList | | |
| ../subject | "WlzIndicatie/{wlzIndicatieID}" | |
| ../recordID | "WlzIndicatie/{wlzIndicatieID}" | |


## Meer informatie
Meer informatie over notificeren in het [Afsprakenstelsel iWlz](https://wlz.atlassian.net/wiki/x/5AlgAQ?atlOrigin=eyJpIjoiNzMyN2E3MjM3YjQwNGQ4MmFkZDgwNWY0ZmE0MDIzMGEiLCJwIjoiYyJ9): [link](https://wlz.atlassian.net/wiki/x/5AlgAQ?atlOrigin=eyJpIjoiNzMyN2E3MjM3YjQwNGQ4MmFkZDgwNWY0ZmE0MDIzMGEiLCJwIjoiYyJ9)
