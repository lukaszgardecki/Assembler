ORG 800H

; Napisz program, ktory wyswietli w petli 3 kolejne litery: 'A', 'B' oraz 'C' (kody ASCII: 65, 66, 67):
; 1. Zdefiniuj w pamieci dane:
;    - TEKST DB 65, 66, 67
; 2. Przygotuj wskaznik pamieci na poczatek TEKST oraz licznik obiegow petli na 3 znaki.
; 3. W petli:
;    - Pobierz kod znaku z pamieci do akumulatora.
;    - Wywolaj systemowa funkcje wyswietlania znakow.
;    - Przesun wskaznik pamieci na kolejny znak.
;    - Zmniejsz licznik petli i wykonuj petle, az wyswietlisz caly napis.
; 4. Zakoncz dzialanie programu.

        LXI H,TEKST
        MVI C,3
PETLA
        MOV A,M
        RST 1
        INX H
        DCR C
        JNZ PETLA
        HLT
TEKST   DB 65,66,67