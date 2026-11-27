ORG 800H

RST 5
MOV H,D
MOV L,E
MVI B,5

PETLA_ZEWN
    MVI C,16
    XRA A

    PETLA_WEWN
        DAD H
        RAL
        CPI 10
        JC MNIEJSZE_OD_10
        SUI 10
        INX H

        MNIEJSZE_OD_10
            DCR C
    JNZ PETLA_WEWN

        PUSH PSW
        DCR B
JNZ PETLA_ZEWN

WYSWIETLANIE
    MVI B,5
    PETLA_WYSWIETL
            POP PSW
            ADI 30H
            RST 1
            DCR B
    JNZ PETLA_WYSWIETL

HLT

