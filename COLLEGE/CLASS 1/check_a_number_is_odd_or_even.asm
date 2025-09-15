LDA F000     ; Load number from memory
ANI 01       ; AND with 01H to check LSB
JZ EVEN      ; If result is zero, it's even
MVI A,11     ; Odd case: load 11H
JMP STORE
EVEN: MVI A,22 ; Even case: load 22H
STORE: STA F001 ; Store result
HLT