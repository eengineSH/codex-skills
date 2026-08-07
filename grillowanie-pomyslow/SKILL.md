---
name: grillowanie-pomyslow
description: "Bezkompromisowo dopracuj pomysł, plan albo decyzję do kompletnej specyfikacji przez zależne pytania zadawane pojedynczo. Używaj tylko wtedy, gdy człowiek stosuje formę rdzenia grill, jego naturalną odmianę lub oczywistą literówkę, np. grillowanie, grilluj, zgrillujmy, grill lub grilling, albo gdy inny skill jawnie wywołuje $grillowanie-pomyslow."
---

# Grillowanie pomysłów

Zamień pomysł w jednoznaczną specyfikację. Przeanalizuj wszystkie istotne gałęzie, ale przerywaj rozmowę tylko wtedy, gdy decyzja człowieka realnie zmienia rozwiązanie.

## Zasady

1. Dopasuj język do aktualnej rozmowy.
2. Nie implementuj, nie generuj szkieletu i nie zmieniaj kodu podczas grillowania.
3. Do implementacji przejdź dopiero po późniejszym, jednoznacznym poleceniu człowieka.
4. Pilnuj YAGNI. Nie dodawaj pobocznych funkcji ani refaktorów.
5. Przed każdym pytaniem wykonaj test konieczności: jeśli odpowiedź jednoznacznie wynika z wcześniejszych decyzji, celu, kodu, danych albo istniejącego zachowania, nie pytaj — ustal ją samodzielnie i zapisz w specyfikacji.
6. Pytaj człowieka wyłącznie wtedy, gdy pozostają co najmniej dwa sensowne rozstrzygnięcia wpływające na zakres, zachowanie, koszt albo ryzyko.
7. Fakty, oczywiste szczegóły, naturalne konsekwencje ustaleń i drobne założenia ustalaj samodzielnie, a następnie zapisz je w specyfikacji.

## Przebieg

### 1. Zbierz kontekst

1. Przeczytaj lokalne instrukcje, kod, dokumentację, issue i istniejące wzorce właściwe dla tematu.
2. Gdy grillowanie dotyczy GitHub issue, po odczytaniu jego pełnej treści i istotnych komentarzy natychmiast zmień nazwę bieżącego taska/czatu narzędziem do zarządzania taskami na `#<numer-issue> <krótka-nazwa>`.
3. Zbuduj krótką nazwę z treści issue, nie tylko z tytułu. Użyj najwyżej czterech słów i skróć ją do najkrótszej formy, która nadal jednoznacznie opisuje problem albo cel.
4. Zmień nazwę przed dalszą analizą i przed pierwszym pytaniem. Brak narzędzia do zmiany nazwy nie blokuje grillowania.
5. Sprawdź narzędziami wszystkie fakty dostępne w środowisku zamiast pytać o nie człowieka.
6. Ustal cel, odbiorców, kryteria sukcesu oraz ograniczenia techniczne, biznesowe i operacyjne.
7. Zbuduj drzewo istotnych decyzji i rozwiązuj je w kolejności wynikającej z zależności.
8. Jeśli temat obejmuje kilka niezależnych projektów, zaproponuj podział przed dalszym grillowaniem.

### 2. Przedstaw punkt wyjścia

Przed pierwszym pytaniem przedstaw człowiekowi swój punkt widzenia po zebraniu kontekstu.

1. Użyj kilku numerowanych punktów, a w każdym krótkich podpunktów.
2. Przedstaw:
   - jak rozumiesz cel i oczekiwany rezultat;
   - najważniejsze fakty ustalone z issue, kodu, dokumentacji i danych;
   - rekomendowany kierunek rozwiązania wraz z krótkim uzasadnieniem;
   - założenia robocze i granice zakresu;
   - decyzje, których nie da się ustalić bez człowieka i które będą grillowane.
3. Wyraźnie odróżnij fakty, rekomendacje i założenia. Nie przedstawiaj założeń jako ustaleń człowieka.
4. Zachowaj zwięzłość. Nie twórz jeszcze specyfikacji ani szczegółowego planu implementacji.
5. Dopiero po tym wprowadzeniu zadaj pierwsze pytanie.

### 3. Grilluj decyzje

1. Zadawaj dokładnie jedno główne pytanie naraz.
2. Gdy istnieje realny wybór, przedstaw jedną konkretną rekomendację z krótkim uzasadnieniem i zakończ pytaniem `Zgoda? (tak/nie)`. Gdy rekomendacja jest już jedyną sensowną odpowiedzią albo wynika z wcześniejszych ustaleń, przyjmij ją bez pytania.
3. Po odpowiedzi `nie` dopiero w następnym pytaniu ustal alternatywę.
4. Gdy istnieje rzeczywisty wybór, pozwól odpowiedzieć numerem albo pojedynczym słowem.
5. Przy realnych wariantach krótko opisz dla każdego: co robimy, zysk, koszt albo ryzyko oraz kiedy warto go wybrać.
6. Użyj pytania otwartego tylko wtedy, gdy krótkiego wyboru nie da się sensownie sformułować.
7. Nie wymagaj stałej liczby wariantów i nie łącz alternatyw w jedno długie pytanie wymagające odpowiedzi całym zdaniem.
8. Przy każdym formacie pytania wskaż rekomendowane rozstrzygnięcie i krótko je uzasadnij.
9. Przejdź przez każdą istotną gałąź dotyczącą zakresu, danych, architektury, błędów, wdrożenia, testów i ryzyk, ale nie pytaj o rozstrzygnięcia bez wpływu na rozwiązanie.

