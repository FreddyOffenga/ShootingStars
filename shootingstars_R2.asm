; Shooting stars
; F#READY, 2022-01-14

; Release 2 
; enabled ATRACT in GTIA 10
; progressing sound using timer 19 
; thanks to Superogue for asking if ATRACT change was possible :)

GPRIOR      = $26f      ; GTIA modes: $40=9,$80=10,$c0=11
CHBAS       = $2f4      ; character base

my_font     = $7000

            org $80

            lsr CHBAS
            dec 77

loop
hiero = *+1            
            lax $d20a

            lsr
            lsr
            lsr
            sta my_font,x

            and #$0f
            sta $bc40,x
            
            and 19
            sta $d201

            jsr $f50c       ; insert line at top of screen
            sty GPRIOR

            bvc loop
