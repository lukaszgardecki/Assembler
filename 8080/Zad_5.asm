ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    a. A_VAL z wartoscia 15
;    b. B_VAL z wartoscia 10
;    c. LIMIT z wartoscia 20
;    d. WYNIK z wartoscia poczatkowa 0
; 2. Oblicz sume wartosci A_VAL oraz B_VAL.
; 3. Porownaj te sume z wartoscia LIMIT.
; 4. Jesli suma jest wieksza od LIMIT, zapisz w zmiennej WYNIK wartosc 99.
; 5. Jesli suma jest mniejsza lub rowna LIMIT, zapisz wyliczona sume w zmiennej WYNIK.
; 6. Zakoncz program.

        LXI H,A_VAL
        MOV A,M

        LXI H,B_VAL
        ADD M

        MOV B,A

        LXI H,LIMIT
        MOV A,M

        CMP B
        JC SUMAWIEKSZA
        LXI H,WYNIK
        MOV M,B
        HLT
SUMAWIEKSZA
        LXI H,WYNIK
        MVI M,99
        HLT
A_VAL   DB 15
B_VAL   DB 10
LIMIT   DB 20
WYNIK   DB 0