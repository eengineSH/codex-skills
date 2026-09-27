---
name: grillowanie-pomyslow
description: "Bezkompromisowo dopracuj pomysł, plan albo decyzję do kompletnej i wydajnej specyfikacji przez zależne pytania zadawane pojedynczo. Używaj tylko wtedy, gdy człowiek stosuje formę rdzenia grill, jego naturalną odmianę lub oczywistą literówkę, np. grillowanie, grilluj, zgrillujmy, grill lub grilling, albo gdy inny skill jawnie wywołuje $grillowanie-pomyslow."
---

# Grillowanie pomysłów

Zamień pomysł w jednoznaczną i wydajną specyfikację. Przeanalizuj wszystkie istotne gałęzie, ale przerywaj rozmowę tylko wtedy, gdy decyzja człowieka realnie zmienia rozwiązanie.

## Zasady

1. Dopasuj język do aktualnej rozmowy.
2. Nie implementuj, nie generuj szkieletu i nie zmieniaj kodu podczas grillowania.
3. Do implementacji przejdź dopiero po późniejszym, jednoznacznym poleceniu człowieka.
4. Pilnuj YAGNI. Nie dodawaj pobocznych funkcji ani refaktorów.
5. Przed każdym pytaniem wykonaj test konieczności: jeśli odpowiedź jednoznacznie wynika z wcześniejszych decyzji, celu, kodu, danych albo istniejącego zachowania, nie pytaj — ustal ją samodzielnie i zapisz w specyfikacji, z wyjątkiem pytań potrzebnych do osiągnięcia obowiązkowego minimum z etapu 3.
6. Poza obowiązkowym minimum z etapu 3 pytaj człowieka wyłącznie wtedy, gdy pozostają co najmniej dwa sensowne rozstrzygnięcia wpływające na zakres, zachowanie, koszt albo ryzyko.
7. Fakty, oczywiste szczegóły, naturalne konsekwencje ustaleń i drobne założenia ustalaj samodzielnie, a następnie zapisz je w specyfikacji.
8. Nie uruchamiaj subagentów kodujących podczas grillowania. Sam fakt grillowania, tworzenia issue, checklisty albo specyfikacji nie jest zgodą na ich użycie.
9. Jeśli człowiek sam wskaże podczas grillowania lub spisywania specyfikacji, że realizacja ma używać subagentów kodujących, zapisz tę decyzję w specyfikacji. Nie proponuj jej i nie dopisuj z własnej inicjatywy.
10. Traktuj ekonomię całego procesu realizacji jako część rozwiązania. Dobieraj bramy jakości proporcjonalnie do ryzyka; maksymalna liczba kontroli nie jest celem.
11. Traktuj każdą materialną informację otrzymaną na początku i w trakcie grillowania jako twierdzenie do oceny, nie jako automatycznie prawdziwy fakt ani optymalne rozstrzygnięcie. Dotyczy to także pewnie sformułowanych diagnoz, ograniczeń, preferowanych technik i odpowiedzi człowieka.
12. Weryfikuj takie twierdzenia względem dostępnego kodu, danych, dokumentacji, zachowania systemu, celu i wcześniejszych ustaleń. Aktywnie szukaj sprzeczności, brakujących założeń, skutków ubocznych i prostszego albo bezpieczniejszego wariantu.
13. Gdy twierdzenie jest nieweryfikowalne, niespójne, ryzykowne albo prowadzi do gorszego rozwiązania, powiedz to wprost, podaj konkretny dowód lub tok rozumowania oraz zarekomenduj korektę. Nie potwierdzaj propozycji tylko dlatego, że pochodzi od człowieka.
14. Nie zmieniaj jednak świadomie podtrzymanej decyzji człowieka po cichu. Po przedstawieniu zastrzeżenia i konsekwencji potraktuj potwierdzony wybór jako wiążącą decyzję produktową, o ile nie narusza nadrzędnych zasad bezpieczeństwa lub uprawnień. Restart grillowania po korekcie faktow technicznych nie uniewaznia jawnych wymagan czlowieka. Nie zastepuj ich nowym celem, np. benchmarkiem albo wyborem produktu, bez wskazanego przez czlowieka problemu lub konkretnej sprzecznosci wymagajacej rozstrzygniecia.
15. Zapisuj specyfikację jako kontrakt zmiany: opisuj wyłącznie elementy, które mają zostać dodane, zmienione albo usunięte. Istniejące mechanizmy, których implementacja ma pozostać nietknięta, wymień z nazwy w osobnej sekcji `Nie modyfikujemy`, bez opisywania ich działania ani przepisywania obecnej implementacji jako wymagań. Opisz istniejące zachowanie tylko wtedy, gdy jego konkretny niezmiennik jest niezbędny do zdefiniowania granicy, integracji albo kryterium akceptacji.
16. Grillowanie jest stanem trwałym aż do wyraźnego zakończenia przez człowieka. Nie wolno uznać go za zakończone na podstawie samej diagnozy, rekomendacji, wyczerpania pytań, przygotowania albo zapisania specyfikacji, braku odpowiedzi ani własnej oceny kompletności. Zakończenie wymaga jednoznacznej wypowiedzi człowieka: akceptacji specyfikacji, polecenia implementacji według bieżącej specyfikacji albo jawnego przerwania/anulowania grillowania. Po każdej innej wypowiedzi należy kontynuować grillowanie lub odpowiedzieć i wrócić do jego bieżącego etapu.

