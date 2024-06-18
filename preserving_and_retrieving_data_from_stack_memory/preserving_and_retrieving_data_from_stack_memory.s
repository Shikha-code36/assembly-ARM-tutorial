.global _start
_start:
	MOV R0,#1
	MOV R1,#3
	PUSH {R0,R1}
	BL get_value
	POP {R0,R1}
	B end
	
get_value:
	MOV R0,#5
	MOV R1,#7
	ADD R2,R0,R1
	BX lr
	
end: