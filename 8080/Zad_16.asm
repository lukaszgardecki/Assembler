ORG 800H

; Napisz program ograniczajacy wartosc do zadanego przedzialu (tzw. clamp z dolna i gorna granica):
; 1. Zdefiniuj w pamieci zmienne:
;    - WARTOSC z wartoscia 150
;    - MIN_VAL z wartoscia 20
;    - MAX_VAL z wartoscia 100
;    - WYNIK z wartoscia poczatkowa 0
; 2. Sprawdz wartosc WARTOSC:
;    - Jesli WARTOSC jest mniejsza niz MIN_VAL, zapisz w WYNIK wartosc MIN_VAL.
;    - Jesli WARTOSC jest wieksza niz MAX_VAL, zapisz w WYNIK wartosc MAX_VAL.
;    - W przeciwnym razie (wartosc miesci sie w przedziale od MIN_VAL do MAX_VAL), zapisz w WYNIK sama WARTOSC.
; 3. Zakoncz dzialanie programu.

        LXI H,WARTOSC
        MOV A,M

        LXI H,MINVAL
        MOV B,M
        CMP B
        JC ZAMALA

        LXI H,MAXVAL
        MOV C,M
        CMP C
        JZ OK
        JC OK

        LXI H,WYNIK
        MOV M,C
        HLT
ZAMALA
        LXI H,WYNIK
        MOV M,B
        HLT
OK
        LXI H,WYNIK
        MOV M,A
        HLT
WARTOSC         DB 150
MINVAL  DB 20
MAXVAL  DB 100
WYNIK   DB 0