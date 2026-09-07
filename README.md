# THE SEASON — V3

## Links
- Studenten: `index.html`
- Docenten: `score-a9ceabc999a081ca.html`
- Admin: `admin-51bf17ede0a2bc83.html`

Er zijn geen gebruikersaccounts of logins.

## Wat is nieuw in V3?
### Publiek leaderboard
Minimalistisch sportklassement met:
- Overall / 3LOA / 3LOB / 3LOC
- rang
- team
- deelscore per actief criterium
- totaalpunten
- geen docentnaam

### Admin
Bestaande items zijn nu rechtstreeks bewerkbaar:
- teams: klas + teamnaam
- lessen: datum + klas + lesnaam + lesgevend team
- leraars: naam + actief/inactief
- criteria: naam + korte leaderboardnaam + scope + minimum + maximum
- scores: punten rechtstreeks corrigeren
Alles kan ook toegevoegd en verwijderd worden.

### Scorepagina
- geen login
- docent wordt op hetzelfde toestel onthouden
- les kiezen
- alle vier teams onder elkaar
- Doelen bereikt? alleen voor het lesgevende team
- één knop om alle scores te bewaren

## Supabase opzetten
1. Maak een nieuw Supabase-project.
2. SQL Editor → voer `supabase-setup.sql` volledig uit.
3. Kopieer Project URL en publishable/anon key.
4. Vervang in de drie HTML-bestanden:
   `YOUR_SUPABASE_URL`
   `YOUR_SUPABASE_PUBLISHABLE_KEY`
5. Upload alle bestanden naar GitHub Pages.

## Veiligheid
Dit ontwerp gebruikt bewust geheime links in plaats van authenticatie. Daardoor moet de anon key database-wijzigingen toelaten. Deel alleen `index.html` met studenten. De score- en adminlinks zijn praktisch verborgen, maar niet cryptografisch beveiligd. Een private GitHub-repository met Pages/deployment buiten een publiek bronoverzicht is veiliger dan een publieke repository voor deze aanpak.


## Supabase
Deze versie is reeds gekoppeld aan het Supabase-project `the-season`.

## V4
- Excelimport onder Admin > Lessen.
- Kolommen: Datum, Klas, Lesnaam, Lesgevend team, Beoordelaar.
- Een beoordelaar kan aan een les worden toegewezen.
- Op de scorepagina ziet een docent alleen lessen die aan hem/haar zijn toegewezen.
- Voer bij upgrade van V3 eerst `supabase-v4-migration.sql` uit in Supabase.
- Voorbeeldbestand: `the-season-lessen-import.xlsx`.


## V5
- Meerdere beoordelaars per les via `lesson_evaluators`.
- Per les bepaal je welke criteria beoordeeld worden via `lesson_criteria`.
- `Doelen bereikt?` blijft alleen op het lesgevende team van toepassing wanneer dat criterium voor die les actief is.
- Excelkolom `Beoordelaars`: meerdere namen met `;`, bv. `Tom; Jan`.
- Excelkolom `Criteria`: meerdere criteria met `;`, bv. `Klaar?; Inzet`. Leeg betekent bij import: alle actieve criteria.
- Voer voor een bestaande database eerst `supabase-v5-migration.sql` uit.

## V6
Wanneer je bij een bestaande les een criterium uitschakelt, controleert Admin of daarvoor al scores bestaan. Je krijgt dan de keuze om die scores te verwijderen of te bewaren. Er is geen extra SQL-migratie nodig bovenop V5.

## V7
- Scorepagina: eerst docent, daarna klas, daarna alleen de toegewezen lesmomenten van die klas.
- Leaderboard: totaalpunten staan nu direct na teamnaam, zodat ze op een smartphone meteen zichtbaar zijn.
- Subtiele goud/zilver/brons-markering naast plaatsen 1, 2 en 3.
- Service-worker cache bijgewerkt naar `season-v7`.

## V8
- Zichtbare titel overal gewijzigd naar `SEASON 26-27`.
- Hoofdtitel blijft op smartphone op één regel en schaalt mee met de schermbreedte.

## V10
- Op smartphone toont het leaderboard alleen positie, team en totaalpunten; geen horizontaal scrollen meer nodig.
- Deelscores blijven zichtbaar op grotere schermen.
- De nummer 1 staat subtiel vet.
- Klastabs worden alfabetisch weergegeven.

## V11
- Mobiel leaderboard: positie, team en totaalpunten blijven links zichtbaar; deelscores staan rechts en zijn bereikbaar door horizontaal te scrollen.
- In landscape is automatisch meer van het klassement zichtbaar.
- Admin > Scores toont per score wie ze gaf.
- Filters toegevoegd op beoordelaar, klas, les, team en criterium.
- De scorelijst laadt maximaal 2000 recente scores in plaats van 250.

## V12
- Admin > Lessen heeft filters voor beoordelaar, klas en lesgevend team.
- Sorteren kan op datum oplopend/aflopend, klas + datum, beoordelaar of lesnaam.
- Het aantal gevonden lessen wordt getoond.
- Bij wisselen van klas wordt een eventueel teamfilter automatisch gewist.

## V13
- Mobiel leaderboard: de volledige tabel scrollt nu als één geheel.
- Geen sticky kolommen of verticale scheidingslijn meer.
- Tabelranden zijn verwijderd voor een rustiger, minimalistischer beeld.
- De horizontale scrollzone gebruikt de volledige schermbreedte.

## V14
- Nieuwe pagina `reglement.html` in dezelfde stijl als Season 26-27.
- Link naar het wedstrijdreglement toegevoegd op het leaderboard.
- Link naar het wedstrijdreglement én terug naar het leaderboard toegevoegd op de docentenscorepagina.
