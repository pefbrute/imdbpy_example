# IMDb API Response Data Structure

This document outlines the structure and format of the data returned by the IMDb API when fetching details for a movie or TV series. The example data is based on the TV series "Breaking Bad".

## General Movie/Series Information

The root of the response is a dictionary containing various keys.

-   **`title`** (String): The primary title of the movie/series.
    *   Example: `'Breaking Bad'`

-   **`original title`** (String): The original title, often in the original language if different from the primary title.
    *   Example: `'Breaking Bad'`

-   **`localized title`** (String): The title localized to a specific region or language (often the same as `title` if no specific localization is found or requested).
    *   Example: `'Breaking Bad'`

-   **`imdbID`** (String): The unique IMDb identifier for the movie/series.
    *   Example: `'0903747'`

-   **`kind`** (String): The type of media.
    *   Example: `'tv series'` (Other possible values: `'movie'`, `'episode'`, etc.)

-   **`year`** (Integer): The release year of the movie. For a TV series, this is the starting year.
    *   Example: `2008`

-   **`series years`** (String): For TV series, the range of years it aired.
    *   Example: `'2008-2013'`

-   **`number of seasons`** (Integer): For TV series, the total number of seasons.
    *   Example: `5`

-   **`seasons`** (List of Strings): For TV series, a list of season numbers available.
    *   Example: `['1', '2', '3', '4', '5']`

-   **`cover url`** (String): A URL to the cover image/poster of the movie/series.
    *   Example: `'https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_SX101_CR0,0,101,150_.jpg'`

-   **`rating`** (Float): The IMDb rating of the movie/series.
    *   Example: `9.5`

-   **`votes`** (Integer): The number of votes contributing to the rating.
    *   Example: `2326262`

-   **`runtimes`** (List of Strings): Running time(s) of the movie or episodes. Typically in minutes.
    *   Example: `['45']` (meaning 45 minutes)

-   **`aspect ratio`** (String): The aspect ratio of the video.
    *   Example: `'1.78 : 1 (UHD)'`

-   **`sound mix`** (List of Strings): Sound mix technologies used.
    *   Example: `['Dolby Digital']`

-   **`color info`** (List of Strings): Information about color (e.g., "Color", "Black and White").
    *   Example: `['Color']`

## People and Companies

-   **`cast`** (List of `Person` objects): A list of primary cast members. Each `Person` object contains:
    *   **`id`** (String): The IMDb ID of the person.
    *   **`name`** (String): The name of the person.
    *   Example `Person` object representation: `<Person id:0186505[http] name:_Bryan Cranston_>`

-   **`writer`** (List of `Person` objects): A list of writers. Structure is the same as `cast` members.
    *   Example: `<Person id:0319213[http] name:_Vince Gilligan_>`

-   **`production companies`** (List of `Company` objects): A list of companies involved in production. Each `Company` object contains:
    *   **`id`** (String): The IMDb ID of the company.
    *   **`name`** (String): The name of the company.
    *   Example `Company` object representation: `<Company id:0212797[http] name:_High Bridge Productions_>`

-   **`distributors`** (List of `Company` objects): A list of distribution companies. Structure is the same as `production companies`.
    *   Example: `<Company id:0019701[http] name:_American Movie Classics (AMC)_>`

-   **`other companies`** (List of `Company` objects): A list of other companies involved (e.g., catering, special effects, payroll). Structure is the same as `production companies`.
    *   Example: `<Company id:0223824[http] name:_Absolut Video_>`

-   **`special effects`** (List of `Company` objects): A list of companies that provided special effects. Structure is the same as `production companies`.
    *   Example: `<Company id:0057238[http] name:_Velocity Visuals_>`

## Content and Classification

-   **`genres`** (List of Strings): A list of genres associated with the movie/series.
    *   Example: `['Crime', 'Drama', 'Thriller']`

-   **`plot`** (List of Strings): Various plot summaries or taglines.
    *   Example: `['A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student to secure his family's future.', ...]`

-   **`plot outline`** (String): A concise plot outline.
    *   Example: `'Walter White is a chemistry genius but works as a chemistry teacher...'`

-   **`synopsis`** (List of Strings): Detailed synopsis, often broken down by season for TV series.
    *   Example: `['Season 1A struggling high school chemistry teacher, Walter White (Bryan Cranston), is diagnosed with inoperable, advanced lung cancer...', ...]`

