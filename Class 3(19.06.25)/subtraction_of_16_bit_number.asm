; Assume F000:F001 = N1 (16-bit number)
;        F002:F003 = N2 (16-bit number)
; Result → F004:F005

LHLD F000      ; HL = N1
XCHG           ; DE = N1
LHLD F002      ; HL = N2  (now HL = N2, DE = N1)

; --- Subtract ---
MOV A,E        ; A = low(N1)
SUB L          ; A = A - low(N2)
MOV L,A        ; Store result low byte

MOV A,D        ; A = high(N1)
SBB H          ; A = A - high(N2) - borrow
MOV H,A        ; Store result high byte

; Store final 16-bit result
SHLD F004

HLT