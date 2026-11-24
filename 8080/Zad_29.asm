ORG 800H

; Napisz program, ktory kopiuje z tablicy zrodlowej do docelowej tylko liczby wieksze od 20,
; ukladajac je w tablicy docelowej ciasno obok siebie (jedna po drugiej, bez zostawiania przerw).
; 1. Zdefiniuj w pamieci dane:
;    - ZRODLO DB 10, 30, 5, 40
;    - CEL DB 0, 0, 0, 0
; 2. Przygotuj wskazniki pamieci na zrodlo i cel oraz licznik obiegow petli na 4 elementy.
; 3. W petli:
;    - Pobierz kolejna liczbe ze zrodla.
;    - Porownaj ja z wartoscia 20.
;    - Jesli liczba jest mniejsza lub rowna 20, przeskocz nadpisanie w celu i nie przesuwaj wskaznika tablicy docelowej.
;    - Jesli liczba jest wieksza od 20, zapisz ja pod adres wskazany przez wskaznik celu,
;      a nastepnie przesun wskaznik celu na kolejna wolna komorke.
;    - Wskaznik zrodla przesuwaj zawsze przy kazdym obiegu petli.
; 4. Zakoncz dzialanie programu.

        LXI H,ZRODLO
        LXI D,CEL
        MVI C,4
PETLA
        MOV A,M
        CPI 20
        JZ SKOK
        JC SKOK
        STAX D
        INX D
SKOK
        INX H
        DCR C
        JNZ PETLA
        HLT
ZRODLO  DB 10,30,5,40
CEL     DB 0,0,0,0