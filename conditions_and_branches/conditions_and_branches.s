.global _start
_start:
	MOV R0,#3
	MOV R1,#2
	
	CMP R0,R1 
	
	BGT greater
	BAL default
	
greater:
	MOV R2,#1

default:
	MOV R2,#2

	