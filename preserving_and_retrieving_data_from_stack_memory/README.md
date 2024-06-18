# Preserving and Retrieving Data From Stack Memory

In computer architecture, stack memory plays a crucial role in managing data during program execution, particularly when dealing with function calls and local variables. The stack is a special region of memory that operates on a Last In, First Out (LIFO) principle, meaning that the last piece of data placed onto the stack will be the first one to be removed. This feature is particularly useful for preserving the state of a program at a certain point, such as before calling a subroutine, and then retrieving it later.

## Subroutine in Assembly
A subroutine is a sequence of program instructions that perform a specific task, packaged as a unit. This unit can then be used in programs wherever that particular task should be performed.

## Assembly Code Explanation
Below is an assembly code snippet that demonstrates how data can be preserved on the stack before calling a subroutine and how it can be retrieved afterward:

```assembly
.global _start
_start:
	MOV R0,#1       ; Move literal value 1 into register R0
	MOV R1,#3       ; Move literal value 3 into register R1
	PUSH {R0,R1}    ; Push registers R0 and R1 onto the stack
	BL get_value    ; Branch with link to subroutine 'get_value'
	POP {R0,R1}     ; Pop values from the stack back into registers R0 and R1
	B end           ; Branch to label 'end'

get_value:
	MOV R0,#5       ; Move literal value 5 into register R0 (overwriting previous value)
	MOV R1,#7       ; Move literal value 7 into register R1 (overwriting previous value)
	ADD R2,R0,R1    ; Add values in R0 and R1, store result in R2
	BX lr           ; Branch to address in link register (return from subroutine)

end:
```

### Line by Line Explanation:
- `.global _start`: This directive makes the `_start` label globally accessible, marking it as an entry point for the program.
- `_start:`: This label indicates where the program should start executing.
- `MOV R0,#1`: Moves the literal value `1` into register `R0`.
- `MOV R1,#3`: Moves the literal value `3` into register `R1`.
- `PUSH {R0,R1}`: Pushes the contents of registers `R0` and `R1` onto the stack. This preserves their values before calling the subroutine.
- `BL get_value`: The 'Branch with Link' instruction calls the subroutine `get_value`. It also stores the return address in the link register (`lr`).
- `POP {R0,R1}`: Pops values off the stack back into registers `R0` and `R1`, retrieving their original values.
- `B end`: Branches to label `end`, effectively ending the program.

### Subroutine Explanation:
- `get_value:`: Label marking the start of the subroutine.
- `MOV R0,#5`: Moves the literal value `5` into register `R0`.
- `MOV R1,#7`: Moves the literal value `7` into register `R1`.
- `ADD R2,R0,R1`: Adds values in registers `R0` and `R1`, storing the result in register `R2`.
- `BX lr`: 'Branch and Exchange' instruction causes a branch to the address contained in the link register (`lr`), which returns control to the point after where the subroutine was called.

### Flow of Code:
The flow starts at `_start`, where it initializes registers and preserves their values on the stack. It then calls a subroutine (`get_value`) that performs an addition operation. After returning from the subroutine, it retrieves the preserved values from the stack before ending execution at label 'end'.

This simple example illustrates how data can be safely stored on and retrieved from stack memory across subroutine calls, ensuring that each function has access to its required data without interfering with other parts of a program.