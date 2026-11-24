ORG 800H

; Petla. Napisz program mnozacy dwie liczby za pomoca wielokrotnego dodawania (A x B):
; 1. Zdefiniuj w pamieci zmienne:
;    - LICZBA z wartoscia 6
;    - RAZY z wartoscia 4
;    - WYNIK z wartoscia poczatkowa 0
; 2. Uzyj rejestru jako licznika petli (zaladuj do niego wartosc RAZY).
; 3. W petli dodawaj wartosc LICZBA do akumulatora i zmniejszaj licznik (DCR / JNZ).
; 4. Zapisz koncowy wynik w komorce WYNIK.
; 5. Zakoncz dzialanie programu.

        LXI H,RAZY
        MOV C,M
        LXI H,LICZBA
        MVI A,0
PETLA
        ADD M
        DCR C
        JNZ PETLA

        LXI H,WYNIK
        MOV M,A
        HLT
LICZBA  DB 6
RAZY    DB 4
WYNIK   DB 0