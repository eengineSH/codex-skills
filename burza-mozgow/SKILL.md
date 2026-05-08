---
name: burza-mozgow
description: "Używaj, gdy człowiek chce rozkminić pomysł, zrobić burzę mózgów, zaplanować funkcjonalność, omówić warianty architektury albo dopracować wymagania przed kodowaniem. Skill prowadzi rozmowę po polsku: najpierw kontekst i pytania, potem warianty, rekomendacja i projekt/specyfikacja, bez przechodzenia do implementacji bez osobnej zgody."
---

# Burza Mózgów

Ten skill pomaga zamienić luźny pomysł w jasny projekt działania. Celem nie jest szybkie kodowanie, tylko wspólne zrozumienie problemu, wariantów i kryteriów sukcesu.

## Kiedy Używać

Użyj tego skilla, gdy człowiek:

1. Prosi o burzę mózgów, rozkminę, analizę pomysłu albo zaplanowanie tematu.
2. Chce omówić nową funkcjonalność, integrację, zmianę zachowania albo architekturę.
3. Nie prosi jeszcze wprost o implementację.
4. Potrzebuje porównać warianty, ryzyka, kompromisy albo kolejność prac.

Jeśli człowiek wyraźnie prosi o kodowanie zaakceptowanego zadania, nie zatrzymuj się sztucznie na brainstormingu. W repozytorium nadal obowiązują lokalne instrukcje `AGENTS.md`, zwłaszcza reguły dotyczące specyfikacji, commitów i pushy.

## Twarde Zasady

1. Rozmawiaj po polsku.
2. Nie implementuj, nie twórz migracji, nie zmieniaj kodu i nie generuj szkieletu projektu w trakcie burzy mózgów.
3. Do implementacji przechodź dopiero po osobnej, wyraźnej decyzji człowieka.
4. Gdy temat dotyczy istniejącego repo, najpierw sprawdź lokalny kontekst: pliki, dokumentację, aktualny stan gałęzi, istniejące wzorce.
5. Pytaj pojedynczo. Jedna wiadomość powinna zawierać jedno główne pytanie.
6. Preferuj konkretne propozycje wyboru, ale nie wciskaj sztucznego multiple choice tam, gdzie lepsza jest odpowiedź opisowa.
7. Nie dodawaj niepotrzebnych funkcji. Pilnuj YAGNI.
8. Nie proponuj pobocznych refaktorów, jeśli nie służą bezpośrednio omawianemu celowi.

## Przebieg

1. Zbierz kontekst.
   - Przeczytaj lokalne instrukcje projektu, jeśli istnieją.
   - Sprawdź właściwe pliki, dokumenty, issue, komentarze albo aktualny kod.
   - Jeśli temat jest za duży na jedną zmianę, powiedz to wcześnie i zaproponuj podział.

2. Doprecyzuj cel.
   - Ustal, jaki problem rozwiązujemy.
   - Ustal dla kogo to jest.
   - Ustal, po czym poznamy, że rozwiązanie działa.
   - Ustal ograniczenia techniczne, operacyjne i biznesowe.

3. Zadawaj pytania pojedynczo.
   - Nie zalewaj człowieka listą naraz.
   - Jeśli odpowiedź na jedno pytanie zmienia następne pytania, poczekaj.
   - Gdy możesz, podaj 2-3 konkretne warianty odpowiedzi i krótkie konsekwencje.

4. Zaproponuj 2-3 podejścia.
   - Zacznij od rekomendowanego wariantu.
   - Dla każdego wariantu opisz:
     - co robimy
     - zysk
     - koszt albo ryzyko
     - kiedy ten wariant jest dobry

5. Zbuduj projekt rozwiązania.
   - Skala opisu ma pasować do złożoności tematu.
   - Dla prostych tematów wystarczy kilka akapitów.
   - Dla większych tematów podziel projekt na sekcje:
     - cel
     - zakres
     - poza zakresem
     - architektura
     - przepływ danych
     - przypadki użycia
     - błędy i edge case'y
     - migracja danych lub rollout
     - testy
     - ryzyka

6. Waliduj projekt etapami.
   - Po większej sekcji zapytaj, czy kierunek jest dobry.
   - Jeśli człowiek koryguje założenie, popraw projekt zamiast bronić poprzedniej wersji.

7. Dopiero po akceptacji zdecyduj, czy potrzebna jest specyfikacja.
   - Jeśli lokalne instrukcje wymagają specyfikacji, zaproponuj jej przygotowanie albo przygotuj ją zgodnie z tymi instrukcjami.
   - Nie commituj specyfikacji automatycznie.
   - Nie przechodź do kodowania tylko dlatego, że specyfikacja powstała.

8. Przed oddaniem specyfikacji człowiekowi zrób autoreview i popraw problemy inline.
   - Placeholdery: usuń `TODO`, `TBD`, puste sekcje i decyzje odłożone "na później".
   - Spójność: sprawdź, czy wymagania, architektura, przypadki użycia i testy nie przeczą sobie nawzajem.
   - Jednoznaczność: popraw wymagania, które można sensownie zinterpretować na dwa różne sposoby.
   - Scope: sprawdź, czy dokument opisuje jeden spójny etap, a nie kilka niezależnych projektów sklejonych razem.
   - YAGNI: usuń elementy, które nie wynikają z celu, decyzji człowieka ani realnego ryzyka implementacyjnego.
   - Kalibracja: flaguj i poprawiaj tylko rzeczy, które mogłyby realnie zepsuć planowanie albo implementację; nie rozdmuchuj stylistycznych drobiazgów.

## Jakość Projektu

Dobre zakończenie brainstormingu powinno dać odpowiedzi na pytania:

1. Co dokładnie budujemy albo zmieniamy?
2. Czego świadomie nie robimy?
3. Jakie dane są potrzebne?
4. Gdzie jest źródło prawdy?
5. Jakie moduły lub komponenty biorą udział?
6. Jak mierzymy sukces?
7. Jakie są najważniejsze ryzyka?
8. Jak bezpiecznie wdrożyć i wycofać zmianę?
9. Jak to przetestować?

## Praca W Istniejącym Kodzie

1. Najpierw poznaj istniejące wzorce.
2. Dopasuj projekt do obecnych granic modułów, konwencji i infrastruktury.
3. Jeśli istniejący kod ma problem, który bezpośrednio utrudnia zmianę, uwzględnij małe uporządkowanie w projekcie.
4. Nie proponuj szerokiego sprzątania przy okazji.
5. Jeśli dane produkcyjne, cron, kolejki, cache albo indeksy wyszukiwania są częścią tematu, od razu uwzględnij monitoring, rollback i koszt operacyjny.

## Antywzorce

1. "To proste, od razu zakoduję".
2. Pytanie o pięć rzeczy naraz.
3. Projekt bez kryteriów sukcesu.
4. Rekomendacja bez alternatyw.
5. Specyfikacja z otwartymi pytaniami.
6. Dopisywanie funkcji, których człowiek nie potrzebuje.
7. Ignorowanie lokalnych zasad repozytorium.

## Format Odpowiedzi

W czasie burzy mózgów pisz naturalnie, ale trzymaj strukturę tam, gdzie pomaga.

1. Krótko podsumuj, co już wiemy.
2. Nazwij decyzję, którą teraz trzeba podjąć.
3. Zadaj jedno pytanie albo pokaż 2-3 warianty.
4. Po zebraniu odpowiedzi przedstaw rekomendowany kierunek i uzasadnienie.

Nie kończ brainstormingu "gotowym planem implementacji", jeśli człowiek nadal eksploruje temat. Plan implementacji to osobny etap po akceptacji kierunku.
