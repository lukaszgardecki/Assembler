# Wyświetlanie tekstu w konsoli (8086 Assembly)

Prosty program napisany w 16-bitowym asemblerze (TASM) dla architektury Intel 8086 / MS-DOS.

## 1. Co robi program?
Program inicjalizuje segmenty danych oraz stosu, a następnie wyświetla na ekranie konsoli zdefiniowany wcześniej w pamięci ciąg znaków składający się z dwóch wierszy. Po wypisaniu tekstu program natychmiast kończy swoje działanie (z kodem powrotu `0`) i wraca do wiersza poleceń DOS.

## 2. Wejście i wyjście
- **Wejście:** Brak — program nie pobiera żadnych danych od użytkownika ani nie oczekuje na naciśnięcie klawisza.
- **Wyjście:** Dwuliniowy komunikat tekstowy wyświetlony na standardowym wyjściu (ekranie konsoli) za pomocą przerwania systemowego DOS (`int 21h`, funkcja `09h`):
  ```text
  Hellow world
  Druga linia
  ```

## 3. Uruchomienie (DOSBox + TASM)
```bat
tasm pierwszy.asm
tlink pierwszy.obj
pierwszy.exe
```