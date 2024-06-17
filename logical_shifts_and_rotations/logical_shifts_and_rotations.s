.global _start
_start:
	MOV R0, #15
	LSL R0, #1
	LSR R0, #1
	
	MOV R1,R0,LSL #1
	
	ROR R0,#1
	
	