ORG 800H

; Napisz program znajdujacy najwieksza liczbe w 4-elementowej tablicy:
; 1. Zdefiniuj w pamieci dane:
;    - TABELA DB 15, 42, 8, 29
;    - MAX DB 0
; 2. Zaladuj pierwszy element z TABELA do akumulatora A
;    (bedzie to nasze poczatkowe maksimum).
; 3. Ustaw wskaznik HL na tablice i przesun go na drugi element (INX H).
; 4. Zaladuj licznik obiegow petli (pozostaly 3 elementy do sprawdzenia, wiec MVI C,3).
; 5. W petli:
;    - Porownaj akumulator A z elementem pod adresem HL (CMP M).
;    - Jesli element w pamieci jest wiekszy, przepisz go do akumulatora (MOV A,M).
;    - Przesun wskaznik HL na kolejny bajt (INX H).
;    - Zmniejsz licznik C i powtarzaj petle (DCR C, JNZ).
; 6. Po wyjsciu z petli zapisz wynik z A do zmiennej MAX.
; 7. Zakoncz dzialanie programu (HLT).

        LXI H,TABELA
        MOV A,M
        INX H
        MVI C,3
PETLA
        CMP M
        JNC NEXT
        MOV A,M
NEXT
        INX H
        DCR C
        JNZ PETLA
        LXI H,MAX
        MOV M,A
        HLT
TABELA  DB 15,42,8,29
MAX     DB 0