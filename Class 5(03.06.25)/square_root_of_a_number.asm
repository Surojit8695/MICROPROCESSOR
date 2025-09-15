	   LXI H,F000	// HL points to input location (N)
	   MOV A,M	// A = N
	   MVI C,01	// C = odd number to subtract (start with 1)
	   MVI B,00	// B = result (square root)

L1:	   CMP C	// Compare A with current odd number
	   JC L2	// If A < C, done
	   SUB C	// A = A - C
	   INR B	// B = B + 1
	   INR C	// C = C + 1
	   INR C	// C = C + 1 → next odd number
	   JMP L1

L2:	   MOV A,B	// A = square root
	   STA F001	// Store result at F001
	   HLT
