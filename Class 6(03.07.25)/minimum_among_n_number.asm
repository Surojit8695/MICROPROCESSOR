        LXI H,F000      ; HL points to F000
        MOV B,M         ; B = N (number of elements)
        DCR B           ; Adjust count (since we take first element separately)

        INX H           ; HL -> first element
        MOV A,M         ; A = first element (assume minimum)

NEXT:   INX H           ; move to next element
        CMP M           ; compare A (min so far) with M (current element)
        JC SKIP         ; if A < M, keep A (no change)
        MOV A,M         ; else update A = new minimum

SKIP:   DCR B           ; decrement counter
        JNZ NEXT        ; repeat until all elements checked

        STA FF01        ; store minimum at FF01
        HLT             ; end
