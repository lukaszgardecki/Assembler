MojProgram      segment
                assume  cs:MojProgram, ss:moj_stos

start:          mov     ax, 0003h       ; tryb tekstowy 80x25 + czyszczenie ekranu
                int     10h

                mov     ax, 0B800h      ; adres pamieci wideo (VRAM)
                mov     es, ax
                xor     di, di          ; DI = 0 (bajt znaku pierwszego pola)

; --- PUNKT 1: Wypelnienie ekranu 01..25 (czarne tlo) ---
                mov     bl, 1           ; numer wiersza (1..25)

wypelnij:       mov     al, bl
                aam                     ; AH = dziesiatki, AL = jednosci
                add     ax, 3030h       ; konwersja obu cyfr na ASCII
                xchg    dx, ax          ; DH = dziesiatki, DL = jednosci

                mov     cx, 40          ; 40 par znakow = 80 kolumn
                mov     ah, 07h         ; 0 = czarne tlo, 7 = bialy tekst

kolumna:        mov     al, dh
                stosw                   ; zapisz dziesiatki + atrybut
                mov     al, dl
                stosw                   ; zapisz jednosci + atrybut
                loop    kolumna

                inc     bl
                cmp     bl, 25
                jbe     wypelnij

; --- PUNKTY 2-6: Podswietlanie kolejnych linii za pomoca STOSB ---
                mov     di, 1           ; DI = 1 (pierwszy bajt atrybutu w 1. linii!)

nastepna_linia:
                ; PUNKT 2: Zakolorowac biezaca linie na czerwono (STOSB)
                mov     al, 47h         ; 4 = czerwone tlo, 7 = bialy tekst
                call    koloruj_linie   ; ustawia kolor i cofa DI na poczatek tej samej linii

                ; PUNKT 3: Poczekac na nacisniecie klawisza
                xor     ah, ah          ; funkcja 00h przerwania 16h (czekaj na klawisz)
                int     16h             ; zwraca kod ASCII w AL
                push    ax              ; zachowaj kod klawisza na stosie

                ; PUNKT 4: Przywrocic kolor czarny (STOSB)
                mov     al, 07h         ; 0 = czarne tlo, 7 = bialy tekst
                call    koloruj_linie   ; przywraca kolor i cofa DI na poczatek tej linii

                ; PUNKT 5: Jesli ESC (kod 27 / 1Bh), zakoncz program
                pop     ax              ; odzyskaj nacisniety klawisz
                cmp     al, 27          ; czy nacisnieto ESC?
                je      koniec

                ; PUNKT 6: Przejdz do nastepnej linii i powtorz od punktu 2
                add     di, 160         ; przesun DI o 1 wiersz (80 znakow * 2 bajty = 160)
                cmp     di, 4000        ; czy wyszlismy poza 25. linie (25 * 160 = 4000)?
                jb      nastepna_linia  ; jesli DI < 4000, idz do kolejnej linii

                mov     di, 1           ; opcjonalne zawiniecie z powrotem do 1. linii po 25.
                jmp     nastepna_linia

koniec:         mov     ah, 4Ch
                int     21h

; --- PROCEDURA POMOCNICZA (oszczedza miejsce dla pkt 2 i 4) ---
; Wejscie: AL = atrybut koloru, DI = poczatek atrybutow w wierszu (nieparzyste)
koloruj_linie:  mov     cx, 80          ; 80 znakow w linii
petla_kolor:    stosb                   ; zapisz sam atrybut pod ES:[DI] i zwieksz DI o 1
                inc     di              ; omin bajt znaku ASCII (DI wskaze kolejny atrybut)
                loop    petla_kolor
                sub     di, 160         ; cofnij DI na poczatek biezacej linii
                ret

MojProgram      ends

moj_stos        segment stack
                dw      64 dup(?)
moj_stos        ends
                end     start