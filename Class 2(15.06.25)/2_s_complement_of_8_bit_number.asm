LDA F000     ; Load number from F000
CMA          ; 1's complement
ADI 01H      ; Add 1 → gives 2's complement
STA F002     ; Store result at F002
HLT