## Przebieg

### 1. Zbierz kontekst

1. Przed analiza merytoryczna odczytaj instrukcje projektu i ustal katalog glowny Git, galezie, status zmian oraz wykorzystanie checkoutu przez inne zadania.
2. Obowiazkowo wykonaj `git pull` najnowszej wersji galezi domyslnej repozytorium albo galezi jawnie wskazanej przez czlowieka. Przy brudnym lub wspoldzielonym checkoutcie utworz wlasny worktree z osobna galezia i wykonaj pull tam; nie nadpisuj ani nie chowaj cudzych zmian. Sam `git fetch` nie zastepuje pulla w checkoutcie, na ktorym opierasz grillowanie. Jesli pull sie nie powiedzie, rozwiaz przyczyne albo zglos konkretna blokade; nie kontynuuj na starej wersji jako rzekomo aktualnej.
3. Po pullu zapisz w ledgerze repozytorium, galez i SHA analizowanej wersji. Na nowo odczytaj jej instrukcje, kod i dokumentacje. Pamiec sesji, starsze issue i lokalne kopie sa wskazowkami do weryfikacji, nie dowodem aktualnego stanu projektu. Po kolejnych zmianach zdalnych podczas grillowania odswiez baze i sprawdz wplyw na ustalenia.
4. Dla dzialajacej uslugi potwierdz osobno host, aktywna instancje i wersje wdrozonego kodu. Porownaj je ze swieza wersja repozytorium; opisz rozbieznosci przed sformulowaniem rekomendacji. Nie utozsamiaj zatrzymanej kopii kontenera ani samej konfiguracji modelu z aktywnym wdrozeniem.

5. Przeczytaj lokalne instrukcje, kod, dokumentację, issue i istniejące wzorce właściwe dla tematu.
6. Gdy grillowanie dotyczy GitHub issue, po odczytaniu jego pełnej treści i istotnych komentarzy natychmiast zmień nazwę bieżącego taska/czatu narzędziem do zarządzania taskami na `#<numer-issue> <krótka-nazwa>`.
7. Zbuduj krótką nazwę z treści issue, nie tylko z tytułu. Użyj najwyżej czterech słów i skróć ją do najkrótszej formy, która nadal jednoznacznie opisuje problem albo cel.
8. Zmień nazwę przed dalszą analizą i przed pierwszym pytaniem. Brak narzędzia do zmiany nazwy nie blokuje grillowania.
9. Sprawdź narzędziami wszystkie materialne twierdzenia możliwe do zweryfikowania w środowisku zamiast pytać o nie człowieka albo uznawać je za fakty.
10. Ustal cel, odbiorców, kryteria sukcesu oraz ograniczenia techniczne, biznesowe i operacyjne.
11. Zbuduj drzewo istotnych decyzji i rozwiązuj je w kolejności wynikającej z zależności.
12. Jeśli temat obejmuje kilka niezależnych projektów, zaproponuj podział przed dalszym grillowaniem.
13. Zmapuj kosztowne lub długo trwające bramy: build, szerokie testy, review, CI, deploy, migracje, testy środowiskowe i pomiary zewnętrzne.

### 2. Przedstaw punkt wyjścia

Przed pierwszym pytaniem przedstaw człowiekowi swój punkt widzenia po zebraniu kontekstu.

1. Użyj kilku numerowanych punktów, a w każdym krótkich podpunktów.
2. Przedstaw:
   - jak rozumiesz cel i oczekiwany rezultat;
   - najważniejsze fakty ustalone z issue, kodu, dokumentacji i danych;
   - rekomendowany kierunek rozwiązania wraz z krótkim uzasadnieniem;
   - założenia robocze i granice zakresu;
   - decyzje, których nie da się ustalić bez człowieka i które będą grillowane.
