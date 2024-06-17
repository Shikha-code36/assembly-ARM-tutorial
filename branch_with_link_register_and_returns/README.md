# Branch with Link Register and Returns in ARM

## Introduction
In ARM assembly, branching is a fundamental concept that allows for the execution flow to jump from one part of the program to another. The `BL` (Branch with Link) instruction is particularly important as it not only branches to a subroutine but also stores the return address in the link register (LR), which is `R14`. This enables the subroutine to return to the point immediately after where it was called using `bx lr`.

## Code Explanation

```assembly
.global _start
_start:
	
	MOV R0,#1  ; Move immediate value 1 into register R0.
	MOV R1,#3  ; Move immediate value 3 into register R1.
	BL add2    ; Branch with link to subroutine 'add2' and store return address in LR.
	MOV R3,#4  ; Move immediate value 4 into register R3 (this line is executed after returning from 'add2').
	
add2:
	ADD R2,R0,R1  ; Add values in R0 and R1, store result in R2.
	bx lr         ; Branch to address in link register, effectively returning to caller.
```

### _start Label
- The `_start` label marks the beginning of the program. This is where execution starts after loading the program.

### MOV Instructions
- `MOV R0,#1` and `MOV R1,#3` are move instructions that load the registers `R0` and `R1` with immediate values `1` and `3`, respectively.

### BL Instruction
- `BL add2` is a branch with link instruction. It performs two actions:
  - It branches execution to the label `add2`, which marks the beginning of a subroutine.
  - It stores the return address (the address of the instruction following `BL`, which is `MOV R3,#4`) into the link register (`LR` or `R14`).

### add2 Subroutine
- The `add2` label marks a subroutine designed to add two numbers.
- The `ADD R2,R0,R1` instruction adds the values of `R0` and `R1`, then stores the result in `R2`.
- After performing its task, the subroutine uses `bx lr` to return to the caller. The `bx lr` instruction causes a branch to the address stored in the link register (`LR`). In this case, it returns to the instruction following the `BL add2`, which is `MOV R3,#4`.

### MOV Instruction After BL
- The instruction `MOV R3,#4` is executed after returning from the subroutine. It moves an immediate value of `4` into register `R3`.

## Conclusion
The use of the link register (`LR`) and branch with link (`BL`) instructions allows for efficient subroutine calls within ARM assembly programs. By storing the return address in a dedicated register, subroutines can perform their tasks and then return control back to the main program flow seamlessly.

