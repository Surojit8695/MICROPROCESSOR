; ----- 1's Complement -----
LHLD F000      ; HL = 16-bit number from F000:F001
MOV A,L        ; A = low byte
CMA            ; 1's complement
MOV L,A
MOV A,H        ; A = high byte
CMA            ; 1's complement
MOV H,A
SHLD F002      ; store 1's complement at F002:F003

; ----- 2's Complement -----
LHLD F000      ; HL = original number again

; Take 1's complement
MOV A,L
CMA
MOV L,A
MOV A,H
CMA
MOV H,A

; Add 1
INX H          ; HL = HL + 1

; Store result
SHLD F004      ; store 2's complement at F004:F005

HLT