3. Wyraźnie odróżnij zweryfikowane fakty, niezweryfikowane twierdzenia, rekomendacje, decyzje człowieka i założenia. Nie przedstawiaj twierdzeń ani założeń jako faktów lub ustaleń.
4. Zachowaj zwięzłość. Nie twórz jeszcze specyfikacji ani szczegółowego planu implementacji.
5. Dopiero po tym wprowadzeniu zadaj pierwsze pytanie.

### 3. Grilluj decyzje

1. Zadawaj dokładnie jedno główne pytanie naraz.
2. Przed pierwszym pytaniem uszereguj nierozstrzygnięte decyzje malejąco według wpływu na całe issue. Najpierw pytaj o decyzje zmieniające cel, zakres, zachowanie, źródła prawdy, architekturę, koszt lub ryzyko wielu dalszych gałęzi; dopiero potem o lokalne szczegóły. Decyzja nadrzędna ma pierwszeństwo przed decyzją, którą warunkuje.
3. Po każdej odpowiedzi zaktualizuj ten ranking i jako następne zadaj pytanie o największym pozostałym wpływie.
4. W jednym grillowaniu zadaj co najmniej pięć pytań merytorycznych i kontynuuj ponad pięć, dopóki pozostają istotne nierozstrzygnięte decyzje. Pytanie o akceptację specyfikacji ani pytania proceduralne nie liczą się do minimum.
5. Jeśli analiza ujawnia mniej niż pięć realnych decyzji, wykorzystaj brakujące pytania do potwierdzenia najważniejszych założeń dotyczących celu, zakresu, kryteriów sukcesu, ryzyka lub wdrożenia. To obowiązkowe minimum ma pierwszeństwo przed testem konieczności z zasad 5–7, ale nie wolno wypełniać go pytaniami bez wpływu na issue.
6. Jedyny wyjątek od minimum zachodzi, gdy człowiek podczas zadawania pytań wyraźnie poleci, aby nie zadawać kolejnych lub od razu przejść do specyfikacji. Wtedy zakończ pytania niezależnie od ich liczby.
7. Dla zgłoszenia będącego bugiem pierwszym pytaniem po przedstawieniu punktu wyjścia zawsze ustal, czy specyfikacja ma zacząć się od osobnego etapu szybkiego przywrócenia działania przed pełną diagnozą i trwałą naprawą. Rekomenduj `tak`, gdy bug nadal blokuje albo istotnie degraduje wcześniej działające rozwiązanie i istnieje bezpieczny rollback lub workaround; w przeciwnym razie rekomenduj `nie`. Zakończ pytaniem `Zgoda? (tak/nie)`.
8. Gdy istnieje realny wybór, przedstaw jedną konkretną rekomendację z krótkim uzasadnieniem i zakończ pytaniem `Zgoda? (tak/nie)`. Gdy rekomendacja jest już jedyną sensowną odpowiedzią albo wynika z wcześniejszych ustaleń, przyjmij ją bez pytania, chyba że pytanie jest potrzebne do osiągnięcia obowiązkowego minimum.
9. Po odpowiedzi `nie` dopiero w następnym pytaniu ustal alternatywę.
10. Gdy istnieje rzeczywisty wybór, pozwól odpowiedzieć numerem albo pojedynczym słowem.
11. Przy realnych wariantach krótko opisz dla każdego: co robimy, zysk, koszt albo ryzyko oraz kiedy warto go wybrać.
12. Użyj pytania otwartego tylko wtedy, gdy krótkiego wyboru nie da się sensownie sformułować.
13. Nie wymagaj stałej liczby wariantów i nie łącz alternatyw w jedno długie pytanie wymagające odpowiedzi całym zdaniem.
14. Przy każdym formacie pytania wskaż rekomendowane rozstrzygnięcie i krótko je uzasadnij.
15. Przejdź przez każdą istotną gałąź dotyczącą zakresu, danych, architektury, błędów, wdrożenia, testów i ryzyk, ale nie pytaj o rozstrzygnięcia bez wpływu na rozwiązanie.
16. Po każdej odpowiedzi człowieka ponownie sprawdź jej spójność z celem, dowodami i pozostałymi decyzjami. Jeśli ujawnia błąd, sprzeczność albo wyraźnie lepszy wariant, zakwestionuj ją przed zapisaniem jako decyzji; jeśli jest spójna, kontynuuj bez ceremonialnego potwierdzania.

### 4. Zaprojektuj ekonomię realizacji

