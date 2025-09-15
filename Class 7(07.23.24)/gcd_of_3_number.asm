LXI H,F000      ; HL points to F000 (where numbers are stored)
MOV A,M         ; Load first number (A = M[F000])
INX H           ; HL -> F001
MOV B,M         ; Load second number (B = M[F001])

; ---------- GCD of A and B ----------
L5: CMP B       ; Compare A with B
JZ SKIP         ; If A == B, GCD found → jump to SKIP
JC L1           ; If A < B → swap numbers (so A always >= B)
SUB B           ; Else A > B → A = A - B
JMP L5          ; Repeat until equal

L1: MOV E,A     ; Save A temporarily in E
MOV A,B         ; A = B
MOV B,E         ; B = old A
SUB B           ; A = A - B (because A < B, we swapped)
JMP L5          ; Repeat loop

SKIP:           ; Here A == B → GCD of first two numbers in A

; ---------- Now GCD with 3rd number ----------
INX H           ; HL -> F002
MOV B,M         ; Load third number (B = M[F002])

L25: CMP B      ; Compare A with B
JZ SKIP2        ; If A == B, final GCD found
JC L21          ; If A < B → swap
SUB B           ; Else A > B → A = A - B
JMP L25

L21: MOV E,A    ; Save A in E
MOV A,B         ; A = B
MOV B,E         ; B = old A
SUB B           ; A = A - B
JMP L25

SKIP2:          ; Here A == B → final GCD is in A
STA F004        ; Store result at F004

HLT             ; Stop program
