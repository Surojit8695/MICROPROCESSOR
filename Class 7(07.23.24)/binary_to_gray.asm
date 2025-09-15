        LXI H, F000     ; HL = F000 (base address)
        MOV B, M        ; B = value at F000
        MOV A, M        ; A = same value from F000

        RRC             ; rotate accumulator right through carry
                        ; bit0 -> CY, and CY -> bit7
                        ; so A’s bits shift right by 1, MSB gets old LSB

        ANI 7F          ; mask the MSB (bit7 = 0 always, keep lower 7 bits)

        XRA B           ; A = A XOR B (compare modified value with original)

        STA F001        ; store result at F001
        HLT             ; stop program