1. Podziel bramy jakości na:
   - szybkie kontrole wykonywane po pojedynczej zmianie;
   - kontrole integracyjne wykonywane po spójnej paczce;
   - kosztowne bramy wykonywane raz na release albo inną uzasadnioną granicę ryzyka.
2. Policz planowaną liczbę pełnych buildów, szerokich suite'ów testów, review, przebiegów CI, deployów, migracji, testów środowiskowych i pomiarów zewnętrznych w całym zadaniu. Wskaż dominujące koszty.
3. Domyślnie grupuj niskoryzykowne zmiany o wspólnym celu, runtime i kryterium akceptacji w możliwie dużą spójną, nadal przeglądalną paczkę. Nie uruchamiaj pełnego lifecycle dla każdego checkboxa ani drobnego commita.
4. Zachowaj możliwość izolacji błędu i częściowego rollbacku przez atomowe commity albo równoważne checkpointy oraz szybkie testy celowane po każdej zmianie.
5. Wydziel osobną paczkę lub dodatkową bramę tylko wtedy, gdy istnieje konkretna granica ryzyka, np. bezpieczeństwo, utrata danych, pieniądze, migracja, współbieżność, dostępność albo publiczna kompatybilność.
6. Porównaj plan z prostszym bezpiecznym przebiegiem. Każde dodatkowe powtórzenie kosztownej bramy musi mieć zapisane uzasadnienie ryzykiem lub zależnością.
7. Jeśli dwa warianty procesu różnią się istotnie kosztem lub ryzykiem i nie da się wybrać na podstawie danych, rozstrzygnij je podczas grillowania jednym pytaniem.

### 5. Opracuj makiety interfejsu

Wykonaj ten etap po rozstrzygnięciu zachowania, danych i interakcji, ale przed finalną specyfikacją, jeśli rozwiązanie:

- dodaje ekran, widok, formularz, dialog, panel albo istotny komponent;
- zmienia hierarchię, układ, nawigację, dostępne akcje albo sposób ich odkrywania;
- dodaje istotny przepływ użytkownika lub strukturalnie odmienny stan;
- zmienia zachowanie responsywne albo adaptację platformową.

Pomiń makietę dla zmian bez UI oraz kosmetycznych zmian tekstu bez wpływu na układ, komponenty lub interakcje. W specyfikacji krótko uzasadnij pominięcie, jeśli zmiana dotyka UI, ale nie spełnia powyższych warunków.

#### Przygotowanie

1. Przeczytaj właściwy design system, dokumentację UI, istniejące ekrany i dostępne assety.
2. Zidentyfikuj nowe lub istotnie zmieniane ekrany, ich strukturalnie odmienne stany, platformy i referencyjne viewporty.
3. Traktuj pracę nad każdą specyfikacją obejmującą UI jako stałą zgodę człowieka na przygotowanie graficznych makiet. Automatycznie wypracuj je z człowiekiem i nigdy nie pytaj, czy chce makiety ani czy wolno je wygenerować.
4. Traktuj pracę nad specyfikacją UI, wizualizacją lub makietą jako bezwzględną i stałą zgodę człowieka na użycie przeglądarki i Playwrighta bez ponownego pytania. Przed projektowaniem zawsze otwórz aktualny sklep, panel albo serwis i wykonaj referencyjne zrzuty rzeczywistych ekranów we właściwych viewportach i stanach.
5. Jeśli `gpt-image-2` jest dostępny, użyj go do jednego wstępnego przebiegu koncepcyjnego. Dla zmiany istniejącego UI podaj referencyjny zrzut jako edit target i każ zachować całe otoczenie; dla nowego ekranu podaj pełny kontrakt i design system. Preferuj dostęp przez skonfigurowany CLIProxy przed kluczem bezpośrednim.
6. Traktuj wynik `gpt-image-2` wyłącznie jako inspirację do układu, hierarchii i kompozycji. Nie pokazuj go do zatwierdzenia, nie publikuj w issue, nie commituj i nie używaj jako źródła prawdy. Jeśli model jest niedostępny, pomiń ten przebieg bez zastępowania go innym generatorem obrazu.
7. Na podstawie zweryfikowanego widoku i przydatnych elementów koncepcji przygotuj właściwą makietę jako deterministycznie renderowany screen z docelowych komponentów, HTML/CSS albo właściwego narzędzia wizualizacyjnego. Jeśli używasz osobnego skilla lub narzędzia do wizualizacji, najpierw przeczytaj jego instrukcję.
8. Używaj istniejących komponentów, tokenów i dostarczonych assetów. Buduj makiety na referencyjnych zrzutach: zachowaj wspólne elementy jako nienaruszalną bazę i umieszczaj projektowane elementy wyłącznie w obszarze objętym zmianą.
9. Gdy makieta dotyczy zmiany w istniejącym UI, pokazuj otoczenie tylko jako wierne wizualnie i strukturalnie odwzorowanie rzeczywistego, zweryfikowanego widoku. Nigdy go nie zgaduj, nie upraszczaj ani nie zastępuj umowną wersją. Jeśli nie masz wiarygodnego źródła, pomiń wspólne elementy i jawnie ogranicz makietę do zmienianego obszaru; jeśli bez kontekstu nie da się rzetelnie ocenić projektu, zatrzymaj etap makiet zamiast tworzyć fikcyjne otoczenie.
10. Dla webu przygotuj desktop i mobile tylko wtedy, gdy układ się różni; tablet tylko przy osobnym układzie lub zachowaniu.
11. Dla aplikacji native przygotuj jedną wspólną makietę mobile, a osobne iOS/Android tylko przy realnej różnicy platformowej. Uwzględnij safe area, skalowanie tekstu i minimalne touch targety.
12. Przygotuj osobny screen dla stanu zmieniającego strukturę lub dostępne akcje. Drobny loading, walidację pola i różnicę kosmetyczną opisz adnotacją.

