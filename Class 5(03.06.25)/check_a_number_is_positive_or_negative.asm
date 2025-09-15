LDA F000      ; Load the number from memory location F000H into accumulator A
MVI C,00      ; Clear register C (not really needed, but harmless)

ANI 80H       ; AND A with 80H → check the most significant bit (sign bit)
JNZ L2        ; If result ≠ 0 (MSB=1), jump to L2 (number is NEGATIVE)

; Case: Positive number (MSB=0)
MVI C,22H     ; Load 22H into C (represents "Positive")
MOV A,C       ; Copy C into A
STA F002      ; Store A (=22H) into memory F002H
HLT           ; Stop program

; Case: Negative number (MSB=1)
L2: MVI C,11H ; Load 11H into C (represents "Negative")
MOV A,C       ; Copy C into A
STA F002      ; Store A (=11H) into memory F002H
HLT           ; Stop program
