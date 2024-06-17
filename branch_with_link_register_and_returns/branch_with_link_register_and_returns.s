.global _start
_start:
	
	MOV R0,#1
	MOV R1,#3
	BL add2
	MOV R3,#4
	
add2:
	ADD R2,R0,R1
	bx lr