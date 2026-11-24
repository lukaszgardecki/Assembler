ORG 800H

; Napisz program wykonujacy kopiowanie warunkowe z jednej tablicy do drugiej:
; 1. Zdefiniuj w pamieci dane:
;    - ZRODLO DB 5, 25, 12, 40
;    - CEL DB 0, 0, 0, 0
; 2. Ustaw wskazniki pamieci na tablice zrodlowa oraz docelowa,
;    a takze przygotuj licznik petli na 4 elementy.
; 3. W petli:
;    - Pobierz kolejna liczbe z tablicy zrodlowej.
;    - Sprawdz, czy pobrana liczba jest wieksza niz 15.
;    - Jesli jest wieksza niz 15, zapisz ja bez zmian do odpowiadajacej komorki w tablicy docelowej.
;    - Jesli jest mniejsza lub rowna 15, zapisz w tablicy docelowej wartosc 0.
;    - Przesun oba wskazniki pamieci na kolejne bajty i zmniejsz licznik obiegow.
; 4. Zakoncz dzialanie programu.

        LXI H,ZRODLO
        LXI D,CEL
        MVI C,4
PETLA
        MOV A,M
        CPI 15
        JZ NIEWIEKSZA
        JC NIEWIEKSZA
        STAX D
NIEWIEKSZA
        INX H
        INX D
        DCR C
        JNZ PETLA
        HLT
ZRODLO  DB 5,25,12,40
CEL     DB 0,0,0,0