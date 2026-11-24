ORG 800H

; Napisz program sortujacy dwie liczby w pamieci w kolejnosci rosnacej:
; 1. Zdefiniuj w pamieci zmienne:
;    - X z wartoscia 80
;    - Y z wartoscia 30
; 2. Porownaj wartosci X i Y.
; 3. Jesli X jest wieksze od Y, zamien ich wartosci w pamieci
;    tak, aby w X znalazla sie mniejsza wartosc (30), a w Y wieksza (80).
; 4. Jesli X jest mniejsze lub rowne Y, pozostaw je bez zmian.
; 5. Zakoncz dzialanie programu.

        LXI H,X
        MOV A,M

        LXI H,Y
        MOV B,M

        CMP B

        JZ WYJDZ
        JC WYJDZ
        MOV M,A
        LXI H,X
        MOV M,B
WYJDZ
        HLT

X       DB 80
Y       DB 30