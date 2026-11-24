ORG 800H

; Napisz program obliczajacy wysokosc mandatu na podstawie predkosci:
; 1. Zdefiniuj w pamieci zmienne:
;    - PREDKOSC z wartoscia 75
;    - MANDAT z wartoscia poczatkowa 0
; 2. Sprawdz wartosc PREDKOSC:
;    - Jesli PREDKOSC jest wieksza od 70, zapisz w zmiennej MANDAT wartosc 200.
;    - Jesli PREDKOSC jest wieksza od 50 (ale mniejsza lub rowna 70), zapisz w zmiennej MANDAT wartosc 100.
;    - W przeciwnym razie (mniejsza lub rowna 50), zapisz w zmiennej MANDAT wartosc 0.
; 3. Zakoncz dzialanie programu.

        LXI H,PREDKOSC
        MOV A,M
        CPI 70
        JZ SPRAWDZ50
        JC SPRAWDZ50
        LXI H,MANDAT
        MVI M,200
        HLT
SPRAWDZ50
        CPI 50
        JZ PREDKOSCOK
        JC PREDKOSCOK
        LXI H,MANDAT
        MVI M,100
        HLT
PREDKOSCOK
        LXI H,MANDAT
        MVI M,0
        HLT
PREDKOSC        DB 75
MANDAT  DB 0