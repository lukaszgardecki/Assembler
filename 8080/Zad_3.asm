ORG 800H

; 1. Zdefiniuj na koncu programu zmienne:
;    - LICZBA1 z wartoscia 20
;    - LICZBA2 z wartoscia 7
;    - ROZNICA z wartoscia poczatkowa 0
; 2. Wczytaj wartosc LICZBA1 do akumulatora.
; 3. Porownaj akumulator z wartoscia LICZBA2.
; 4. Jesli LICZBA1 jest mniejsza od LICZBA2, wpisz 0 do zmiennej ROZNICA i przejdz do konca programu.
; 5. W przeciwnym razie odejmij LICZBA2 od akumulatora i zapisz wynik w zmiennej ROZNICA.
; 6. Zakoncz dzialanie programu.

        LXI H,LICZBA1
        MOV A,M

        LXI H,LICZBA2
        MOV B,M

        CMP B
        JC ZAPISZ
        SUB B
        LXI H,ROZNICA
        MOV M,A

        HLT

LICZBA1 DB 20
LICZBA2 DB 7
ROZNICA DB 0
ZAPISZ
        LXI H,ROZNICA
        MVI M,0
        HLT