ORG 800H

; Napisz program zliczajacy, ile liczb w 4-elementowej tablicy jest parzystych:
; 1. Zdefiniuj w pamieci dane:
;    - TABELA DB 4, 7, 12, 15
;    - ILE_PARZYSTYCH DB 0
; 2. Ustaw licznik obiegow petli na 4 elements oraz wyzeruj rejestr bedacy licznikiem trafien.
; 3. Zaladuj wskaznik pamieci na poczatek tablicy.
; 4. W petli:
;    - Pobierz liczbe z pamieci do akumulatora.
;    - Uzyj instrukcji bitowej, aby sprawdzic najmlodszy bit (sprawdzenie parzystosci).
;    - Jesli liczba nie jest parzysta, przeskocz zwiekszanie licznika trafien.
;    - Jesli liczba jest parzysta, zwieksz licznik trafien.
;    - Przesun wskaznik pamieci na kolejny bajt i zmniejsz licznik petli.
; 5. Zapisz wynik z licznika trafien do zmiennej ILE_PARZYSTYCH.
; 6. Zakoncz dzialanie programu.

        LXI H,TABELA
        MVI C,4
        MVI B,0
PETLA
        MOV A,M
        ANI 1
        JNZ NIEPARZYSTA
        INR B
NIEPARZYSTA
        INX H
        DCR C
        JNZ PETLA
        LXI H,ILEPARZYSTYCH
        MOV M,B
        HLT
TABELA  DB 4,7,12,15
ILEPARZYSTYCH   DB 0