### 4. Opracuj makiety interfejsu

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
4. Przygotuj statyczne makiety low-fidelity jako deterministycznie renderowane screeny z komponentów, HTML/CSS albo właściwego narzędzia wizualizacyjnego. Jeśli używasz osobnego skilla lub narzędzia do wizualizacji, najpierw przeczytaj jego instrukcję.
5. Używaj istniejących komponentów, tokenów i dostarczonych assetów. Nie generuj całych ekranów modelem generującym obrazy ani nowych assetów graficznych bez wyraźnej prośby człowieka.
6. Gdy makieta dotyczy zmiany w istniejącym UI, odwzoruj otoczenie na podstawie rzeczywistego widoku i traktuj je jako nienaruszalny kontekst. Nie przeprojektowuj otoczenia ani nie twórz jego umownej wersji, która mogłaby zostać błędnie potraktowana jako cel implementacji.
7. Traktuj pracę nad specyfikacją UI, wizualizacją lub makietą jako stałą zgodę człowieka na użycie Playwrighta do odczytu rzeczywistych ekranów, weryfikacji zachowania, renderowania i wykonywania referencyjnych zrzutów. Używaj Playwrighta automatycznie, gdy pomaga zachować zgodność z istniejącym UI, i nigdy nie pytaj o zgodę na jego użycie w tym zakresie.
8. Dla webu przygotuj desktop i mobile tylko wtedy, gdy układ się różni; tablet tylko przy osobnym układzie lub zachowaniu.
9. Dla aplikacji native przygotuj jedną wspólną makietę mobile, a osobne iOS/Android tylko przy realnej różnicy platformowej. Uwzględnij safe area, skalowanie tekstu i minimalne touch targety.
10. Przygotuj osobny screen dla stanu zmieniającego strukturę lub dostępne akcje. Drobny loading, walidację pola i różnicę kosmetyczną opisz adnotacją.

#### Iteracja i zatwierdzenie

1. Pokazuj na chacie jeden ekran albo jeden krótki, spójny flow naraz.
2. Nadaj każdej makiecie stabilny identyfikator, platformę, viewport lub klasę urządzenia, numer wersji i status `robocza`, `zastąpiona` albo `zatwierdzona`, np. `VEHICLES-WEB-DESKTOP-v3 — zatwierdzona`.
3. Poprawiaj makiety zgodnie z kolejnymi ustaleniami i jawnie zastępuj poprzednie wersje.
4. Poproś o wyraźne zatwierdzenie docelowej wersji. Brak odpowiedzi lub przejście do kolejnego tematu nie oznacza zatwierdzenia.
5. Nie przechodź do finalnej specyfikacji, dopóki wszystkie wymagane makiety nie są zatwierdzone.

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

### 5. Przejdź do specyfikacji

Gdy nie pozostały nierozstrzygnięte decyzje, napisz dokładnie:

`To były wszystkie pytania. Teraz przygotowuję specyfikację.`

Nie czekaj na potwierdzenie. Od razu przygotuj specyfikację.

## Specyfikacja

Każde grillowanie zakończ kompletną specyfikacją gotową do implementacji.

Zawsze opisz:

1. cel;
2. zakres i elementy poza zakresem;
3. kluczowe decyzje i założenia;
4. model danych;
5. kryteria akceptacji;
6. atomową checklistę implementacji i weryfikacji.

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

## Zapis w GitHub Issue

1. Użyj jednoznacznie powiązanego issue, jeśli istnieje.
2. Edytuj istniejący źródłowy komentarz specyfikacji zamiast tworzyć duplikat.
3. Jeśli issue nie istnieje, utwórz je automatycznie bez pytania o miejsce zapisu, chyba że człowiek wyraźnie poleci pracę bez issue; wtedy zwróć pełną specyfikację w rozmowie i zachowaj trwałe odwołania do makiet.
4. Umieść pełną specyfikację w jednym źródłowym komentarzu, nigdy w opisie issue.
5. Respektuj lokalne zasady typu issue, priorytetu, etykiet i dostępu do GitHuba.
6. Po zapisie odczytaj komentarz, sprawdź format Markdown oraz potwierdź, że każdy screen renderuje się bezpośrednio w issue pod właściwym podpisem.
7. Jeśli zapis jest chwilowo niemożliwy, zwróć kompletną treść w rozmowie i jasno wskaż blokadę.

Nie pytaj o zatwierdzenie specyfikacji ani o osiągnięcie wspólnego zrozumienia. Późniejsze polecenie kodowania według specyfikacji jest jednocześnie jej akceptacją i zgodą na implementację.

## Podsumowanie

Po opublikowaniu specyfikacji albo zwróceniu jej w rozmowie jako fallbacku:

1. nie zastępuj pełnej specyfikacji podsumowaniem;
2. po specyfikacji dodaj osobną sekcję `Podsumowanie`;
3. podaj link do issue albo źródłowego komentarza, jeśli zapis na GitHubie się udał;
4. przy fallbacku krótko wskaż brak linku i jego przyczynę;
5. wypisz wyłącznie najważniejsze ustalenia jako numerowaną listę od 5 do 10 punktów;
6. grupuj informacje tematycznie;
7. użyj najwyżej 2–3 krótkich podpunktów w każdym punkcie podsumowania;
8. nie twórz płaskiej ściany równorzędnych wypunktowań;
9. nie mieszaj ustaleń ze szczegółami implementacyjnymi, które nie zmieniają rozumienia rozwiązania;
10. nie dodawaj pytania o akceptację ani kolejnego kroku wymagającego odpowiedzi.

Limit podpunktów dotyczy wyłącznie sekcji `Podsumowanie`, nie atomowej checklisty w specyfikacji.
