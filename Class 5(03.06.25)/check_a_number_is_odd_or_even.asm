LDA F000      ; Load the content of memory location F000H into A
MVI C,00      ; Clear register C (C = 00H, used as temp/result)

ANI 01        ; Logical AND A with 01H → check if least significant bit (LSB) is 1
JNZ L2        ; If result ≠ 0 (LSB = 1, i.e. number is odd), jump to L2

; If number is even:
MVI C,22      ; Put 22H into C (meaning: even flag)
MOV A,C       ; Move C into A
STA F002      ; Store A (=22H) at memory location F002H
HLT           ; Stop program

; If number is odd:
L2: MVI C,11  ; Put 11H into C (meaning: odd flag)
MOV A,C       ; Move C into A
STA F002      ; Store A (=11H) at memory location F002H
HLT           ; Stop program
