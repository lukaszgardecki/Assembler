ORG 800H

; 1. Zdefiniuj na koncu programu zmienne:
;    - X z wartoscia 12
;    - Y z wartoscia 8
;    - WYNIK z wartoscia poczatkowa 0
; 2. Dodaj do siebie wartosci X oraz Y z pamieci.
; 3. Sprawdz, czy suma jest rowna 20.
; 4. Jesli suma wynosi 20, zapisz w zmiennej WYNIK wartosc 1.
; 5. Jesli suma jest inna niz 20, zapisz w zmiennej WYNIK wartosc 2.
; 6. Zakoncz dzialanie programu.

        LXI H,X
        MOV A,M
        LXI H,Y
        ADD M
        CPI 20
        JZ ZAPISZ
        LXI H,WYNIK
        MVI M,2
        HLT
ZAPISZ
        LXI H,WYNIK
        MVI M,1
        HLT
X       DB 12
Y       DB 8
WYNIK   DB 0