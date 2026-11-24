ORG 800H

; Napisz program znajdujacy najmniejsza z trzech liczb:
; 1. Zdefiniuj w pamieci zmienne:
;    - A1 z wartoscia 50
;    - A2 z wartoscia 15
;    - A3 z wartoscia 35
;    - MIN z wartoscia poczatkowa 0
; 2. Porownaj liczby i znajdz najmniejsza z nich.
; 3. Zapisz najmniejsza wartosc w zmiennej MIN.
; 4. Zakoncz dzialanie programu.

        LXI H,A1
        MOV A,M

        LXI H,A2
        CMP M

        JC SPRAWDZA3
        MOV A,M

SPRAWDZA3
        LXI H,A3
        CMP M
        JC ZAPISZMIN
        MOV A,M

ZAPISZMIN
        LXI H,MIN
        MOV M,A
        HLT

A1      DB 50
A2      DB 15
A3      DB 35
MIN     DB 0