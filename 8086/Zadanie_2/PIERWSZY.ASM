Progr           segment
                assume  cs:Progr, ds:dane, ss:stosi

star:           mov     ax,dane
                mov     ds,ax
                mov     ax,stosi
                mov     ss,ax
                mov     sp,offset szczyt

;cialo programu:
                ;mov     ds,
                mov     dx,offset lancuch
                mov     ah,09h
                int     21h


                mov         ah,4ch
                mov         al,0  ; 0 = poziom error level
                int         21h   ; 21h=przerwanie wysokopoziomowe uslug DOS
Progr           ends

dane            segment
lancuch         db 'Hellow world',10,13,'Druga linia$'
dane            ends

stosi           segment stack
                dw     100h   dup(0)
szczyt          Label word
stosi           ends

                end star