---
title: "Begrippenlijst"
geekdocCollapseSection: true
weight: 20
---
{{< hint type=caution title="Incrementele implementatie" >}}
Het iWlz-netwerkmodel wordt incrementeel geïmplementeerd aan de hand van het Afsprakenstelsel iWlz-netwerkmodel. Het afsprakenstelsel beschrijft zoveel mogelijk de eindsituatie (zoals de doelarchitectuur). Het eerste deel dat wordt geïmplementeerd is het Indicatieregister. Per artikel wordt aangegeven welke onderdelen van toepassing zijn op de eerste implementatiestap: Indicatieregister. Dit wordt met paarse tekstvlakken aangegeven.

Bij iedere volgende implementatiestap wordt het afsprakenstelsel geactualiseerd zodat duidelijk is welke onderdelen worden toegevoegd.

Dit artikel is kaderstellend voor alle implementatiestappen.
{{< /hint >}}

{{< toc >}}

 **Inleiding** 

Om tot duidelijke afspraken voor de totstandkoming van het iwlz-netwerkmodel te komen is een eenduidig begrippenkader vereist. De bestaande [iStandaarden-begrippenlijst](https://www.istandaarden.nl/over-istandaarden/istandaarden/begrippenlijst) vormt hierbij de basis. De begrippen die wel nodig zijn voor het Afsprakenstelsel Netwerkgebaseerde iWlz maar (nog) geen onderdeel zijn van de iStandaarden-begrippenlijst worden hieronder toegelicht. De onderstreepte woorden worden op een andere plek in de begrippenlijst nader toegelicht.

Nota bene: de begrippenlijst wordt indien nodig aangevuld.

|  **Begrip**  |  **Betekenis**  |  **Meer info**  | 
|:---------|:---------|:--------|
| Administrateur | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Afnemer | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Attest | zie 'verklaring' | [https://dizra.gitbook.io/dizra/perspectieven/technology#betrouwbare-verklaringen](https://dizra.gitbook.io/dizra/perspectieven/technology#betrouwbare-verklaringen) | 
| Auditor | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Authenticatie | Authenticatie is het proces waarbij wordt nagegaan of een gebruiker, een computer of applicatie daadwerkelijk is wie hij beweert te zijn. Bij de authenticatie wordt gecontroleerd of een opgegeven bewijs van identiteit overeenkomt met echtheidskenmerken, bijvoorbeeld een in het systeem geregistreerd bewijs. |  | 
| Autorisatie | Autorisatie omvat feitelijk 2 processen:Het aanmaken van een autorisatie-record: het verlenen van toestemming (een bevoegdheid) aan een geauthenticeerde partij om toegang te krijgen tot een bepaalde dienst of toestemming om een bepaalde actie uit te voeren. Een autorisatie wordt vastgelegd in een autorisatie-record.Het geven van de juiste mate van toegang tot gegevens op basis van een eerder uitgegeven autorisatie-record. |  | 
| Basisregistratiehouder | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Beoordelaar | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Bevoegde uitgever van verklaringen | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Bronhouder | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Cliënt | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Datastation | Het datastation is de verzameling van componenten voor de verwerking van data in het iWlz-netwerkmodel. Het omvat: toegang tot de (data)services met koppelvlakkenkoppeling met bron- en doelsystemengestandaardiseerde data-interfacesSynoniemen: iWlz-datastation | [[Applicatiecomponenten|Applicatiecomponenten]] | 
| Deelnemer | Een partij die een rol heeft in het iWlz-netwerkmodel.DIZRA onderscheidt de volgende types deelnemers: zorgorganisatie, zorgverlener, registerhouder, cliënt, secundaire deelnemer.Cliënten zijn deelnemer omdat ze cliënt van een zorgorganisatie worden, zijn of zijn geweest. Registerhouders, zorgorganisaties en secundaire deelnemers zijn deelnemer wanneer zij erkend zijn door een autoriteit, een instantie die bevoegd is. | [https://dizra.gitbook.io/dizra/perspectieven/organizational#de-deelnemers-aan-het-ecosysteem](https://dizra.gitbook.io/dizra/perspectieven/organizational#de-deelnemers-aan-het-ecosysteem) | 
| Dienst (service) | Een afgebakende technische prestatie die een bronhouder aanbiedt aan haar afnemers. Voorbeelden: Raadplegen, Abonneren, Notificeren|  | 
| DIZRA | DIZRA staat voor de referentiearchitectuur van een duurzaam informatiestelsel in de zorg. Het bestaat uit uitgangspunten, instrumenten, kennisthema's en praktische richtlijnen. DIZRA is in 2020 vastgesteld door het Informatieberaad Zorg. | [Website DIZRA](https://dizra.gitbook.io/) | 
| Gegevensgids | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Gegevensregisseur | De gegevensregisseur is een rol van een burger. De gegevensregisseur voert regie over de gegevens over de cliënt. Cliënten hebben niet de rol van bronhouder, zij zijn gegevensregisseur en/of gezondheidsregisseur. | [https://dizra.gitbook.io/dizra/perspectieven/technology/actors#gegevensregisseur](https://dizra.gitbook.io/dizra/perspectieven/technology/actors#gegevensregisseur) | 
| Gegevensregisseur / Gezondheidsregisseur | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Identificatie | Bij identificatie gaat het om diverse manieren om iemands identiteit vast te stellen. Bijvoorbeeld via een identiteitsbewijs, bsn of indicatienummer. |  | 
| Ledenadministratie | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Netwerk | Het geheel aan bronhouders, afnemers en andere deelnemers dat gezamenlijk zorgdraagt voor de informatievoorziening in de context van de Wet langdurige zorg. |  | 
| Netwerkfuncties | Activiteiten van een deelnemer in het netwerk. |  | 
| nID | nID is een centraal open-source component dat invulling geeft aan een federatief stelsel, waarmee bronregisters de mogelijkheid hebben om gegevens beschikbaar te stellen en deelnemers, indien voorzien van de juiste autorisaties gegevens kunnen raadplegen. |  | 
| Nuts | Nuts is een initiatief dat ervoor zorgt dat zorgverleners op basis van open standaarden digitaal kunnen samenwerken. Hierbij wordt gebruik gemaakt van zogenaamde decentrale Nuts nodes. | [https://nuts.nl](https://nuts.nl) | 
| Operationeel ketenbeheerder | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| PGO | Een Persoonlijke Gezondheidsomgeving (PGO) is een digitale omgeving waar Nederlandse burgers hun medische gegevens kunnen beheren en delen. |  | 
| Register | Het functioneel concept waarvan afnemers en gegevensregisseurs gelijksoortige data en services op gestandaardiseerde wijze kunnen afnemen. Een register wordt op technisch niveau gerealiseerd door een of meerdere data stations. |  | 
| Stelsel Functioneel beheerder (in DIZRA: Stelselbeheerder) | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelsel Technisch beheerder (in DIZRA: Technisch beheerder / Standaardisatieorganisatie) | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelsel-distributeur (in DIZRA: Distributeur) | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelselautorisator | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelselbeheerder | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Stelselexpert | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelselfinancier | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelselgebruiker en Stelseleindgebruiker (DIZRA: Gebruiker) | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Stelselhouder | Besturingsrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Besturingsrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Besturingsrollen) | 
| Uitgever | Een organisatie of persoon die bevoegd is voor het uitgeven van verklaringen.Synoniemen: 'Bevoegde uitgever van verklaringen' | [https://dizra.gitbook.io/dizra/perspectieven/technology/actors#bevoegde-uitgever-van-verklaringen](https://dizra.gitbook.io/dizra/perspectieven/technology/actors#bevoegde-uitgever-van-verklaringen) | 
| Verklaring | Betrouwbare verklaring over een organisatie of persoon die kan worden ingezet ten behoeve van authenticatie en/of autorisatie. Voorbeelden:een betrouwbare verklaring dat een bepaalde organisatie een zorgaanbieder iseen betrouwbare verklaring dat een bepaalde deelnemer aan het iWlz-netwerkmodel rechten heeft tot het inzien van indicatie-gegevens van een bepaalde cliëntSynoniemen: attest |  | 
| Vertrouwensleverancier | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Verzekeraar betrouwbaarheid | Systeemrol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Systeemrollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Systeemrollen) | 
| Zorgaanbieder | Rechtspersoon die zorgt aanbiedt |  | 
| Zorgkantoor | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Zorgorganisatie (zorgaanbieder) | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
| Zorgverlener | Organisatorische rol in het iWlz-netwerkmodel | [Artikel Rollen en deelnemers, paragraaf Organisatorische rollen](https://actieprogrammaiwlz.atlassian.net/wiki/spaces/IWLZ/pages/45678593/Rollen+en+deelnemers#Organisatorische-rollen) | 
