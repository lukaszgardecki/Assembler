ORG 800H

; Napisz program, ktory kopiuje 4-elementowa tablice ze zrodla do celu, modyfikujac kazda wartosc po drodze - dodaj 5 do kazdej kopiowanej liczby:
; 1. Zdefiniuj w pamieci dane:
;    - ZRODLO DB 10, 20, 30, 40
;    - CEL DB 0, 0, 0, 0
; 2. Przygotuj wskazniki oraz licznik petli.
; 3. W petli:
;    - Pobierz wartosc z tablicy zrodlowej.
;    - Zwieksz pobrana wartosc o 5.
;    - Zapisz zmodyfikowana wartosc do tablicy docelowej.
;    - Przesun wskazniki w pamieci.
;    - Obsluz petle dla wszystkich 4 elementow.
; 4. Zakoncz dzialanie programu.

        LXI H,ZRODLO
        LXI D,CEL
        MVI C,4
PETLA
        MOV A,M
        ADI 5
        STAX D
        INX H
        INX D
        DCR C
        JNZ PETLA
        HLT
ZRODLO  DB 10,20,30,40
CEL     DB 0,0,0,0