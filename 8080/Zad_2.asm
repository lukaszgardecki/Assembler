ORG 800H

; 1. Zdefiniuj na koncu kodu trzy zmienne:
; - A_VAL z wartoscia 15
; - B_VAL z wartoscia 25
; - WIEKSZA z wartoscia poczatkowa 0
; 2. Wczytaj A_VAL do akumulatora.
; 3. Porownaj zawartosc akumulatora z wartoscia B_VAL.
; 4. Jesli B_VAL jest wieksza, wpisz wartosc z B_VAL do zmiennej WIEKSZA.
; 5. Jesli A_VAL jest wieksza (lub rowna), wpisz wartosc z A_VAL do zmiennej WIEKSZA.
; 6. Zakoncz program.

        LXI H,A_VAL
        MOV A,M

        LXI H,B_VAL
        MOV B,M

        CMP B
        JC ZWIEKSZ
        LXI H,WIEKSZA
        MOV M,A
        HLT

ZWIEKSZ
        LXI H,WIEKSZA
        MOV M,B
        HLT

A_VAL   DB 15
B_VAL   DB 25
WIEKSZA         DB 0