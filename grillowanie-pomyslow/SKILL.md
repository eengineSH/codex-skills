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
2. Sprawdź narzędziami wszystkie fakty dostępne w środowisku zamiast pytać o nie człowieka.
3. Ustal cel, odbiorców, kryteria sukcesu oraz ograniczenia techniczne, biznesowe i operacyjne.
4. Zbuduj drzewo istotnych decyzji i rozwiązuj je w kolejności wynikającej z zależności.
5. Jeśli temat obejmuje kilka niezależnych projektów, zaproponuj podział przed dalszym grillowaniem.

### 2. Grilluj decyzje

1. Zadawaj dokładnie jedno główne pytanie naraz.
2. Gdy istnieje realny wybór, przedstaw jedną konkretną rekomendację z krótkim uzasadnieniem i zakończ pytaniem `Zgoda? (tak/nie)`. Gdy rekomendacja jest już jedyną sensowną odpowiedzią albo wynika z wcześniejszych ustaleń, przyjmij ją bez pytania.
3. Po odpowiedzi `nie` dopiero w następnym pytaniu ustal alternatywę.
4. Gdy istnieje rzeczywisty wybór, pozwól odpowiedzieć numerem albo pojedynczym słowem.
5. Przy realnych wariantach krótko opisz dla każdego: co robimy, zysk, koszt albo ryzyko oraz kiedy warto go wybrać.
6. Użyj pytania otwartego tylko wtedy, gdy krótkiego wyboru nie da się sensownie sformułować.
7. Nie wymagaj stałej liczby wariantów i nie łącz alternatyw w jedno długie pytanie wymagające odpowiedzi całym zdaniem.
8. Przy każdym formacie pytania wskaż rekomendowane rozstrzygnięcie i krótko je uzasadnij.
9. Przejdź przez każdą istotną gałąź dotyczącą zakresu, danych, architektury, błędów, wdrożenia, testów i ryzyk, ale nie pytaj o rozstrzygnięcia bez wpływu na rozwiązanie.

### 3. Przejdź do specyfikacji

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
5. upewnij się, że specyfikacja opisuje jeden spójny etap.

## Zapis w GitHub Issue

1. Użyj jednoznacznie powiązanego issue, jeśli istnieje.
2. Edytuj istniejący źródłowy komentarz specyfikacji zamiast tworzyć duplikat.
3. Jeśli issue nie istnieje, utwórz je automatycznie bez pytania o miejsce zapisu.
4. Umieść pełną specyfikację w jednym źródłowym komentarzu, nigdy w opisie issue.
5. Respektuj lokalne zasady typu issue, priorytetu, etykiet i dostępu do GitHuba.
6. Po zapisie odczytaj komentarz i sprawdź format Markdown.
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