#### Równoległa brama jakości

1. Dla każdej nowej albo poprawionej wersji makiety uruchom nowego, niezależnego subagenta-reviewera tylko do odczytu na najmocniejszym dostępnym modelu z reasoning `high`; reviewer nie może uczestniczyć w projektowaniu tej wersji.
2. Przekaż reviewerowi surową makietę, jej identyfikator wersji, kontrakt, referencyjne viewporty i stany oraz zrzuty rzeczywistego miejsca osadzenia. Nie przekazuj własnej oceny, oczekiwanego werdyktu ani uzasadnień autora.
3. Reviewer ma samodzielnie odczytać wszystkie właściwe `AGENTS.md` oraz wskazaną przez nie dokumentację UI, design systemu, responsywności, dostępności i testów. Streszczenie tych zasad przekazane przez autora nie zastępuje odczytu źródeł.
4. Reviewer ma porównać makietę z rzeczywistym widokiem we właściwych viewportach i stanach oraz sprawdzić:
   - zgodność z decyzjami człowieka, specyfikacją, kontraktem i wszystkimi właściwymi wytycznymi repozytorium;
   - estetyczne i strukturalne dopasowanie do rzeczywistego otoczenia: proporcje, gęstość, typografię, odstępy, kolory, hierarchię i użyte komponenty;
   - przepełnienie, nachodzenie, ucięcie, czytelność, ergonomię i dostępność w każdym wymaganym viewporcie i stanie;
   - brak regresji oraz niezamierzonych zmian poza projektowanym obszarem.
5. Pokaż człowiekowi sensowną wersję roboczą od razu po własnej kontroli, wyraźnie oznaczając ją jako `robocza` i wskazując, że równoległe review trwa. Nie czekaj na review ani odpowiedź człowieka i kontynuuj pracę automatycznie.
6. Jeśli człowiek jawnie zatwierdzi konkretną wersję roboczą, oznacz ją jako `zatwierdzona`, przerwij dalsze szlifowanie tej wersji i nie stosuj późniejszych uwag reviewera bez nowego polecenia człowieka.
7. Jeśli wersja nie została zatwierdzona, po każdej zasadnej uwadze popraw ją, nadaj nowy numer i uruchom od początku pełną kontrolę przez nowego niezależnego reviewera. Powtarzaj cykl bez limitu rund, aż reviewer jednoznacznie potwierdzi brak uwag.
8. Review subagenta nie zastępuje własnej kontroli: samodzielnie otwórz każdy render w wymaganych viewportach i sprawdź go wizualnie w rzeczywistym kontekście przed publikacją finalnej wersji.
9. Jeśli nie można uruchomić subagenta albo wiarygodnie sprawdzić rzeczywistego miejsca osadzenia, nadal możesz pokazać wersję roboczą z jednoznaczną adnotacją o ograniczeniu; nie finalizuj jej bez jawnej akceptacji człowieka.

#### Iteracja i zatwierdzenie

