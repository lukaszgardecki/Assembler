ORG 800H

; Napisz program wyswietlajacy napis zakonczony bajtem 0 (tzw. NULL-terminated string),
; dzieki czemu petla nie potrzebuje z gory ustalonego licznika znakow:
; 1. Zdefiniuj w pamieci dane:
;    - NAPIS DB 72, 69, 76, 76, 79, 0 (kody ASCII dla liter 'H', 'E', 'L', 'L', 'O' oraz zero jako znacznik konca)
; 2. Ustaw wskaznik pamieci na poczatek NAPIS.
; 3. W petli:
;    - Pobierz kolejny znak z pamieci do akumulatora.
;    - Sprawdz operacja bitowa (bez modyfikowania zawartosci akumulatora), czy pobrana wartosc to zero.
;    - Jesli natrafisz na zero, przeskocz na koniec programu (przerwij petle).
;    - Jesli wartosc jest rozna od zera, wywolaj systemowa funkcje wyswietlania.
;    - Przesun wskaznik pamieci na nastepny znak i powtorz petle.
; 4. Zakoncz dzialanie programu.

        LXI H,NAPIS
        MVI C,6
PETLA
        MOV A,M
        CPI 0
        JZ KONIEC
        RST 1
        INX H
        DCR C
        JNZ PETLA
KONIEC
        HLT
NAPIS   DB 72,69,76,76,79,0