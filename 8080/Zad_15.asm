ORG 800H

; Napisz program obliczajacy koszt wysylki paczki na podstawie jej wagi:
; 1. Zdefiniuj w pamieci zmienne:
;    - WAGA z wartoscia 12
;    - KOSZT z wartoscia poczatkowa 0
; 2. Sprawdz wartosc WAGA:
;    - Jesli WAGA jest wieksza od 20, zapisz w KOSZT wartosc 50.
;    - Jesli WAGA jest wieksza od 10 (i <= 20), zapisz w KOSZT wartosc 30.
;    - Jesli WAGA jest wieksza od 0 (i <= 10), zapisz w KOSZT wartosc 15.
;    - Jesli WAGA jest rowna 0, zapisz w KOSZT wartosc 0.
; 3. Zakoncz dzialanie programu.

        LXI H,WAGA
        MOV A,M
        CPI 20
        JZ SPRAWDZ10
        JC SPRAWDZ10
        LXI H,KOSZT
        MVI M,50
        HLT
SPRAWDZ10
        CPI 10
        JZ SPRAWDZ0
        JC SPRAWDZ0
        LXI H,KOSZT
        MVI M,30
        HLT
SPRAWDZ0
        CPI 0
        JZ ZERO
        JC WYJDZ
        LXI H,KOSZT
        MVI M,15
        HLT
ZERO
        LXI H,KOSZT
        MVI M,0
        HLT
WYJDZ
        HLT
WAGA    DB 12
KOSZT   DB 0