1. Pokazuj na chacie jeden ekran albo jeden krótki, spójny flow naraz.
2. Nadaj każdej makiecie stabilny identyfikator, platformę, viewport lub klasę urządzenia, numer wersji i status `robocza`, `zastąpiona` albo `zatwierdzona`, np. `VEHICLES-WEB-DESKTOP-v3 — zatwierdzona`.
3. Poprawiaj makiety zgodnie z kolejnymi ustaleniami i jawnie zastępuj poprzednie wersje.
4. Nie zatrzymuj pracy, aby prosić o zatwierdzenie. Człowiek może zatwierdzić pokazaną wersję w dowolnym momencie; brak odpowiedzi nie jest zatwierdzeniem.
5. Wersję bez jawnej akceptacji możesz uznać za finalną po review bez uwag i własnej kontroli. Nie przechodź do specyfikacji, dopóki każda wymagana makieta nie jest jawnie zatwierdzona albo finalna po czystym review.

#### Zapis i kontrakt

1. Traktuj chat jako miejsce prezentacji, nie jedyne miejsce przechowywania.
2. Przy specyfikacji w issue umieść każdą zatwierdzoną makietę bezpośrednio w komentarzu źródłowym jako widoczny obraz Markdown pod jednoznacznym identyfikatorem i podpisem. Sam link albo ścieżka nie wystarcza; źródłem obrazu może być załącznik issue albo stabilny adres pliku zapisanego w repo.
3. Dla plików zapisanych w repo domyślnie utwórz dedykowany branch `codex/issue-<numer>-mockups`, dodaj wyłącznie zatwierdzone PNG do `docs/mockups/issue-<numer>/` i osadzaj je niezmiennym adresem `https://github.com/<owner>/<repo>/blob/<commit-sha>/<ścieżka>?raw=1`, przypiętym do SHA commita zamiast nazwy brancha.
4. Jeśli lokalny worktree jest brudny albo pracuje na innym issue, utwórz blob, tree, commit i ref przez GitHub Git Data API z właściwym tokenem; nie przełączaj brancha i nie stage'uj cudzych zmian.
5. Przy pracy bez issue zapisz makiety w workspace i podlinkuj je w specyfikacji zwróconej na chacie.
6. Zapewnij przyszłemu agentowi kodującemu dostęp do pliku graficznego i odpowiadającego mu kontraktu.
7. Dla każdej zatwierdzonej makiety przygotuj kontrakt zawierający:
   - identyfikator, status, ścieżkę, platformę i referencyjny viewport;
   - cel ekranu, punkt wejścia i hierarchię komponentów;
   - mapowanie na komponenty design systemu;
   - wymiary, odstępy, wyrównania, przewijanie i przepełnienie;
   - typografię, tokeny kolorystyczne, ikony i istniejące assety;
   - dokładne teksty, etykiety i placeholdery;
   - akcje, interakcje i nawigację oraz stany włączone, wyłączone, puste, błędne i destrukcyjne; oznacz każdą niedotyczącą klasę jako `N/A`;
   - reguły responsywne, adaptacyjne, skalowanie tekstu i dostępność;
   - dopuszczalne różnice natywne i elementy wymagające ścisłej zgodności wizualnej.
8. Sprawdź zgodność grafiki z kontraktem. Nie publikuj sprzecznej pary; popraw ją przed finalizacją.
9. Jeśli nie możesz utworzyć lub trwale udostępnić wymaganej makiety, nie stosuj tekstowego fallbacku i nie finalizuj specyfikacji UI. Wskaż konkretną blokadę.

### 6. Przejdź do specyfikacji

Gdy nie pozostały nierozstrzygnięte decyzje oraz człowiek odpowiedział na co najmniej pięć pytań merytorycznych albo wyraźnie zakończył pytania wcześniej, napisz dokładnie:

`To były wszystkie pytania merytoryczne. Teraz przygotowuję specyfikację do akceptacji.`

Nie czekaj na potwierdzenie. Od razu przygotuj specyfikację.

Pierwszą kompletną wersję oznacz jako `wersja robocza do akceptacji`, nie jako zatwierdzoną specyfikację. Po jej zapisaniu, bezpośrednio przed pytaniem o akceptację, przedstaw człowiekowi zwarte podsumowanie wystarczające do świadomej decyzji: cel, zakres, najważniejsze decyzje i założenia, istotne elementy poza zakresem oraz przebieg realizacji i wdrożenia. Podsumowanie oraz pytanie `Czy akceptujesz tę specyfikację? (tak/nie)` umieść razem w finalnej wiadomości kończącej turn; nie rozdzielaj ich między status `commentary` i odpowiedź finalną, ponieważ statusy mogą zostać zwinięte. Finalna wiadomość musi być samowystarczalna. Nie zastępuj podsumowania samym linkiem do specyfikacji ani informacją, że została zapisana. Odpowiedź `tak` na pytanie o akceptację specyfikacji jest wyraźnym poleceniem zakończenia grillowania: zmień status na zatwierdzony i zaktualizuj metryczkę. Odpowiedź `nie` oznacza dalsze grillowanie, nadal po jednym pytaniu naraz. Samo przygotowanie, zapisanie albo opublikowanie wersji roboczej nigdy nie kończy grillowania.

