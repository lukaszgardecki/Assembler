ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    - CENA z wartoscia 40
;    - RABAT z wartoscia 15
;    - MIN_CENA z wartoscia 30
;    - OSTATECZNA z wartoscia poczatkowa 0
; 2. Oblicz cene po rabacie (CENA minus RABAT).
; 3. Porownaj wyliczona cene z wartoscia MIN_CENA.
; 4. Jesli wyliczona cena jest mniejsza niz MIN_CENA:
;    - Zapisz wartosc MIN_CENA w zmiennej OSTATECZNA.
; 5. W przeciwnym razie (cena po rabacie jest wieksza lub rowna MIN_CENA):
;    - Zapisz wyliczona cene w zmiennej OSTATECZNA.
; 6. Zakoncz dzialanie programu.

        LXI H,CENA
        MOV A,M

        LXI H,RABAT
        SUB M
        MOV B,A

        LXI H,MIN_CENA
        MOV A,M

        CMP B
        JNC ZAPISZ

        LXI H,OSTATECZNA
        MOV M,B
        HLT
ZAPISZ
        LXI H,OSTATECZNA
        MOV M,A
        HLT
CENA    DB 40
RABAT   DB 15
MIN_CENA        DB 30
OSTATECZNA      DB 0