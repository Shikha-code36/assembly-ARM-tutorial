.global _start
_start:
	LDR R0,=list
	LDR R1, [R0]
	LDR R2,[R0,#4]!
	LDR R2,[R0],#4
	
.data
list:
	.word 4,5,-9,1,0,2,-3
