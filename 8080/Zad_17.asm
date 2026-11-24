ORG 800H

; Napisz program obliczajacy wartosc bezwzgledna roznicy dwoch liczb (|X - Y|):
; 1. Zdefiniuj w pamieci zmienne:
;    - X z wartoscia 30
;    - Y z wartoscia 50
;    - ROZNICA z wartoscia poczatkowa 0
; 2. Oblicz roznice tak, aby wynik zawsze byl nieujemny:
;    - Jesli X jest wieksze lub rowne Y, odejmij Y od X (X - Y).
;    - Jesli X jest mniejsze niz Y, odejmij X od Y (Y - X).
; 3. Zapisz wynik w zmiennej ROZNICA.
; 4. Zakoncz dzialanie programu.

        LXI H,X
        MOV A,M

        LXI H,Y
        MOV B,M

        CMP B
        JNC WIEKSZELUBROWNE
        MOV B,A
        MOV A,M
        SUB B
        LXI H,ROZNICA
        MOV M,A
        HLT

WIEKSZELUBROWNE
        SUB B
        LXI H,ROZNICA
        MOV M,A
        HLT

X       DB 30
Y       DB 50
ROZNICA         DB 0