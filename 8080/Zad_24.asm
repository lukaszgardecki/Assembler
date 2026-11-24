ORG 800H

; Napisz program zliczajacy, ile liczb w 5-elementowej tablicy jest wiekszych od 20:
; 1. Zdefiniuj w pamieci dane:
;    - TABELA DB 12, 25, 8, 30, 18
;    - ILE DB 0
; 2. Przygotuj rejestry:
;    - Wyzeruj wybrany rejestr, ktory bedzie licznikiem znalezionych liczb.
;    - Ustaw inny rejestr jako licznik petli na 5 obiegow.
;    - Zaladuj wskaznik pamieci na poczatek TABELA.
; 3. W petli:
;    - Pobierz wartosc z aktualnej komorki tablicy.
;    - Porownaj ja z wartoscia 20.
;    - Jesli liczba jest mniejsza lub rowna 20, przeskocz nadpisanie/zwiekszanie licznika trafien.
;    - Jesli liczba jest wieksza od 20, zwieksz licznik trafien o 1.
;    - Przesun wskaznik pamieci na nastepny element.
;    - Zmniejsz licznik obiegow i powtarzaj petle, az sprawdzisz wszystkie 5 liczb.
; 4. Zapisz wynik z licznika trafien do zmiennej ILE.
; 5. Zakoncz dzialanie programu.

        MVI B,0
        MVI C,5
        LXI H,TABELA
PETLA
        MOV A,M
        CPI 20
        JZ BRAKTRAFIENIA
        JC BRAKTRAFIENIA
        INR B
BRAKTRAFIENIA
        INX H
        DCR C
        JNZ PETLA

        LXI H,ILE
        MOV M,B
        HLT

TABELA  DB 12,25,8,30,18
ILE     DB 0