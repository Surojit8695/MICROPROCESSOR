        ; Store Fibonacci series starting at memory location FF01
        ; Generate until < 70H
        ; Finally add last two numbers and store at C300H

        LXI H,FF01     ; HL -> starting memory location

        ; First term = 05H
        MVI A,05H
        MOV M,A
        INX H

        ; Second term = 06H
        MVI A,06H
        MOV M,A
        INX H

        ; Initialization
        MVI C,05H      ; C = first term
        MVI D,06H      ; D = second term

L1:     MOV A,C        ; A = previous term
        ADD D          ; A = C + D
        DAA            ; optional BCD adjust

        CPI 70H        ; check if result >= 70H
        JNC LASTSUM    ; if >= 70H → exit loop

        MOV M,A        ; store result
        INX H

        MOV C,D        ; update C = old second
        MOV D,A        ; update D = new term

        JMP L1

; ---- At this point: C and D are last two valid terms ----
LASTSUM:
        MOV A,C        ; load 2nd last term
        ADD D          ; add last + second last
        STA C300H      ; store sum at C300H (chosen location)

        HLT


;this can also perfrom last two term sum
LASTSUM: 
        DCX H          ; HL → last stored number
        MOV A,M        ; A = last Fibonacci number
        DCX H          ; HL → second last number
        MOV B,M        ; B = second last number

        ADD B          ; A = last + second last
        STA C300H      ; store sum at C300H

        HLT
