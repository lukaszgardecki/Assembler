ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    - PUNKTY z wartoscia 15
;    - BONUS z wartoscia 5
;    - PROG z wartoscia 10
;    - WYNIK z wartoscia poczatkowa 0
; 2. Porownaj wartosc PUNKTY z wartoscia PROG.
; 3. Jesli PUNKTY sa wieksze lub rowne PROG:
;    - Dodaj BONUS do PUNKTY i zapisz sume w zmiennej WYNIK.
; 4. Jesli PUNKTY sa mniejsze niz PROG:
;    - Zapisz same PUNKTY w zmiennej WYNIK.
; 5. Zakoncz dzialanie programu.

        LXI H,PUNKTY
        MOV A,M
        LXI H,PROG
        CMP M
        JNC ETYKIETA
        LXI H,WYNIK
        MOV M,A
        HLT
ETYKIETA
        LXI H,BONUS
        ADD M
        LXI H,WYNIK
        MOV M,A
        HLT
PUNKTY  DB 15
BONUS   DB 5
PROG    DB 10
WYNIK   DB 0