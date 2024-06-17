.global _start
.equ endlist, 0xaaaaaaaa

_start:
	LDR R0,=list
	LDR R3,=endlist
	LDR R1,[R0]
	ADD R2,R2,R1

loop:
	LDR R1,[R0,#4]!
	CMP R1,R3
	BEQ exit
	ADD R2,R2,R1
	BAL loop
	
exit:

.data
list:
	.word 1,2,3,4,5,6,7,8,9,10
	