## Specyfikacja

Każde grillowanie zakończ kompletną specyfikacją gotową do implementacji.

Dla buga zapisz odpowiedź na pierwsze pytanie jako jawną decyzję. Jeśli wybrano szybkie przywrócenie działania, zacznij plan i checklistę od osobnego etapu recovery: zachowanie dostępnych dowodów diagnostycznych, najmniejszy bezpieczny rollback lub workaround oraz weryfikacja odzyskanego działania. Dopiero kolejne etapy obejmują pełną diagnozę przyczyny, trwałą naprawę, ochronę przed regresją i uszczelnienie na przyszłość. Recovery nie zamyka buga i musi być oznaczone jako rozwiązanie tymczasowe. Jeśli wybrano brak recovery, zacznij od diagnozy i trwałej naprawy.

Zawsze opisz:

1. cel;
2. zakres i elementy poza zakresem;
3. kluczowe decyzje i założenia;
4. model danych;
5. kryteria akceptacji;
6. atomową checklistę implementacji i weryfikacji.

Zawsze dodaj sekcję `Plan realizacji i ekonomia procesu`, która zawiera:

1. podział zmian na spójne paczki oraz granice ryzyka wymagające osobnego przebiegu;
2. bramy `per zmiana`, `per paczka` i `per release`;
3. liczbę planowanych pełnych buildów, szerokich suite'ów testów, review, przebiegów CI, deployów, migracji, testów środowiskowych i pomiarów zewnętrznych;
4. atomowe checkpointy pozwalające izolować regresję lub wykonać częściowy rollback;
5. porównanie z prostszym bezpiecznym przebiegiem i uzasadnienie każdego dodatkowego powtórzenia kosztownej bramy.

Atomowość checklisty służy kompletności i śledzeniu postępu; nie oznacza osobnego pełnego lifecycle dla każdego checkboxa.

Decyzję o realizacji przez subagentów kodujących zapisz tylko wtedy, gdy człowiek wyraził ją wprost podczas grillowania lub spisywania specyfikacji. Brak takiej decyzji nie może być interpretowany jako dorozumiana zgoda dla zadania, które nie jest stricte koderskie.

Dodaj architekturę, migrację, rollout, rollback, monitoring, edge case'y i ryzyka tylko wtedy, gdy dotyczą tematu.

Jeśli rozwiązanie obejmuje UI, dodaj sekcję `Makiety interfejsu`. Dla każdej zatwierdzonej makiety osadź widoczny screen i jego kontrakt. Jeśli drobna zmiana UI nie wymagała makiety, zapisz krótkie uzasadnienie.

W atomowej checkliście implementacji UI wymagaj, aby agent kodujący:

1. otworzył każdą zatwierdzoną makietę przed kodowaniem danego ekranu;
2. przeczytał odpowiadający jej kontrakt;
3. użył wskazanych komponentów i tokenów;
4. dla webu wyrenderował działającą implementację w referencyjnym viewporcie przez Playwright, a dla native przez właściwy symulator, urządzenie lub render widgetu;
5. porównał z makietą wyłącznie nowe i zmieniane elementy oraz poprawił różnice w zaakceptowanym zakresie; nie zmieniał istniejącego UI, aby dopasować je do uproszczeń albo niedokładności makiety;
6. zweryfikował zachowanie między viewportami, istotne stany i dostępność;
7. nie odhaczył ekranu bez wykonanego porównania wizualnego.

### Model danych

Sekcja `Model danych` jest obowiązkowa. Opisz odpowiednio do tematu:

1. nowe i istniejące tabele;
2. logiczne pola i relacje;
3. źródła prawdy;
4. dane wymagane, opcjonalne, wyliczane i historyczne;
5. migrację istniejących danych;
6. wpływ na cache, indeksy, kolejki, raporty i integracje.

Jeśli rozwiązanie nie zmienia danych trwałych, napisz to wprost i krótko uzasadnij.

### Autoreview

Przed publikacją:

