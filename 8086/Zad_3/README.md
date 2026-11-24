# Manipulacja pamięcią ekranu (VRAM) – Asembler 8086

Program napisany w asemblerze architektury x86 (kompilator TASM) dla środowiska DOS / DOSBox. Projekt demonstruje bezpośredni zapis do pamięci karty graficznej (`0B800h`) w trybie tekstowym 80×25, manipulację atrybutami kolorów bez utraty zawartości znaków (`STOSB`) oraz obsługę przerwań BIOS-u i DOS-u.

## Funkcjonalność programu

1. **Inicjalizacja ekranu:** Czyszczenie konsoli i przełączenie w standardowy tryb tekstowy `80×25` z czarnym tłem (`int 10h`, funkcja `00h`).
2. **Wypełnienie wzorcem:** Zapełnienie wszystkich 25 wierszy kolejnymi numerami linii (`01` do `25`) powtórzonymi 40 razy w każdym wierszu (łącznie 80 znaków na linię) przy użyciu instrukcji `STOSW`.
3. **Podświetlanie wierszy (`STOSB`):** Zmiana tła bieżącego wiersza na czerwone (`47h`) poprzez nadpisanie wyłącznie nieparzystych bajtów w pamięci ekranu (bajtów atrybutów), bez naruszania kodów znaków ASCII.
4. **Interakcja z klawiaturą:** Oczekiwanie na naciśnięcie dowolnego klawisza (`int 16h`, funkcja `00h`), przywrócenie czarnego tła (`07h`) oraz przejście do kolejnej linii (z zawinięciem po 25. wierszu).
5. **Zakończenie programu:** Naciśnięcie klawisza `ESC` (kod ASCII `27` / `1Bh`) kończy pętlę główną i zwraca kontrolę do systemu DOS (`int 21h`, funkcja `4Ch`).

## Wymagania

* Emulator środowiska DOS (np. **DOSBox**) lub system zgodny z MS-DOS / FreeDOS.
* Kompilator **Turbo Assembler (TASM)** oraz linker **Turbo Linker (TLINK)**.

## Kompilacja i uruchomienie

Aby skompilować i uruchomić program w środowisku DOSBox, wykonaj następujące polecenia w katalogu z plikiem źródłowym (`projekt.asm`):

```bat
tasm projekt.asm
tlink projekt.obj
projekt.exe