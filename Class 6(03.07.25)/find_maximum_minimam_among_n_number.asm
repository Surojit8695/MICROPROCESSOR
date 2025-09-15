        LXI H,F000      ; HL -> starting address of the array
        MOV B,M         ; B = number of elements (N)
        INX H           ; move HL to first element
        MOV A,M         ; A = first element
        MOV D,A         ; D = current maximum
        MOV E,A         ; E = current minimum
        DCR B           ; since first element is already considered

L1:     INX H           ; point HL to next element
        MOV A,M         ; A = current element

        CMP D           ; compare with current maximum (A ? D)
        JC L3           ; if A < D → skip update
        MOV D,A         ; else update maximum = A

L3:     CMP E           ; compare with current minimum (A ? E)
        JNC L5          ; if A >= E → skip update
        MOV E,A         ; else update minimum = A

L5:     DCR B           ; decrease count
        JNZ L1          ; repeat until all elements checked

        MOV A,D         ; A = maximum
        STA FF01        ; store maximum at FF01

        MOV A,E         ; A = minimum
        STA FF02        ; store minimum at FF02

        HLT             ; stop execution
