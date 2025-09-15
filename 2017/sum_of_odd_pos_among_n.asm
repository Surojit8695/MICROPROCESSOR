LXI H, C100H    ; HL -> starting address of array
MVI C, 10       ; C = number of odd-position elements (20/2 = 10)
MVI A, 00       ; A = Accumulator initialized to 0
MVI B, 00       ; B = higher byte for sum (since result may exceed 8-bit)

NEXT: MOV D, M   ; D = current element (odd position)
     ADD D       ; Add to Accumulator
     JNC SKIP    ; If no carry, skip
     INR B       ; If carry, increment higher byte

SKIP: INX H      ; Move to next element (even position, skip)
      INX H      ; Move to next odd position
      DCR C      ; Decrement counter
      JNZ NEXT   ; Repeat until all odd elements are processed

; Now result is in B:A (16-bit)
; Store the result at C200H (low byte) and C201H (high byte)

STA C200H        ; Store low byte (A)
MOV A, B
STA C201H        ; Store high byte (B)
HLT
