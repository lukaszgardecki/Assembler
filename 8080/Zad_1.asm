ORG 800H

; 1. Zdefiniuj na koncu programu trzy zmienne:
; - LICZBA1 z wartoscia 8
; - LICZBA2 z wartoscia 12
; - SUMA z wartoscia poczatkowa 0
; 2. Zaladuj wartosc LICZBA1 z pamieci do akumulatora.
; 3. Wczytaj adres LICZBA2 i dodaj jej wartosc do akumulatora.
; 4. Zapisz wynik z akumulatora do zmiennej SUMA.
; 5. Zakoncz program.

        LXI H,LICZBA1
        MOV A,M

        LXI H,LICZBA2
        ADD M

        LXI H,SUMA
        MOV M,A
        HLT

LICZBA1 DB 8
LICZBA2 DB 12
SUMA    DB 0