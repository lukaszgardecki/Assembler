ORG 800H

; Napisz program zliczajacy, ile liczb w 5-elementowej tablicy jest zerami:
; Napisz program zliczajacy, ile razy w 5-elementowej tablicy wystepuje wartosc 0:
; 1. Zdefiniuj w pamieci dane:
;    - TABELA DB 5, 0, 12, 0, 0
;    - ILE_ZER DB 0
; 2. Przygotuj rejestry (licznik trafien, licznik obiegow, wskaznik pamieci).
; 3. W petli pobieraj kolejne liczby i zliczaj tylko te, ktore sa rowne 0.
; 4. Pamietaj, aby INX H oraz dekrementacja licznika obiegow wykonywaly sie przy kazdym obiegu petli.
; 5. Zapisz wynik w zmiennej ILE_ZER i zakoncz program.

        MVI A,0
        MVI B,0
        MVI C,5
        LXI H,TABELA
PETLA
        CMP M
        JNZ DALEJ
        INR B
DALEJ
        INX H
        DCR C
        JNZ PETLA
        LXI H,ILEZER
        MOV M,B
        HLT
TABELA  DB 5,0,12,0,0
ILEZER  DB 0