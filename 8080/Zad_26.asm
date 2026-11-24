ORG 800H

; Napisz program kopiujacy 4-elementowa tablice danych z jednego obszaru pamieci do drugiego:
; 1. Zdefiniuj w pamieci dane:
;    - ZRODLO DB 10, 20, 30, 40
;    - CEL DB 0, 0, 0, 0
; 2. Przygotuj rejestry:
;    - Ustaw licznik petli na 4 obiegi.
;    - Zaladuj wskaznik zrodla na poczatek tablicy ZRODLO.
;    - Zaladuj wskaznik celu na poczatek tablicy CEL.
; 3. W petli:
;    - Pobierz bajt z tablicy zrodlowej do akumulatora.
;    - Zapisz bajt z akumulatora do pamieci pod wskaznik celu.
;    - Przesun wskaznik zrodla na kolejny bajt.
;    - Przesun wskaznik celu na kolejny bajt.
;    - Zmniejsz licznik obiegow i powtarzaj petle, az skopiujesz wszystkie 4 bajty.
; 4. Zakoncz dzialanie programu.

        MVI C,4
        LXI H,ZRODLO
        LXI D,CEL
PETLA
        MOV A,M
        STAX D
        INX H
        INX D
        DCR C
        JNZ PETLA
        HLT
ZRODLO  DB 10,20,30,40
CEL     DB 0,0,0,0