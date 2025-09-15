        ;-------------------------------
        ; Decimal to Binary
        ; Input: decimal number at F000H
        ; Output: 8 bits binary stored at F200H..F207H
        ;-------------------------------

        LDA F000H        ; Load decimal number into A
        LXI H,F200H      ; HL -> memory to store binary bits
        MVI C,08H        ; 8 bits counter

NEXTBIT: RLC             ; Rotate A left, MSB -> Carry
         MVI B,00H
         JNC ZERO        ; If Carry=0, store 0
         MVI B,01H       ; If Carry=1, store 1
ZERO:    MOV M,B         ; Store 0 or 1 in memory
         INX H           ; Next memory location
         DCR C           ; Decrement bit counter
         JNZ NEXTBIT

        HLT
