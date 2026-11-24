ORG 800H

; Napisz program obliczajacy oplate za nadbagaz:
; 1. Zdefiniuj w pamieci zmienne:
;    - WAGA z wartoscia 25
;    - LIMIT z wartoscia 20
;    - OPLATA z wartoscia poczatkowa 0
; 2. Porownaj wartosc WAGA z wartoscia LIMIT.
; 3. Jesli WAGA jest wieksza niz LIMIT:
;    - Oblicz nadwage (WAGA minus LIMIT).
;    - Zapisz obliczona nadwage w zmiennej OPLATA.
; 4. Jesli WAGA jest mniejsza lub rowna LIMIT:
;    - Zapisz wartosc 0 w zmiennej OPLATA.
; 5. Zakoncz dzialanie programu.

        LXI H,WAGA
        MOV A,M
        LXI H,LIMIT
        MOV B,M
        SUB B
        JC BRAKOPLATY
        LXI H,OPLATA
        MOV M,A
        HLT
BRAKOPLATY
        LXI H,OPLATA
        MVI M,0
        HLT
WAGA    DB 25
LIMIT   DB 20
OPLATA  DB 0