1. usuń placeholdery i otwarte pytania;
2. sprawdź spójność, jednoznaczność i kompletność;
3. sprawdź atomowość checkboxów i możliwość ich zweryfikowania;
4. usuń elementy niewynikające z celu, decyzji człowieka ani realnego ryzyka;
5. upewnij się, że specyfikacja opisuje jeden spójny etap;
6. dla UI sprawdź kompletność ekranów, strukturalnych stanów, platform i viewportów;
7. sprawdź, czy każda wymagana makieta jest zatwierdzona, dostępna i zgodna ze swoim kontraktem;
8. sprawdź, czy checklista kodowania wymaga otwarcia makiet, renderu referencyjnego i porównania wizualnego.
9. porównaj plan realizacji z najprostszym bezpiecznym przebiegiem i usuń mikro-paczki bez granicy ryzyka;
10. sprawdź, czy policzono wszystkie kosztowne bramy i czy żadna nie jest powtarzana po każdym drobnym commicie albo checkboxie bez konkretnego uzasadnienia.

## Zapis w GitHub Issue

Przed utworzeniem lub zmianą tekstu przeczytaj i zastosuj `~/.codex/skills/github-api-fast/references/github-entry-footer.md`.

1. Użyj jednoznacznie powiązanego issue, jeśli istnieje.
2. Edytuj istniejący źródłowy komentarz specyfikacji zamiast tworzyć duplikat.
3. Jeśli issue nie istnieje, utwórz je automatycznie bez pytania o miejsce zapisu, chyba że człowiek wyraźnie poleci pracę bez issue; wtedy zwróć pełną specyfikację w rozmowie i zachowaj trwałe odwołania do makiet.
4. Umieść pełną specyfikację w jednym źródłowym komentarzu, nigdy w opisie issue.
5. Respektuj lokalne zasady typu issue, priorytetu, etykiet i dostępu do GitHuba.
6. Po zapisie odczytaj komentarz, sprawdź format Markdown oraz potwierdź, że każdy screen renderuje się bezpośrednio w issue pod właściwym podpisem.
7. Jeśli zapis jest chwilowo niemożliwy, zwróć kompletną treść w rozmowie i jasno wskaż blokadę.

Do czasu akceptacji człowieka komentarz jest wersją roboczą z metryczką `akceptacja człowieka: **nie**` i nie jest źródłem zatwierdzonej specyfikacji. Jawne `tak` na pytanie o akceptację albo późniejsze polecenie kodowania według tej konkretnej wersji jest jej akceptacją; przed implementacją zaktualizuj status i metryczkę na `tak`.

## Podsumowanie

Po opublikowaniu specyfikacji albo zwróceniu jej w rozmowie jako fallbacku:

Przed wysłaniem finalnej odpowiedzi wykonaj bramę kompletności opisaną poniżej. Nie wysyłaj odpowiedzi, dopóki nie zawiera trwałego odwołania, wymaganego podsumowania oraz kompletnej drogi od aktualnego etapu do domknięcia całego problemu. Samo zatwierdzenie specyfikacji kończy grillowanie, ale nie oznacza zamknięcia issue ani rozwiązania problemu.

1. nie zastępuj pełnej specyfikacji podsumowaniem;
2. po specyfikacji dodaj osobną sekcję `Podsumowanie`;
3. podaj link do issue albo źródłowego komentarza, jeśli zapis na GitHubie się udał;
4. przy fallbacku krótko wskaż brak linku i jego przyczynę;
5. wypisz wyłącznie najważniejsze ustalenia jako numerowaną listę od 5 do 10 punktów;
6. grupuj informacje tematycznie;
7. użyj najwyżej 2–3 krótkich podpunktów w każdym punkcie podsumowania;
8. nie twórz płaskiej ściany równorzędnych wypunktowań;
9. nie mieszaj ustaleń ze szczegółami implementacyjnymi, które nie zmieniają rozumienia rozwiązania;
10. dla wersji roboczej po podsumowaniu zadaj wyłącznie wymagane pytanie o akceptację; dla wersji już zaakceptowanej nie dodawaj kolejnego pytania;
11. Nie wyliczaj niewykonanych czynności jako samodzielnych zastrzeżeń ani nie kończ podsumowania informacją typu `nie implementowano`, `nie zmieniono kodu` lub `nie wykonano wdrożenia`.
12. Zamiast tego dodaj sekcję `Rekomendowane kolejne kroki` z kompletną, uporządkowaną listą wszystkich działań pozostałych do pełnego domknięcia tematu.
13. Jeśli nic nie pozostało, napisz wprost, że temat jest domknięty i nie ma dalszych kroków.

Limit podpunktów dotyczy wyłącznie sekcji `Podsumowanie`, nie atomowej checklisty w specyfikacji.
