ORG 800H

; Napisz program klasyfikujacy temperature (warunek z trzema przedzialami):
; 1. Zdefiniuj w pamieci zmienne:
;    - TEMP z wartoscia 35
;    - ALARM z wartoscia poczatkowa 0
; 2. Sprawdz wartosc TEMP:
;    - Jesli TEMP jest wieksza od 30, zapisz w zmiennej ALARM wartosc 2.
;    - Jesli TEMP jest wieksza od 20 (ale mniejsza lub rowna 30), zapisz w zmiennej ALARM wartosc 1.
;    - W przeciwnym razie (mniejsza lub rowna 20), zapisz w zmiennej ALARM wartosc 0.
; 3. Zakoncz dzialanie programu.

        LXI H,TEMP
        MOV A,M
        CPI 30
        JZ SPRAWDZ20
        JC SPRAWDZ20
        LXI H,ALARM
        MVI M,2
        HLT
SPRAWDZ20
        CPI 20
        JZ MALE
        JC MALE
        LXI H,ALARM
        MVI M,1
        HLT
MALE
        LXI H,ALARM
        MVI M,0
        HLT
TEMP    DB 35
ALARM   DB 0