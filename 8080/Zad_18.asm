ORG 800H

; Napisz program znajdujacy najwieksza z trzech liczb:
; 1. Zdefiniuj w pamieci zmienne:
;    - L1 z wartoscia 45
;    - L2 z wartoscia 80
;    - L3 z wartoscia 60
;    - MAX z wartoscia poczatkowa 0
; 2. Porownaj liczby i znajdz najwieksza z nich.
; 3. Zapisz najwieksza wartosc w zmiennej MAX.
; 4. Zakoncz dzialanie programu.

        LXI H,L1
        MOV A,M

        LXI H,L2
        CMP M

        JNC SPRAWDZL3
        MOV A,M

SPRAWDZL3
        LXI H,L3
        CMP M
        JNC ZAPISZMAX
        MOV A,M

ZAPISZMAX
        LXI H,MAX
        MOV M,A
        HLT

L1      DB 45
L2      DB 80
L3      DB 60
MAX     DB 0