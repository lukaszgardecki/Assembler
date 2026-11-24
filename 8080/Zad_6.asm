ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    - X z wartoscia 10
;    - Y z wartoscia 25
; 2. Odczytaj obie wartosci z pamieci i zamien je miejscami
;    tak, aby w komorce X znalazla sie wartosc 25, a w komorce Y wartosc 10.
; 3. Zakoncz dzialanie programu.

        LXI H,X
        MOV A,M

        LXI H,Y
        MOV B,M

        MOV M,A
        LXI H,X
        MOV M,B

        HLT

X       DB 10
Y       DB 25