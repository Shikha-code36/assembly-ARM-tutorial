# Logical Shifts and Rotations

## Theory

In ARM assembly, logical shifts and rotations are operations that allow you to manipulate the bits of a register value.

### LSL (Logical Shift Left)
The `LSL` instruction shifts all bits in a specified register to the left by a certain number of positions. Bits that are shifted off the end are lost, and zeros are shifted in from the right. This operation effectively multiplies the register value by 2 for each shift position.

### LSR (Logical Shift Right)
The `LSR` instruction shifts all bits in a specified register to the right by a certain number of positions. Bits that are shifted off the end are lost, and zeros are shifted in from the left. This operation effectively divides the register value by 2 for each shift position, rounding towards zero.

### ROR (Rotate Right)
The `ROR` instruction rotates all bits in a specified register to the right by a certain number of positions. The bits that are rotated off the end are reintroduced on the left. This is different from `LSR` as it preserves all bits and simply changes their positions.

## Code Explanation

```assembly
.global _start
_start:
	MOV R0, #15      ; Load literal value 15 into R0.
	LSL R0, #1       ; Perform logical shift left on R0 by 1 position.
	LSR R0, #1       ; Perform logical shift right on R0 by 1 position.
	
	MOV R1, R0, LSL #1 ; Move the value of R0 shifted left by 1 into R1.
	
	ROR R0, #1       ; Rotate right R0 by 1 position.
```

### Line-by-Line Explanation

- `MOV R0, #15`: This instruction moves the literal value 15 into register R0.
- `LSL R0, #1`: This instruction shifts all bits in R0 to the left by one position. The value in R0 becomes 30 (15 * 2).
- `LSR R0, #1`: This instruction shifts all bits in R0 to the right by one position. The value in R0 becomes 15 (30 / 2).
- `MOV R1, R0, LSL #1`: This instruction moves into R1 the value of R0 shifted left by one position. The value in R1 becomes 30.
- `ROR R0, #1`: This instruction rotates all bits in R0 to the right by one position. If we consider that before this operation, R0 had a value of 15 (00001111 in binary), after rotation, it would be (10000111 in binary), which is 135.

## Output Explanation

After executing the above lines of code:

- The final value in **R0** is **135**, due to the rotate right operation.
- The final value in **R1** is **30**, as it was moved from R0 after performing a logical shift left.

