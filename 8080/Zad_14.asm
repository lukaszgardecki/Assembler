ORG 800H

; Napisz program ustalajacy ocene na podstawie liczby punktow z egzaminu (warunek z 4 przedzialami):
; 1. Zdefiniuj w pamieci zmienne:
;    - PUNKTY z wartoscia 85
;    - OCENA z wartoscia poczatkowa 0
; 2. Sprawdz wartosc PUNKTY:
;    - Jesli PUNKTY sa wieksze niz 80, zapisz w OCENA wartosc 5.
;    - Jesli PUNKTY sa wieksze niz 60 (i <= 80), zapisz w OCENA wartosc 4.
;    - Jesli PUNKTY sa wieksze niz 40 (i <= 60), zapisz w OCENA wartosc 3.
;    - W przeciwnym razie (<= 40), zapisz w OCENA wartosc 2.
; 3. Zakoncz dzialanie programu.

        LXI H,PUNKTY
        MOV A,M
        CPI 80
        JZ SPRAWDZ60
        JC SPRAWDZ60
        LXI H,OCENA
        MVI M,5
        HLT
SPRAWDZ60
        CPI 60
        JZ SPRAWDZ40
        JC SPRAWDZ40
        LXI H,OCENA
        MVI M,4
        HLT
SPRAWDZ40
        CPI 40
        JZ NIEZALICZONE
        JC NIEZALICZONE
        LXI H,OCENA
        MVI M,3
        HLT
NIEZALICZONE
        LXI H,OCENA
        MVI M,2
        HLT
PUNKTY  DB 85
OCENA   DB 0