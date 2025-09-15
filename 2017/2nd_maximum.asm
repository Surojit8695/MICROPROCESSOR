LXI H,F000     ; HL -> starting address
MOV B,M        ; B = count (n)

INX H          ;first element
MOV A,M        ;copy first element to ccumulator
MOV D,A        ; D = first max
MOV E,A        ; E = second max

DCR B          ; loop count = n-1

L1: INX H
    MOV A,M
    CMP D
    JC L2       ; if A < D → check for second max
    MOV E,D     ; shift first max to second max
    MOV D,A     ; update first max
    JMP L3

L2: CMP E
    JC L3       ; if A < E → no update
    MOV E,A     ; update second max

L3: DCR B
    JNZ L1

; Store results
MOV A,D
STA FF01       ; first max
MOV A,E
STA FF02       ; second max
HLT