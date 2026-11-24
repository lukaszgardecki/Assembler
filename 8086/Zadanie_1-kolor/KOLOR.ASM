
Progr           segment
                assume  cs:Progr, ds:dane, ss:stosik



start:          mov     ax,dane
                mov     ds,ax
                mov     ax,stosik
                mov     ss,ax
                mov     sp,offset szczyt

                mov     ax,0B800h
                mov     es,ax

                mov     cx,80       ;licznik petli (ekran ma 80 znakow)
                mov     al,4eh      ;4-czerwone tlo, E-zolta czcionka
                mov     di,160*3+1  ;4 linia ekranu, +1 przeskakuje z bajtu znaku na bajt koloru
                cld                 ;zerujemy flage
;petla wykonujaca sie 80 razy:
pet:
                stosb               ;zapisze akumulator do [es:di<al, di-di+1]
                inc   di
                loop pet

                mov ah,0
                int 16h             ;zakonczenie po nacisnieciu dowolnego klawisza

;               mov     byte ptr es:[4],'A'             ;pierwszy wiersz trzcia kolumna ekranu
;               mov     byte ptr es:[5],1eh             ;żolty atrament niebieskie tło
;               mov     byte ptr es:[160*4+10],'B'      ;piaty wiersz szusta kolumna ekranu
;               mov     byte ptr es:[160*4+11],4eh      ;żolty atrament czerwone tło


                mov         ah,4ch
                mov         al,0
                int         21h
Progr           ends

dane            segment
dane            ends

stosik          segment stack
                dw    100h dup(0)
szczyt          Label word
stosik          ends

                end start
