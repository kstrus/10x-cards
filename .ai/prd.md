# Dokument wymagań produktu (PRD) - Cards

## 1. Przegląd produktu
Cards to webowa aplikacja umożliwiająca tworzenie, generowanie przez AI oraz zarządzanie fiszkami edukacyjnymi. Produkt łączy w sobie możliwość manualnego tworzenia fiszek oraz automatycznego generowania propozycji przy użyciu sztucznej inteligencji, co przyspiesza proces przygotowywania materiałów edukacyjnych. System obejmuje również prosty system kont użytkowników, który pozwala na bezpieczne przechowywanie i zarządzanie fiszkami, a także integrację z gotowym algorytmem powtórek.

## 2. Problem użytkownika
Manualne tworzenie wysokiej jakości fiszek jest czasochłonne i wymaga dużego zaangażowania. Użytkownicy często mają trudności w wyborze odpowiednich treści oraz ich podziale na mniejsze porcje, co zniechęca do korzystania z efektywnej metody nauki, jaką jest spaced repetition.

## 3. Wymagania funkcjonalne
- Manualne tworzenie fiszek poprzez modal z dwoma polami:
  - Przód – maksymalnie 200 znaków
  - Tył – maksymalnie 500 znaków
  - Walidacja pól z odpowiednimi komunikatami o błędach
- Generowanie fiszek przez AI:
  - Umożliwienie wprowadzenia tekstu o długości od 1000 do 10000 znaków
  - Generowanie propozycji fiszek na podstawie wprowadzonego tekstu
  - Wyświetlanie wygenerowanych propozycji przed zapisem
  - Użytkownik może edytować, zaakceptować lub odrzucić propozycje
  - Zapis fiszki następuje dopiero po akceptacji przez użytkownika
- Przeglądanie, edycja i usuwanie fiszek:
  - Widok listy fiszek z funkcjami paginacji
  - Wbudowana wyszukiwarka umożliwiająca wyszukiwanie fiszek
  - Możliwość edycji treści istniejących fiszek
  - Opcja usuwania wybranych fiszek
- Zarządzanie kontami użytkowników:
  - Rejestracja, logowanie, zmiana hasła oraz usunięcie konta
  - Wykorzystanie danych takich jak email, nick i hasło
  - Bezpieczne uwierzytelnianie i autoryzacja użytkowników
- Integracja z gotowym algorytmem powtórek:
  - Synchronizacja fiszek z algorytmem bez konieczności rozwijania własnego rozwiązania
- Synchronizacja w czasie rzeczywistym:
  - Aktualizacja stanu fiszek (np. akceptacja, edycja) bez konieczności odświeżania strony

## 4. Granice produktu
- Brak opracowania własnego, zaawansowanego algorytmu powtórek (np. SuperMemo, Anki)
- Nie przewidujemy importu wielu formatów (PDF, DOCX, itp.)
- Funkcjonalność współdzielenia zestawów fiszek między użytkownikami nie jest częścią MVP
- Brak integracji z innymi platformami edukacyjnymi
- Aplikacja początkowo dostępna jedynie jako web – mobilne wersje nie są uwzględnione
- Szczegółowa dokumentacja techniczna integracji z algorytmem powtórek zostanie ustalona w późniejszym etapie
- Ostateczny wybór technologii backendowej pozostaje do ustalenia

## 5. Historyjki użytkowników

US-001
Tytuł: Manualne tworzenie fiszek
Opis: Jako użytkownik chcę tworzyć fiszki manualnie za pomocą modala, aby szybko wprowadzać własne materiały edukacyjne. Modal umożliwia wprowadzenie treści w polach "przód" (do 200 znaków) i "tył" (do 500 znaków) z odpowiednią walidacją.
Kryteria akceptacji:
- Modal jest dostępny po kliknięciu przycisku "Dodaj fiszkę".
- Pole "przód" akceptuje maksymalnie 200 znaków, a pole "tył" maksymalnie 500 znaków.
- System wyświetla komunikaty o błędach przy przekroczeniu limitów.
- Fiszka jest zapisywana wyłącznie po potwierdzeniu przez użytkownika.

US-002
Tytuł: Generowanie fiszek przez AI
Opis: Jako użytkownik chcę wprowadzić tekst o długości od 1000 do 10000 znaków i otrzymać propozycje fiszek generowanych przez AI, aby zaoszczędzić czas i wysiłek potrzebny na manualne tworzenie fiszek. Po wygenerowaniu, mogę edytować, zaakceptować lub odrzucić propozycje.
Kryteria akceptacji:
- Użytkownik może wprowadzić tekst w określonym polu wejściowym.
- AI generuje fiszki na podstawie wprowadzonego tekstu.
- Propozycje fiszek są wyświetlane przed zapisaniem ich do bazy.
- Użytkownik może edytować treść fiszek przed zatwierdzeniem.
- Użytkownik może odrzucić lub zaakceptować wygenerowane fiszki.

US-003
Tytuł: Przeglądanie, edycja i usuwanie fiszek
Opis: Jako użytkownik chcę przeglądać listę fiszek, a także mieć możliwość ich edycji i usunięcia, aby efektywnie zarządzać zgromadzonymi materiałami edukacyjnymi.
Kryteria akceptacji:
- Lista fiszek jest wyświetlana z opcją paginacji.
- Użytkownik może wyszukiwać fiszki według słów kluczowych.
- Funkcje edycji i usuwania działają poprawnie, umożliwiając modyfikację oraz usunięcie fiszki.

US-004
Tytuł: Zarządzanie kontem użytkownika
Opis: Jako użytkownik chcę mieć możliwość rejestracji, logowania, zmiany hasła oraz usunięcia konta, aby bezpiecznie korzystać z aplikacji i zarządzać swoimi fiszkami.
Kryteria akceptacji:
- Formularz rejestracji wymaga podania emaila, nicku i hasła.
- Proces logowania umożliwia uwierzytelnienie użytkownika.
- Użytkownik może zmienić swoje hasło po poprawnej weryfikacji.
- Użytkownik ma możliwość usunięcia swojego konta z aplikacji.
- Proces uwierzytelnienia i autoryzacji jest bezpieczny i zgodny z wymaganiami.

US-005
Tytuł: Synchronizacja w czasie rzeczywistym
Opis: Jako użytkownik chcę, aby zmiany stanu fiszek, takie jak akceptacja czy edycja, były synchronizowane w czasie rzeczywistym, co zapewnia natychmiastowe wyświetlanie aktualnych danych bez potrzeby odświeżania strony.
Kryteria akceptacji:
- Zmiany w obrębie fiszek są widoczne natychmiast po dokonaniu akcji.
- Interfejs użytkownika aktualizuje się w czasie rzeczywistym bez przeładowania strony.
- Synchronizacja danych przebiega płynnie podczas interakcji użytkownika.

## 6. Metryki sukcesu
- Co najmniej 75% fiszek wygenerowanych przez AI musi zostać zaakceptowanych przez użytkowników.
- Użytkownicy mają tworzyć minimum 75% fiszek za pomocą funkcji generowania przez AI.
- System loguje czasy generacji fiszek oraz interakcje użytkownika dla celów analitycznych.
