---
title: "Achtergrond & toelichting"
geekdocCollapseSection: true
weight: 15
---

### VERSIE: 06-03-2023 STATUS: TER REVIEW

{{< hint type=caution title="Incrementele implementatie" >}}
Het iWlz-netwerkmodel wordt incrementeel geïmplementeerd aan de hand van het Afsprakenstelsel iWlz-netwerkmodel. Het afsprakenstelsel beschrijft zoveel mogelijk de eindsituatie (zoals de doelarchitectuur). Het eerste deel dat wordt geïmplementeerd is het Indicatieregister. Per artikel wordt aangegeven welke onderdelen van toepassing zijn op de eerste implementatiestap: Indicatieregister. Dit wordt met paarse tekstvlakken aangegeven.

Bij iedere volgende implementatiestap wordt het afsprakenstelsel geactualiseerd zodat duidelijk is welke onderdelen worden toegevoegd.

Dit artikel is kaderstellend voor alle implementatiestappen.
{{< /hint >}}

{{< toc >}}

**Aanleiding**

Zorginstituut Nederland is in 2017 gestart met een nieuw ontwerp voor de gegevensuitwisseling binnen de Wet langdurige zorg (Wlz) op verzoek van het ministerie van VWS. Dit nieuwe ontwerp is bedoeld om de administratieve lasten voor alle partijen in de zorg te verminderen, de kwaliteit van de zorg te verbeteren en de financiële houdbaarheid van het stelsel te versterken. Dit wordt gedaan door de regie op de gegevens zoveel mogelijk bij de cliënt te leggen. Deze voornemens zijn door het Informatieberaad Zorg uitgedrukt in de [outcomedoelen](https://www.informatieberaadzorg.nl/over-het-informatieberaad/outcomedoelen-en-targets) ‘patiënt centraal’, ‘gestandaardiseerde gegevensuitwisseling' en ‘eenmalig vastleggen en hergebruik gegevens’.

Om dit te bewerkstelligen is het Actieprogramma iWlz opgericht, waarin alle relevante partijen binnen de Wlz aan meedoen. Het doel van het Actieprogramma iWlz is om de informatiepositie van de cliënt over zijn zorg te versterken, met minimale administratieve lasten en tijdige, volledige en betrouwbare informatie over Wlz-zorg voor professionals in de zorg en voor de cliënt.

In 2017 werd samen met veel ketenpartners een simulatieomgeving gebouwd. Vervolgens kwam het Actieprogramma iWlz tot de conclusie dat een netwerkmodel het best aansluit bij de outcomedoelen die door het Informatieberaad Zorg zijn geformuleerd. Deze conclusie is bevestigd door het Architectuurboard van het Informatieberaad Zorg wat positief heeft [geadviseerd](https://www.informatieberaadzorg.nl/publicaties/vergaderstukken/2021/04/19/oplegnotitie-bestuurlijke-samenvatting-doelarchitectuur) om dit netwerkperspectief als leidend paradigma over te nemen. En sluit hiermee aan op de actuele zorgbrede afspraken over infrastructuur en interoperabiliteit.

Het Actieprogramma iWlz wordt gefaciliteerd door het ministerie van VWS. Zorginstituut Nederland is opdrachtgever.

# Outcomedoelen Informatieberaad Zorg

De outcomedoelen van het Informatieberaad Zorg zijn vooral geïnspireerd op het voornemen van de overheid om de cliënt centraal te stellen en de administratieve lasten voor alle partijen te verminderen. Het netwerkmodel levert op 3 punten een belangrijke bijdrage aan deze doelen:

1. Patiënt centraalHet netwerkmodel geeft cliënten een sterkere informatiepositie, waardoor zij geïnformeerde keuzes kunnen maken over hun zorgproces. Cliënten krijgen bijvoorbeeld via hun persoonlijke gezondheidsomgeving inzicht in de status van hun zorgproces, de geleverde zorg en hun eigen bijdrage. Bovendien is de cliënt in dit model, samen met zijn netwerk, eigenaar van zijn eigen gegevens en houdt hij daarop zelf regie.

2. Gestandaardiseerde gegevensuitwisselingBij het zorgproces van een cliënt zijn doorgaans meerdere zorgverleners of zelfs zorgdomeinen betrokken. Om een soepele overdracht van gegevens tussen deze verschillende domeinen mogelijk te maken, dienen de gegevensstandaarden goed op elkaar aan te sluiten. Zodra helder is welke gegevens voor adequate zorg en behandeling noodzakelijk zijn, kunnen deze gegevens met het netwerkmodel op digitale, gestandaardiseerde en beveiligde wijze, en indien nodig mét toestemming van de cliënt, gedeeld worden. Deze gegevens hoeven niet steeds opnieuw te worden aangeleverd en zijn actueel raadpleegbaar. Daarmee is de kans op fouten en dubbele registraties kleiner.

3. Eenmalig vastleggen en hergebruik gegevens In het netwerkmodel zijn gegevens over indicaties, bemiddelde zorg en geleverde zorg beschikbaar bij de bron waar ze zijn geregistreerd. Alle partijen kunnen de bron raadplegen op het moment dat de gegevens nodig zijn. Ze zien dan de meest actuele gegevens. Deze gegevens hoeven de ketenpartijen niet meer zelf op te slaan.

# Samenhang met andere trajecten

Parallel aan het Actieprogramma iWlz werkt het Zorginstituut aan het programma KIK-V. In het programma KIK-V maken onder andere ketenpartijen in de verpleeghuiszorg samen afspraken over het vaststellen en uitwisselen van kwaliteitsinformatie. Het doel van KIK-V is ervoor zorgen dat de uitwisseling van kwaliteitsinformatie beter verloopt.

Het Actieprogramma iWlz en KIK-V maken gebruik van dezelfde principes en uitgangspunten. Waar mogelijk worden dezelfde open standaarden en methodieken gehanteerd voor de gegevens en wijze van uitwisselen. In [dit filmpje](https://infoizo.nl/netwerkperspectief) wordt dit gevisualiseerd.

![](images/storage/Netwerkperspectief.png)Niet alleen de programma's van Zorginstituut Nederland dragen bij aan een duurzaam informatiestelsel in de zorg, maar ook programma's van andere partijen in het zorgstelsel zijn gebaseerd op dezelfde principes en uitgangspunten. Denk aan programma’s zoals: Medmij, Inzicht, modernisering LRZA en i-Sociaal domein.

# Samenhang met andere domeinen

Zoals hierboven aangegeven wordt niet alleen binnen het domein van de langdurige zorg nagedacht over een netwerkmodel. Ook partijen buiten het domein langdurige zorg kunnen aansluiten op het netwerk, zoals MedMij en eOverdracht. Bij het i-Sociaal domein leeft de ‘common ground’ gedachte. Gekeken wordt in hoeverre beide netwerkconcepten aan elkaar te koppelen zijn. Een van de toepassingen zou kunnen zijn dat gemeenten meer inzicht krijgen in de samenloop tussen de Wmo en de Wlz; door middel van een ‘Wlz-signaal’ kan samenloop vroegtijdig worden herkend.

# iWLZ - de iStandaard om cliënten in alle fasen van de Wlz-keten te volgen

iWlz is een standaard die te maken heeft met het volgen van cliënten die vallen onder de Wet langdurige zorg (Wlz). iWlz kan iemand in alle fasen van de Wlz-keten volgen: van de indicatie via zorgtoewijzing en -levering tot de vaststelling van de eigen bijdrage en declaratie.

De Wlz-ketenpartijen wisselen alle informatie in gestandaardiseerde vorm uit. Elke partij heeft een eigen taak in het proces: het Centrum indicatiestelling zorg (CIZ) indiceert, het zorgkantoor bemiddelt naar passende zorg, de zorgaanbieder levert vervolgens die zorg en het Centraal Administratie Kantoor (CAK) stelt tot slot de eigen bijdrage vast.

# Estafettemodel

De uitwisseling in de iWlz vindt al jaren plaats via berichten die conform een vast protocol volgtijdelijk worden uitgewisseld. De partijen geven via deze berichten de informatie door die zij zelf hebben ontvangen van andere partijen eerder in het proces en vullen dit aan met de informatie die zij zelf op grond van hun rol in het proces hebben toegevoegd.

In het estafettemodel worden de processen van indiceren, bemiddelen, zorg leveren en regelen van de eigen bijdrage binnen het domein van de langdurige zorg ondersteund. Elke partij in de keten houdt een registratie bij in een eigen systeem. Uitwisseling tussen ketenpartijen, zoals zorgkantoren en zorgaanbieders, gaat via berichten in een vaste volgorde omdat het een ketenproces is. Iedere ketenpartij kan gegevens ontvangen, aanvullen, opslaan en doorsturen.

Uitwisselen van berichten is gebaseerd op de iStandaarden voor de gegevens en de manier van verzenden en ontvangen.

![](images/storage/Overzicht_berichtenverkeer_huidige_iStandaarden_iWlz.png)N.B. De berichten AW319 en AW320 zijn niet in scope van het iWlz-netwerkmodel.

# Van estafette- naar netwerkmodel

Om invulling te kunnen geven aan de outcomedoelen van het Informatieberaad Zorg is ervoor gekozen om de informatievoorziening in het kader van de Wet langdurige zorg door te ontwikkelen van een estafettemodel naar een netwerkmodel.

In het netwerkmodel worden de processen van indiceren, bemiddelen, zorg leveren en regelen van de eigen bijdrage binnen het domein van de langdurige zorg ondersteund. Elke deelnemer aan het netwerk houdt een registratie bij in een eigen register. Uitwisseling van gegevens tussen de deelnemers in het netwerk gaat, anders dan in het estafettemodel, door middel van inzage in elkaars registers op basis van toegekende rechten. Deelnemers kunnen op deze manier de voor hen relevante gegevens raadplegen. Een voorbeeld van een register is het indicatieregister waarin het CIZ indicaties registreert. Een zorgkantoor dat de geïndiceerde zorg wil gaan toewijzen, kan de indicatiegegevens uit het indicatieregister raadplegen op basis van toegekende rechten.

Op deze manier wordt gegevensuitwisseling tussen partijen efficiënter en krijgt de cliënt meer mogelijkheden gegevens in te zien en te delen. In [dit filmpje](https://www.istandaarden.nl/iwlz/actieprogramma/filmpje-hoe-werkt-het-netwerkmodel)wordt dit gevisualiseerd.

![](images/storage/Samenhang in de doorontwikkeling.png) **Samenwerkende partners**

In het Actieprogramma iWlz zijn de volgende partijen verenigd:
- CIZ
- CAK
- Zorgverzekeraars Nederland
- Zorgkantoren
- Zorgthuisnl
- Valente
- De Nederlandse GGZ
- Actiz
- VGN
- Nza
- Zorginstituut Nederland

VECOZO maakt formeel geen deel uit van het Actieprogramma iWlz. VECOZO vervult wel een aantal voor het iWlz-netwerkmodel essentiële rollen. VECOZO vervult rollen op het gebied van het vertrouwen, de vindbaarheid en het beheer van het gehele netwerk en als dienstverlener van individuele deelnemers aan het netwerk.

