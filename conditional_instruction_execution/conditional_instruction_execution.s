.global _start
_start:
	
	MOV R0,#2
	MOV R1,#4
	CMP R0,R1
	
	ADDLT R2,#1
	MOVGE R2,#5