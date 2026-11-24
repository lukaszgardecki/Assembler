ORG 800H

; Program sumujacy 4 kolejne liczby zapisane w pamieci z uzyciem petli oraz instrukcji INX H:
; 1. Zdefiniuj w pamieci dane:
;    - TABELA DB 5, 10, 15, 20
;    - SUMA DB 0
; 2. Przygotuj rejestry:
;    - Zaladuj licznik powtorzen petli (4) do rejestru C.
;    - Zaladuj adres TABELA do HL.
;    - Wyzeruj akumulator A (MVI A,0).
; 3. W petli:
;    - Dodaj wartosc spod aktualnego adresu HL do akumulatora (ADD M).
;    - Przesun wskaznik HL na nastepny bajt w pamieci (INX H).
;    - Zmniejsz licznik C (DCR C) i powtarzaj petle dopoki C nie osiagnie zera (JNZ PETLA).
; 4. Po wyjsciu z petli zapisz wynik z A do zmiennej SUMA.
; 5. Zakoncz dzialanie programu (HLT).

        MVI C,4
        LXI H,TABELA
        MVI A,0

PETLA
        ADD M
        INX H
        DCR C
        JNZ PETLA

        LXI H,SUMA
        MOV M,A
        HLT

TABELA  DB 5,10,15,20
SUMA    DB 0