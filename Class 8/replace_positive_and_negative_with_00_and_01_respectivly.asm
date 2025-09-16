LXI H, F000
        MVI C, 05H

NEXT:   MOV A, M
        ANI 80H
        JNZ NEGATIVE
POS:    MVI A, 00H
        JMP STORE

NEGATIVE:
        MVI A, 10H

STORE:  MOV M, A
        INX H
        DCR C
        JNZ NEXT

        HLT