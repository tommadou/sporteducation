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
