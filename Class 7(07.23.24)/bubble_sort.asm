LXI H, F000     ; HL points to F000
MOV C, M        ; C ← count of elements (N)
DCR C           ; C ← N-1 (outer loop count)
L3: MOV D, C    ; D ← C (inner loop count)
LXI H, F001     ; Point HL to first data element

L2: MOV A, M    ; A ← M[i]
INX H           ; HL points to M[i+1]
CMP M           ; Compare A with M[i+1]
JC L1           ; If A < M[i+1], skip swap
MOV E, M        ; E ← M[i+1]
MOV M, A        ; M[i+1] ← A
DCX H           ; HL back to M[i]
MOV M, E        ; M[i] ← E (swap complete)
INX H           ; HL forward to M[i+1] again

L1: DCR D       ; Decrement inner loop counter
JNZ L2          ; Repeat inner loop if D ≠ 0
DCR C           ; Decrement outer loop counter
JNZ L3          ; Repeat outer loop if C ≠ 0
HLT             ; Done