-   **`certificates`** (List of Strings): Age certification ratings from various countries/regions. The format is typically `Country:Rating::(Optional notes)`.
    *   Example: `['Argentina:18', 'Australia:MA15+', 'United States:TV-MA']`

## Localization and Language

-   **`akas`** (List of Strings): "Also Known As" titles. This includes alternative titles in different countries or languages.
    *   Example: `['Rompiendo Tus Límites Morales (Spain)', '绝命毒师 (China, Mandarin title)', 'Во все тяжкие (Russia)']`

-   **`countries`** (List of Strings): A list of countries of origin.
    *   Example: `['United States']`

-   **`country codes`** (List of Strings): ISO 3166-1 alpha-2 country codes.
    *   Example: `['us']`

-   **`language codes`** (List of Strings): ISO 639-1 language codes.
    *   Example: `['en', 'es']`

-   **`languages`** (List of Strings): A list of languages spoken in the movie/series.
    *   Example: `['English', 'Spanish']`

## Media Links

-   **`videos`** (List of Strings): URLs to video clips, trailers, or other related video content on IMDb.
    *   Example: `['http://www.imdb.com/title/tt0903747/videoplayer/vi2624111385', ...]`

## Notes on Data Types

-   **`Person` Object**: Represents an individual (actor, writer, etc.). The typical representation in the raw data includes an `id` and `name`.
    *   Example structure (conceptual): `{ 'id': 'PERSON_ID', 'name': 'Person Name' }` (The actual Python object from `imdbpy` is more complex but these are the key accessible attributes).

-   **`Company` Object**: Represents a company (production, distribution, etc.). The typical representation in the raw data includes an `id` and `name`.
    *   Example structure (conceptual): `{ 'id': 'COMPANY_ID', 'name': 'Company Name' }` (Similar to `Person` objects, the `imdbpy` object is more complex).

This structure provides a comprehensive overview of the information one can typically expect from the IMDb API for a given movie or series. The availability of specific fields can vary depending on the completeness of the IMDb database for that particular entry. 

## Raw Data Example (JSON-like Structure)

Below is an example of the raw data structure returned by the API, as printed by `pprint(full_movie.data)`. This shows the dictionary format with all its keys and values.

