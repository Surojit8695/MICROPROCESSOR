        ; Store Fibonacci series starting at memory location FF01

        LXI H,FF01     ; HL points to starting memory

        ; First term = 00
        MVI A,00
        MOV M,A        ; store at (HL)
        INX H          ; point to next location

        ; Second term = 01
        MVI A,01
        MOV M,A
        INX H

        ; Counter (total terms = 7 here as example)

        LDA F000
        MOV B,A
        DCR B          ; adjust for first 2 terms already stored
        DCR B

        ; Initialization
        MVI C,00       ; C = first term
        MVI D,01       ; D = second term

L1:     MOV A,C        ; A = previous term
        ADD D          ; A = C + D
        DAA; this  daa instructionis use to store value in decimal form it is not compalsory
        MOV M,A        ; store result at (HL)
        INX H

        MOV C,D        ; C = old second
        MOV D,A        ; D = new term

        DCR B
        JNZ L1

        HLT
