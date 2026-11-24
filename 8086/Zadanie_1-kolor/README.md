# Kolorowanie wiersza w trybie tekstowym (8086 Assembly)

Prosty program napisany w 16-bitowym asemblerze (TASM) dla architektury Intel 8086 / MS-DOS.

## 1. Co robi program?
Program zmienia wygląd 4. wiersza na ekranie konsoli w trybie tekstowym (80×25), ustawiając dla całej jego szerokości czerwone tło oraz żółty kolor tekstu. Po wykonaniu tej operacji program wstrzymuje działanie do momentu naciśnięcia dowolnego klawisza przez użytkownika, a następnie kończy pracę i wraca do wiersza poleceń DOS.

## 2. Wejście i wyjście
* **Wejście:** Naciśnięcie dowolnego klawisza na klawiaturze (sygnał do zakończenia programu). Program nie pobiera od użytkownika żadnych danych liczbowych ani tekstowych.
* **Wyjście:** Zmodyfikowany obraz na ekranie konsoli — czerwony pasek z żółtym tekstem na całej szerokości 4. linii ekranu.

## 3. Uruchomienie (DOSBox + TASM)
```bat
tasm kolor.asm
tlink kolor.obj
kolor.exe