MojProgram      segment
                assume  cs:MojProgram, ss:moj_stos

start:          mov     ax, 0003h       ; 00h - tryb wideo (czysci ekran i ustawia kursor na poczatku)
                                        ; 03h - tryb tekstowy 80x25 (tabela kodow)
                int     10h             ; Interrupt (przerwanie), 10h to numer z tablicy przerwan obsługujacy ekran/karte graficzna (BIOS Video Services)

                mov     ax, 0B800h      ; 0B800h - adres w pamieci wideo (VRAM)
                mov     es, ax          ; przepisanie do rejestru segmentowego E
                xor     di, di          ; zerujemy DI (bajt znaku pierwszego pola), ustawia flage ZF na 1

; --- Wypelnienie ekranu 01..25 (czarne tlo) ---
                mov     bl, 1           ; ustawiamy licznik wierszy

wypelnij:       mov     al, bl          ; przenosimy numer wiersza do akumulatora AL (bo metoda 'aam' działa wylacznie na akumulatorze)
                aam                     ; dzieli zawartosc AL przez 10. W AH sa dziesiatki, a w AL jednosci
                add     ax, 3030h       ; dodajemy 30h  do cyfr akumulatora, konwersja obu cyfr na znaki ASCII, 1 -> '1'
                xchg    dx, ax          ; zamiana AX <-> DX; DH = dziesiatki, DL = jednosci

                mov     cx, 40          ; licznik petli wypełniajacej wiersz (40 par znakow = 80 kolumn)
                mov     ah, 07h         ; 0 = czarne tlo, 7 = bialy tekst

kolumna:        mov     al, dh          ; przeniesienie dziesiatek do AL
                stosw                   ; zapisuje AX pod ES:[DI] i zwieksza DI o 2 (zapisuje znak + atrybut)
                mov     al, dl          ; przeniesienie jednosci do AL
                stosw                   ; zapisuje AX pod ES:[DI] i zwieksza DI o 2 (zapisuje znak + atrybut)
                loop    kolumna         ; powrot do kolumna jesli CX != 0

                inc     bl              ; zwiekszamy licznik wierszy
                cmp     bl, 25          ; porownuje BL z 25 (odejmuje 25 od BL), ustawia flagi
                jbe     wypelnij        ; (Jump If Below or Equal) sprawdza flagi CF i ZF i jesli BL <= 25, skok do wypelnij

; --- Podswietlanie kolejnych linii za pomoca STOSB ---
                mov     di, 1           ; DI = 1 (pierwszy bajt atrybutu w 1. linii - jego kolor)

nastepna_linia:
                ; Kolorowanie biezacej linii na czerwono (STOSB)
                mov     al, 47h         ; 4 = czerwone tlo, 7 = bialy tekst
                call    koloruj_linie   ; ustawia kolor i cofa DI na poczatek tej samej linii

                ; Czekanie na nacisniecie klawisza
                xor     ah, ah          ; zerujemy AH, aby wybrac funkcje 00h ('czekaj na klawisz i odczytaj go')
                int     16h             ; wywolanie przerwania BIOS klawiatury (16h) - BIOS odczytuje AH=00h, czeka na klawisz i zwraca kod ASCII w AL
                push    ax              ; zachowaj kod klawisza na stosie

                ; Przywrocenie koloru czarnego linijki przed przejsciem do nastepnej (STOSB)
                mov     al, 07h         ; 0 = czarne tlo, 7 = bialy tekst
                call    koloruj_linie   ; przywraca kolor i cofa DI na poczatek tej linii

                ; Jesli ESC (kod 27 / 1Bh), zakoncz program
                pop     ax              ; sciagamy ze stosu wcisniety wczesniej klawisz (kod ASCII) do rejestru AX
                cmp     al, 27          ; bierzemy z AL kod ASCII wcisnietego klawisza i porownujemy z 27 (kod ESC), ustawia flagi
                je      koniec          ; (Jump If Equal) sprawdza flage ZF (zera) i jesli AL = 27, skok do koniec

                ; Przejdz do nastepnej linii i powtorz od punktu 2
                add     di, 160         ; przesun DI o 1 wiersz (80 znakow * 2 bajty = 160)
                cmp     di, 4000        ; czy wyszlismy poza 25. linie (25 linii * 160 bajtow = 4000 bajtow)?, ustawia flagi
                jb      nastepna_linia  ; (Jump If Below) sprawdza flage CF (przeniesienie) jeśli == 1 skacze do nastepnej linii

                ; Przejdz do pierwszej linii (zawijanie)
                mov     di, 1           ; opcjonalne zawiniecie z powrotem do 1. linii po 25.
                jmp     nastepna_linia

koniec:         mov     ah, 4Ch         ; AH = 4Ch (funkcja DOS 'zakończ program'), 
                mov     al, 00h         ; AL = 00h (kod powrotu: brak błędów)
                int     21h             ; glowne przerwanie DOS (21h) - AH=4Ch, AL=0, konczy program i zwraca kod powrotu 0 do systemu operacyjnego

; --- PROCEDURA POMOCNICZA ---
; Wejscie: AL = atrybut koloru, DI = poczatek atrybutow w wierszu (nieparzyste)
koloruj_linie:  mov     cx, 80          ; ustawiamy licznik na 80 - ilosc znakow w linii (80 kolumn)
petla_kolor:    stosb                   ; zapisz sam atrybut pod ES:[DI] i zwieksz DI o 1
                inc     di              ; omijamy bajt znaku (nieparzyste DI = atrybut, parzyste DI = znak)
                loop    petla_kolor
                sub     di, 160         ; cofnij DI na poczatek biezacej linii
                ret                     ; return - wraca do miejsca wywołania procedury (miejsca call)

MojProgram      ends

moj_stos        segment stack
                dw      64 dup(?)
moj_stos        ends
                end     start