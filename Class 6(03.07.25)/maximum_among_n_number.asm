        LXI H,F000      ; HL -> F000
        MOV B,M         ; B = N (number of elements)
        DCR B           ; Adjust count (since we take first element separately)

        INX H           ; HL -> first element
        MOV A,M         ; A = first element (assume maximum)

NEXT:   INX H           ; move to next element
        CMP M           ; compare A (max so far) with M (current element)
        JNC SKIP        ; if A >= M, keep A (no change)
        MOV A,M         ; else update A = new maximum

SKIP:   DCR B           ; decrement counter
        JNZ NEXT        ; repeat until all elements checked

        STA FF01        ; store maximum at FF01
        HLT             ; end
