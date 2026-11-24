ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    - WARTOSC z wartoscia 80
;    - DODATEK z wartoscia 30
;    - MAX_VAL z wartoscia 100
;    - WYNIK z wartoscia poczatkowa 0
; 2. Oblicz sume WARTOSC oraz DODATEK.
; 3. Porownaj sume z wartoscia MAX_VAL.
; 4. Jesli suma jest wieksza niz MAX_VAL:
;    - Zapisz w zmiennej WYNIK wartosc MAX_VAL.
; 5. Jesli suma jest mniejsza lub rowna MAX_VAL:
;    - Zapisz obliczona sume w zmiennej WYNIK.
; 6. Zakoncz dzialanie programu.

        LXI H,WARTOSC
        MOV A,M
        LXI H,DODATEK
        ADD M
        MOV B,A
        LXI H,MAX_VAL
        MOV A,M
        CMP B
        JC SUMAWIEKSZA
        LXI H,WYNIK
        MOV M,B
        HLT
SUMAWIEKSZA
        LXI H,WYNIK
        MOV M,A
        HLT
WARTOSC         DB 80
DODATEK         DB 30
MAX_VAL         DB 100
WYNIK   DB 0