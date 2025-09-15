LXI H,F000    ; HL points to F000H
MOV B,M       ; B = number of values (count) stored at F000H
MVI C,00      ; C = 0 (will count ODD numbers)
MVI D,00      ; D = 0 (will count EVEN numbers)

; Loop starts here
L2: INX H     ; Move to next memory location (point to the data byte)
    MOV A,M   ; Load the data byte into A
    ANI 01H   ; Mask LSB to check if number is odd/even
    JNZ L1    ; If LSB=1 → number is ODD → jump to L1

; Case: EVEN number
    INR D     ; Increment EVEN counter
    DCR B     ; Decrease total count
    JNZ L2    ; If more numbers left → repeat loop
    JMP L4    ; If no more numbers → exit

; Case: ODD number
L1: INR C     ; Increment ODD counter
    DCR B     ; Decrease total count
    JNZ L2    ; If more numbers left → repeat loop

; Store results
L4: MOV A,C   ; Move ODD count into A
    STA FF01  ; Store ODD count at memory location FF01H
    MOV A,D   ; Move EVEN count into A
    STA FF02  ; Store EVEN count at memory location FF02H
    HLT       ; Stop program
