        ; Store Fibonacci series starting at memory location FF01

        LXI H,FF01     ; HL points to starting memory

        ; First term = 05H   (changed from 00H)
        MVI A,05H
        MOV M,A
        INX H

        ; Second term = 06H  (changed from 01H, because next term after 5 is 6)
        MVI A,06H
        MOV M,A
        INX H

        ; Initialization
        MVI C,05H      ; C = first term   (changed from 00)
        MVI D,06H      ; D = second term  (changed from 01)

L1:     MOV A,C        ; A = previous term
        ADD D          ; A = C + D
        DAA            ; optional, to keep result in BCD if needed

        CPI 70H        ; compare result with 70H (changed: new stop condition)
        JNC END        ; if result >= 70H → stop

        MOV M,A        ; store result
        INX H

        MOV C,D        ; C = old second
        MOV D,A        ; D = new term

        JMP L1         ; repeat until value >= 70H

END:    HLT
