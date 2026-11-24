ORG 800H

; 1. Zdefiniuj w pamieci zmienne:
;    - SALDO z wartoscia 50
;    - KOSZT z wartoscia 30
;    - STATUS z wartoscia poczatkowa 0
; 2. Porownaj wartosc SALDO z wartoscia KOSZT.
; 3. Jesli SALDO jest wieksze lub rowne KOSZT:
;    - Odejmij KOSZT od SALDO i zapisz pomniejszona
;      wartosc z powrotem w zmiennej SALDO.
;    - W zmiennej STATUS zapisz wartosc 1.
; 4. Jesli SALDO jest mniejsze niz KOSZT:
;    - Pozostaw SALDO bez zmian.
;    - W zmiennej STATUS zapisz wartosc 2.
; 5. Zakoncz program.

        LXI H,SALDO
        MOV A,M

        LXI H,KOSZT

        CMP M
        JNC WIEKSZELUBROWNE

        LXI H,STATUS
        MVI M,2
        HLT

WIEKSZELUBROWNE
        SUB M
        LXI H,SALDO
        MOV M,A
        LXI H,STATUS
        MVI M,1
        HLT

SALDO   DB 50
KOSZT   DB 30
STATUS  DB 0