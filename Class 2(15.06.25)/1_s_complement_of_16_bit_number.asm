LHLD F000      ; HL = 16-bit number from F000:F001
MOV A,L        ; A = low byte
CMA            ; 1's complement
MOV L,A        ; store back to L
MOV A,H        ; A = high byte
CMA            ; 1's complement
MOV H,A        ; store back to H
SHLD F002      ; store result at F002:F003
HLT
