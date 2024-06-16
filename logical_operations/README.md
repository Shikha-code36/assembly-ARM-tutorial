# Logical Operations

This code snippet is written in ARM assembly language and demonstrates the use of basic data processing instructions such as MOV, AND, ANDS, ORR, EOR, and MVN.

## Code Breakdown
- `MOV R0,#0xFF`: This instruction moves the hexadecimal value 0xFF into register R0.
- `MOV R1,#22`: Moves the decimal value 22 into register R1.
- `AND R2,R0,R1`: Performs a bitwise AND operation between the values in R0 and R1, storing the result in R2.
- `ANDS R2,R0,R1`: Similar to AND, but this instruction also updates the condition flags based on the result.
- `ORR R2,R0,R1`: Performs a bitwise OR operation between R0 and R1, storing the result in R2.
- `EOR R2,R0,R1`: Performs a bitwise Exclusive OR operation between R0 and R1, storing the result in R2.

## Using ANDS instead of AND
The `ANDS` instruction is used instead of `AND` when we want to update the condition flags based on the result of the operation. Condition flags can affect subsequent instructions depending on their outcomes.

## Negation with MVN
- `MVN R0,R0`: The MVN (Move Not) instruction performs bitwise negation (NOT) on the value in R0 and stores the result back into R0.

## Purpose of the Code Block
The last three instructions:
```
MOV R0,#0xFF
MVN R0,R0
AND R0,R0,#0x000000FF
```
These lines set register R0 to 0xFF, then negate it (which would result in 0xFFFFFF00 on a 32-bit system), and finally perform an AND operation with 0x000000FF. The purpose here is to demonstrate negation and then isolate the lower 8 bits of the register by clearing out all other bits.

## Code Breakdown with Outputs
- `MOV R0,#0xFF`: Moves the hexadecimal value 0xFF (255 in decimal) into register R0.
- `MOV R1,#22`: Moves the decimal value 22 into register R1.

Now, let's calculate the results of the bitwise operations:

- `AND R2,R0,R1`: The binary representation of R0 (0xFF) is `11111111`, and R1 (22) is `00010110`. The AND operation will result in `00010110` (22 in decimal) being stored in R2 because only the bits that are set in both R0 and R1 remain set.

- `ANDS R2,R0,R1`: This will produce the same result as the AND operation, `00010110` (22 in decimal), but it will also update the condition flags based on this result. For example, if the result is zero, the zero flag will be set.

- `ORR R2,R0,R1`: The OR operation sets a bit in R2 if it is set in either R0 or R1. So, `11111111` OR `00010110` will result in `11111111` being stored in R2, which is 255 in decimal.

- `EOR R2,R0,R1`: The Exclusive OR operation sets a bit in R2 if it is set in one operand but not both. So, `11111111` EOR `00010110` will result in `11101001` being stored in R2, which is 233 in decimal.

For the negation part:
- `MOV R0,#0xFF`: Sets R0 to 255 (`11111111`).
- `MVN R0,R0`: Negates the value in R0. The negation of `11111111` is `00000000` on a 32-bit system since MVN flips all bits.
- `AND R0,R0,#0x000000FF`: This AND operation won't change the value because it's essentially ANDing with itself. So, R0 remains as `00000000`.