```json
{'akas': ['Rompiendo Tus Límites Morales (Spain)',
          '绝命毒师 (China, Mandarin title)',
          'ブレイキング・バッド (Japan, Japanese title)',
          'Kriva pota (Slovenia)',
          'Во все тяжкие (Russia)'],
 'aspect ratio': '1.78 : 1 (UHD)',
 'cast': [<Person id:0186505[http] name:_Bryan Cranston_>,
          <Person id:0348152[http] name:_Anna Gunn_>,
          <Person id:0666739[http] name:_Aaron Paul_>,
          <Person id:1336827[http] name:_Betsy Brandt_>,
          <Person id:2666409[http] name:_RJ Mitte_>,
          <Person id:0606487[http] name:_Dean Norris_>,
          <Person id:0644022[http] name:_Bob Odenkirk_>,
          <Person id:2366374[http] name:_Steven Michael Quezada_>,
          <Person id:0052186[http] name:_Jonathan Banks_>,
          <Person id:0002064[http] name:_Giancarlo Esposito_>,
          <Person id:1889973[http] name:_Charles Baker_>,
          <Person id:0687146[http] name:_Jesse Plemons_>,
          <Person id:0184086[http] name:_Christopher Cousins_>,
          <Person id:0292182[http] name:_Laura Fraser_>,
          <Person id:2804503[http] name:_Matt Jones_>,
          <Person id:0928795[http] name:_Michael Shamus Wiles_>,
          <Person id:1089417[http] name:_Lavell Crawford_>,
          <Person id:1530474[http] name:_Ray Campbell_>,
          <Person id:1269983[http] name:_Krysten Ritter_>,
          <Person id:0784831[http] name:_Carmen Serano_>,
          <Person id:1986960[http] name:_Emily Rios_>,
          <Person id:0662669[http] name:_Tina Parker_>,
          <Person id:0546797[http] name:_Mark Margolis_>,
          <Person id:0084497[http] name:_Jeremiah Bitsui_>,
          <Person id:3970678[http] name:_Ian Posada_>,
          <Person id:0182345[http] name:_David Costabile_>,
          <Person id:0100889[http] name:_Michael Bowen_>,
          <Person id:1450145[http] name:_David House_>,
          <Person id:0710271[http] name:_Kevin Rankin_>,
          <Person id:3718379[http] name:_Daniel Moncada_>,
          <Person id:4577760[http] name:_Patrick Sane_>,
          <Person id:5987281[http] name:_Moira Bryg MacDonald_>,
          <Person id:0372961[http] name:_Jessica Hecht_>,
          <Person id:0122987[http] name:_Bill Burr_>,
          <Person id:2256387[http] name:_Marius Stan_>,
          <Person id:2968788[http] name:_Rodney Rush_>,
          <Person id:0856086[http] name:_Todd Terry_>,
          <Person id:1616991[http] name:_Luis Moncada_>,
          <Person id:3979839[http] name:_Kaija Bales_>,
          <Person id:1324884[http] name:_Tait Fletcher_>,
          <Person id:5597998[http] name:_Matthew T. Metzler_>,
          <Person id:0190441[http] name:_Raymond Cruz_>,
          <Person id:0002128[http] name:_Tess Harper_>,
          <Person id:0209496[http] name:_John de Lancie_>,
          <Person id:0122716[http] name:_Jere Burns_>,
          <Person id:0316708[http] name:_Nigel Gibbs_>,
          <Person id:0452622[http] name:_Tom Kiesche_>,
          <Person id:0173997[http] name:_Maurice Compte_>,
          <Person id:2813734[http] name:_Morse Bicknell_>,
          <Person id:5518772[http] name:_Christopher King_>],
 'certificates': ['Argentina:18',
                  'Australia:MA15+',
                  'Brazil:16',
                  'Brazil:14::(some episodes)',
                  'Bulgaria:D',
                  'Canada:14A',
                  'Canada:13+::(Québec)',
                  'Canada:14+::(TV Rating)',
                  'Chile:18',
                  'Colombia:15',
                  'Denmark:15::(DVD and Blu-ray rating)',
                  'Ecuador:16::(self-applied)',
                  'Egypt:18+::(self-applied)',
                  'Finland:K-16',
                  'France:Tous publics::(with warning)',
                  'Germany:16',
                  'Hong Kong:IIB',
                  'Hong Kong:16+::(self-applied)',
                  'Hungary:18',
                  'Iceland:16',
                  'India:18::(self-applied)',
                  'Indonesia:21+',
                  'Ireland:18::(some episodes, Season 1-2, 4-5 DVD)',
                  'Ireland:15::(some episodes, Season 3, 6 DVD)',
                  'Israel:16::(self-applied)',
                  'Italy:VM14::(self-applied)',
                  'Japan:R18+',
                  'Lithuania:N-16::(Netflix self-rating)',
                  'Mexico:C',
                  'Netherlands:16',
                  'New Zealand:R16::(most episodes, Season 1-3, 5-6 DVD)',
                  'New Zealand:M::(one episode)',
                  'New Zealand:R13::(some episodes)',
                  'New Zealand:R18::(some episodes, Season 4 DVD)',
                  'Norway:15::(DVD and Blu-ray rating)',
                  'Peru:18',
                  'Philippines:R-13::(Season 1-5, Part 1)',
                  'Philippines:R-16::(Season 5, Part 2)',
                  'Philippines:18+::(self-applied)',
                  'Poland:12',
                  'Portugal:M/16',
                  'Portugal:16',
                  'Russia:18+',
                  'Singapore:M18',
                  'Singapore:NC16::(final season)',
                  'South Africa:16',
                  'South Korea:19',
                  'Spain:16',
                  'Sweden:15::(DVD and Blu-ray rating)',
                  'Taiwan:15+',
                  'Thailand:20::(seasons 1-3)',
                  'Thailand:15::(seasons 4-5)',
                  'Turkey:18+::(self-applied)',
                  'United Kingdom:18',
                  'United Kingdom:15::(most episodes, Season 2-3, 5-6 DVD)',
                  'United Kingdom:12::(one episode)',
                  'United Kingdom:18::(some episodes, Season 1, 4 DVD)',
                  'United States:TV-MA',
                  'United States:TV-MA',
                  'United States:TV-14::(some episodes)',
                  'Ukraine:18',
                  'United Arab Emirates:18+::(self-applied)',
                  'Vietnam:C18'],
 'color info': ['Color'],
 'countries': ['United States'],
 'country codes': ['us'],
 'cover url': 'https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_SX101_CR0,0,101,150_.jpg',
 'distributors': [<Company id:0019701[http] name:_American Movie Classics (AMC)_>,
                  <Company id:0340961[http] name:_5USA_>,
                  <Company id:0164664[http] name:_ARTE_>,
                  <Company id:0014456[http] name:_ARTE_>,
                  <Company id:0014456[http] name:_ARTE_>,
                  <Company id:0014456[http] name:_ARTE_>,
                  <Company id:0195106[http] name:_AXN_>,
                  <Company id:0195106[http] name:_AXN_>,
                  <Company id:0254806[http] name:_AXN_>,
                  <Company id:0337718[http] name:_Amazon Instant Video_>,
                  <Company id:0196006[http] name:_BeTV_>,
                  <Company id:0203432[http] name:_CNBC-e_>,
                  <Company id:0984867[http] name:_Chili Cinema_>,
                  <Company id:0429603[http] name:_Fiji Broadcasting_>,
                  <Company id:0441319[http] name:_Film1 Action_>,
                  <Company id:0365102[http] name:_Film1 Series_>,
                  <Company id:0187155[http] name:_Five US_>,
                  <Company id:0070925[http] name:_Fox Network_>,
                  <Company id:0289973[http] name:_Fuji TV NEXT_>,
                  <Company id:0879800[http] name:_Google Play_>,
                  <Company id:0390640[http] name:_HD suisse_>,
                  <Company id:0488997[http] name:_KVH Media Group_>,
                  <Company id:0851917[http] name:_MagentaTV_>,
                  <Company id:0916189[http] name:_Maxdome_>,
                  <Company id:0131820[http] name:_Monte Carlo Televisión - Canal 4_>,
                  <Company id:0982154[http] name:_NOW!_>,
                  <Company id:0029644[http] name:_Nelonen_>,
                  <Company id:0144901[http] name:_Netflix_>,
                  <Company id:0144901[http] name:_Netflix_>,
                  <Company id:0144901[http] name:_Netflix_>,
                  <Company id:0225813[http] name:_Nova Cinema_>,
                  <Company id:0204647[http] name:_ORF 1_>,
                  <Company id:0308019[http] name:_Orange Cinémax_>,
                  <Company id:0047950[http] name:_Paramount Comedy_>,
                  <Company id:0131276[http] name:_Pop TV_>,
                  <Company id:0304700[http] name:_Prime Series_>,
                  <Company id:0005774[http] name:_RTL Klub Televízió_>,
                  <Company id:0374655[http] name:_RTL Nitro_>,
                  <Company id:0899200[http] name:_Rakuten TV_>,
                  <Company id:0899200[http] name:_Rakuten TV_>,
                  <Company id:0492252[http] name:_SRF zwei_>,
                  <Company id:0015806[http] name:_Schweizer Fernsehen (SF)_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0137851[http] name:_Sony Pictures Home Entertainment_>,
                  <Company id:0533814[http] name:_Spike_>,
                  <Company id:0007113[http] name:_SundanceTV_>,
                  <Company id:0203290[http] name:_Super! Drama TV_>,
                  <Company id:0182488[http] name:_TV8_>,
                  <Company id:0440561[http] name:_Universal Channel_>,
                  <Company id:0375381[http] name:_Universal Sony Pictures Home Entertainment_>,
                  <Company id:0362812[http] name:_Videoload_>,
                  <Company id:0018439[http] name:_Vrijzinnig Protestantse Radio Omroep (VPRO)_>,
                  <Company id:0598530[http] name:_e2_>,
                  <Company id:0694131[http] name:_iTunes_>,
                  <Company id:0044989[http] name:_Österreichischer Rundfunk (ORF)_>],
 'genres': ['Crime', 'Drama', 'Thriller'],
 'imdbID': '0903747',
 'kind': 'tv series',
 'language codes': ['en', 'es'],
 'languages': ['English', 'Spanish'],
 'localized title': 'Breaking Bad',
 'number of seasons': 5,
 'original title': 'Breaking Bad',
 'other companies': [<Company id:0223824[http] name:_Absolut Video_>,
                     <Company id:0056883[http] name:_All Star Motion Picture Catering_>,
                     <Company id:0300363[http] name:_BT Industrial Supply_>,
                     <Company id:0008022[http] name:_Chapman/Leonard Studio Equipment_>,
                     <Company id:0008022[http] name:_Chapman/Leonard Studio Equipment_>,
                     <Company id:0012439[http] name:_Clairmont Camera Film & Digital_>,
                     <Company id:0211783[http] name:_DTC Grip & Electric_>,
                     <Company id:0594011[http] name:_Exchange Communications_>,
                     <Company id:0244588[http] name:_Filmtools_>,
                     <Company id:0184253[http] name:_Hear Kitty_>,
                     <Company id:0076640[http] name:_Keep Me Posted_>,
                     <Company id:0249155[http] name:_LCW Props_>,
                     <Company id:0306663[http] name:_Madison Gate Records_>,
                     <Company id:0306663[http] name:_Madison Gate Records_>,
                     <Company id:0200641[http] name:_PES Payroll_>,
                     <Company id:0009149[http] name:_Pacific Studios II_>,
                     <Company id:0244989[http] name:_Pigfactory_>,
                     <Company id:0709047[http] name:_Prop Movie Money_>,
                     <Company id:0234319[http] name:_ReadySetMedic.com_>,
                     <Company id:0208516[http] name:_Rockbottom Rentals_>,
                     <Company id:0208516[http] name:_Rockbottom Rentals_>,
                     <Company id:0208516[http] name:_Rockbottom Rentals_>,
                     <Company id:0296749[http] name:_Scenechronize_>,
                     <Company id:0029756[http] name:_Serious Grippage & Light_>,
                     <Company id:0248241[http] name:_Sony Pictures Stock Footage_>,
                     <Company id:0075800[http] name:_Soundtrack New York_>,
                     <Company id:0845233[http] name:_Studio Concierge_>,
                     <Company id:0136851[http] name:_The Domain Group_>,
                     <Company id:0449838[http] name:_inVision Subtitling_>],
 'plot': ['A chemistry teacher diagnosed with inoperable lung cancer turns to '
          'manufacturing and selling methamphetamine with a former student to '
          "secure his family's future.",
          'Walter White is a chemistry genius but works as a chemistry teacher '
          'at a high school in Albuquerque, New Mexico. His life drastically '
          "changes when he's diagnosed with stage III terminal lung cancer and "
          'given a prognosis of two years to live. To ensure that his pregnant '
          'wife and disabled teenage son have a financial future, he uses his '
          "chemistry background to create and sell the world's finest crystal "
          'methamphetamine. To sell his signature "blue meth," he teams up '
          'with Jesse Pinkman, a former student of his. The meth makes them '
          'very rich very quickly, but it attracts the attention of his DEA '
          "brother-in-law, Hank. As Walter and Jesse's status in the drug "
          'world escalates, Walter becomes a dangerous criminal, and Jesse '
          'becomes a hot-headed salesman. Hank is always hot on his tail, '
          'forcing Walter to devise new ways to cover his tracks.—halo1k, '
          'jackenyon',
          'A once-loyal father and chemistry teacher named Walter White turns '
          'to a life of crime due to developing Stage 3 terminal lung cancer. '
          'He has two years to live. Teaming up with one of his former '
          'students, Jesse Pinkman, he grows in power, battles anyone in his '
          'way, and raises a family - all while hiding from his '
          'brother-in-law, Hank, who works for the '
          'DEA.—joshchristian-142-732069'],
 'plot outline': 'Walter White is a chemistry genius but works as a chemistry '
                 'teacher at a high school in Albuquerque, New Mexico. His '
                 "life drastically changes when he's diagnosed with stage III "
                 'terminal lung cancer and given a prognosis of two years to '
                 'live. To ensure that his pregnant wife and disabled teenage '
                 'son have a financial future, he uses his chemistry '
                 "background to create and sell the world's finest crystal "
                 'methamphetamine. To sell his signature "blue meth," he teams '
                 'up with Jesse Pinkman, a former student of his. The meth '
                 'makes them very rich very quickly, but it attracts the '
                 'attention of his DEA brother-in-law, Hank. As Walter and '
                 "Jesse's status in the drug world escalates, Walter becomes a "
                 'dangerous criminal, and Jesse becomes a hot-headed salesman. '
                 'Hank is always hot on his tail, forcing Walter to devise new '
                 'ways to cover his tracks.',
 'production companies': [<Company id:0212797[http] name:_High Bridge Productions_>,
                          <Company id:0071947[http] name:_Gran Via Productions_>,
                          <Company id:0086397[http] name:_Sony Pictures Television_>,
                          <Company id:0019701[http] name:_American Movie Classics (AMC)_>],
 'rating': 9.5,
 'runtimes': ['45'],
 'seasons': ['1', '2', '3', '4', '5'],
 'series years': '2008-2013',
 'sound mix': ['Dolby Digital'],
 'special effects': [<Company id:0057238[http] name:_Velocity Visuals_>],
 'synopsis': ['Season 1A struggling high school chemistry teacher, Walter '
              'White (Bryan Cranston), is diagnosed with inoperable, advanced '
              'lung cancer. On a ride along with his DEA agent brother-in-law '
              'Hank Schrader (Dean Norris), Walter sees a former student of '
              'his, Jesse Pinkman (Aaron Paul), fleeing the scene of a meth '
              'lab. He later contacts Jesse and devises a scheme to become '
              'partners in an attempt to combine their skills to manufacture '
              'and distribute methamphetamine, with Walter cooking the product '
              'and Jesse using his street connections to distribute it. Walter '
              'says he wants to provide financial stability for his pregnant '
              'wife, Skyler (Anna Gunn) and disabled son, and to pay for his '
              "expensive cancer treatment. During Walter and Jesse's first "
              "days of selling Albuquerque's finest meth, they encounter a "
              'series of problems with local drug dealers. Walter takes to '
              'selling the meth he produces to a local druglord, Tuco '
              "Salamanca (Raymond Cruz), using the alias 'Heisenberg'.Season "
              '2Walter continues to find himself facing insurmountable medical '
              'bills from his cancer treatment. Despite having had several bad '
              'experiences while producing meth with Jesse, Walter agrees to '
              'rejoin his partner. The two begin producing meth but run into '
              "multiple problems. Jesse's friend Badger (Matt L. Jones) is "
              'arrested while selling meth in a sting operation. Walter hires '
              'a lawyer, Saul Goodman (Bob Odenkirk), to help Badger. Walter '
              'and Jesse drive a recreational vehicle into the desert and '
              "produce meth for four days. Later, Combo, another of Jesse's "
              'friends and distributors, is killed by a rival gang for selling '
              'meth in their territory. Saul suggests the two find a new '
              'distribution model. Throughout this, Jesse has been building a '
              'relationship with his neighbor and landlord, Jane Margolis '
              '(Krysten Ritter). Jane, who is a recovering addict, relapses '
              'and the two begin doing heroin. Saul finds them a new business '
              'partner, Gus Fring (Giancarlo Esposito), who is willing to pay '
              '$1.2 million for the 38 pounds of meth they produced. Walter '
              "hastily delivers the product to Gus, but misses his daughter's "
              "birth. Walt withholds Jesse's half of the money because of his "
              'drug use, but Jane finds out about it and blackmails Walt. Walt '
              "visits Jesse's house and witnesses Jane overdosing and choking "
              'on her own vomit, but perceiving her as an enemy, sits idly '
              'beside her and lets her die. Skyler confronts Walter about his '
              'frequent absences and excuses. She begins to piece together his '
              'secret life and demands that they separate.Season 3Walter '
              'wishes to reunite his family, but Skyler is still suspicious of '
              "Walter's second life. Walter believes he can mend the tension "
              'between them by confessing to her that he has been producing '
              'meth. Skyler is appalled by the confession and demands a formal '
              'divorce. Meanwhile, Gus offers to pay Walter $3M for three '
              'months of his service. He even offers to provide Walter with a '
              'state-of-the-art production facility and a brilliant lab '
              'assistant, Gale (David Costabile). Jesse is continuing to '
              'produce and sell meth by himself.Hank is working with the DEA '
              'to investigate Jesse and is slowly gathering evidence to make '
              "an arrest. He survives an assassination attempt made by Tuco's "
              'twin cousins and manages to kill one of his assailants and '
              'critically injure the other, who later dies in the hospital. '
              'Hank suffers critical wounds but survives.Jesse threatens to '
              'report Walter to the police if he is arrested, but Walter '
              "offers him Gale's position at the lab. After obtaining the "
              'position, Jesse begins stealing meth from the lab and selling '
              'it in secret on the side. Jesse gets romantically involved with '
              'a woman he meets in his rehab group and learns her kid brother, '
              'age 11, was put up by Gus and his street dealers to kill Combo. '
              'Jesse decides to avenge Combo. Walter aids Jesse in escaping '
              "from Gus's wrath. Gus begins to lose trust in Walter and asks "
              'Gale to take over the lab. He orders his henchmen to kill '
              'Walter and Jesse. After he is abducted by the henchmen, Walter '
              'instructs Jesse over the phone to kill Gale in order to force '
              'Gus not to kill Walter (and, by extension, Jesse) lest he '
              'eliminate his only remaining trained chemist.Season 4Jesse '
              "follows Walter's instructions and murders Gale. Gus decides to "
              'discipline the two by enforcing stricter policies at the lab. '
              "He also tries to break Walter and Jesse's friendship by "
              'assigning them to separate work details. While Walter works in '
              "the meth lab, Jesse escorts Mike (Jonathan Banks), one of Gus's "
              'enforcers, to retrieve payments and provide back-up. Walter and '
              'Jesse become increasingly distant from, and hostile to, each '
              'other. Meanwhile, Hank, who has been recovering from his last '
              'engagement with the cartel, finds evidence linking Gale to Gus. '
              'He believes Gus is a major drug distributor and starts looking '
              "for tangible evidence to file charges. Gus realizes Walter's "
              'close ties with Hank could jeopardize his entire operation. Gus '
              'fires Walter and informs him Hank will be killed. He also warns '
              'Walter that if he intervenes his entire family will be '
              'murdered. Jesse and Walter put their differences aside and '
              'agree to murder Gus, convincing former cartel enforcer Hector '
              'Salamanca to detonate a suicide bomb; Hector succeeds in this '
              "endeavor, killing himself, Gus, and Tyrus, Gus's henchman. "
              'Walter and Jesse then destroy the meth lab and Walter declares '
              'to his wife, "I won."Season 5Following Gus Fring\'s death, '
              'Walter partners with Jesse and Mike to create a new meth '
              'production and distribution operation. Mike handles all '
              'business aspects of the partnership, while Walter and Jesse '
              'work with a team of house fumigators to produce meth in tented '
              'houses. Hank and the DEA are able to identify nine prison '
              'inmates and one lawyer with criminal ties to Mike. Walter kills '
              "Mike, and is fearful that the informants will flip on Walter's "
              'operation since Mike is no longer able to pay them to keep '
              'quiet. He hires Jack Welker, the leader of a neo-Nazi gang, to '
              "kill the ten informants from within prison. Walter's business "
              'continues unimpeded until he decides to retire after accruing '
              '$80 million, which he buries in the desert.Later, Hank is '
              "invited to the Whites' home, where he unintentionally stumbles "
              "upon one of Walter's books with a signed message from Gale "
              'Boetticher. He realizes that Walter is the infamous Heisenberg '
              'and secretly restarts the investigation. Hank forms an alliance '
              'with Jesse, who now despises Walter for all his wrongdoings. '
              'Left with no options, Walter hires Jack again to murder Jesse. '
              'Walter attempts to confront Jesse in the desert, but instead '
              'Hank traps and arrests him. The neo-Nazi gang arrives and '
              'engages Hank in a fierce firefight. Jack executes Hank despite '
              "Walter's pleas. Jesse is captured and forced into slavery, "
              'producing meth for the gang. Before leaving, Jack and his gang '
              "take a majority of Walter's money, leaving him with only $11 "
              "million.Skyler and Walter Jr. are distraught over Hank's death "
              'and hold Walter accountable. They refuse to leave Albuquerque '
              'with Walter and instead contact the police. Walter spends the '
              'next several months hiding in a cabin in New Hampshire while '
              'struggling with cancer. He returns to New Mexico in order to '
              'visit his family one final time and seek revenge against Jack. '
              "Later that night, Walter executes all of the gang's members and "
              'frees Jesse, who escapes from the compound before the police '
              'arrive. Walter realizes he is mortally wounded from a gunshot '
              'and slowly succumbs to his injury as the police search the '
              'compound.'],
 'title': 'Breaking Bad',
 'videos': ['http://www.imdb.com/title/tt0903747/videoplayer/vi2624111385',
            'http://www.imdb.com/title/tt0903747/videoplayer/vi3743007513'],
 'votes': 2326262,
 'writer': [<Person id:0319213[http] name:_Vince Gilligan_>,
            <Person id:0319213[http] name:_Vince Gilligan_>,
            <Person id:0332467[http] name:_Peter Gould_>],
 'year': 2008}
```
