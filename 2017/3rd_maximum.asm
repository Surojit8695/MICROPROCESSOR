LXI H, F000     ; HL -> start address
MOV B, M        ; B = count
DCR B           ; loop for n-1 numbers
INX H
MOV A, M
MOV D, A        ; D = 1st max
MOV E, A        ; E = 2nd max
MOV L, A        ; L = 3rd max

L1: INX H
    MOV A, M
    CMP D
    JC L2
    ; A > 1st max
    MOV L, E    ; 3rd = 2nd
    MOV E, D    ; 2nd = 1st
    MOV D, A    ; 1st = A
    JMP L4

L2: CMP E
    JC L3
    ; A > 2nd max but < 1st
    MOV L, E    ; 3rd = 2nd
    MOV E, A    ; 2nd = A
    JMP L4

L3: CMP L
    JC L4
    ; A > 3rd max but < 2nd
    MOV L, A

L4: DCR B
    JNZ L1

; Store results
MOV A, D
STA FF01       ; 1st max
MOV A, E
STA FF02       ; 2nd max
MOV A, L
STA FF03       ; 3rd max
HLT