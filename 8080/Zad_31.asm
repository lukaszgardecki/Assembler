ORG 800H

; Napisz program upakowujacy z jednej tablicy do drugiej tylko liczby nieparzyste:
; 1. Zdefiniuj w pamieci dane:
;    - ZRODLO DB 12, 7, 19, 4
;    - CEL DB 0, 0, 0, 0
; 2. Przygotuj wskazniki pamieci dla zrodla oraz celu, a takze licznik petli na 4 elementy.
; 3. Wykorzystaj poznana wyzej instrukcje do wyzerowania akumulatora przed startem, jesli tego potrzebujesz.
; 4. W petli:
;    - Pobierz kolejna liczbe ze zrodla.
;    - Sprawdz za pomoca operacji bitowej, czy liczba jest nieparzysta.
;    - Jesli jest parzysta, przeskocz zapis i nie przesuwaj wskaznika tablicy docelowej.
;    - Jesli jest nieparzysta, zapisz ja do tablicy docelowej i przesun wskaznik celu na kolejna wolna komorke.
;    - Wskaznik zrodla oraz licznik obiegow petli aktualizuj przy kazdym obiegu.
; 5. Zakoncz dzialanie programu.

        LXI H,ZRODLO
        LXI D,CEL
        MVI C,4
        XRA A
PETLA
        MOV A,M
        ANI 1
        JZ PARZYSTA
        MOV A,M
        STAX D
        INX D
PARZYSTA
        INX H
        DCR C
        JNZ PETLA
        HLT
ZRODLO  DB 12,7,19,4
CEL     DB 0,0,0,0