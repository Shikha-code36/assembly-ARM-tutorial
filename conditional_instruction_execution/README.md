# Conditional Instruction Execution in ARM Assembly

This ARM assembly code snippet demonstrates the use of conditional execution of instructions. Below is a line-by-line explanation of the code and its flow:

## Code Snippet
```
.global _start
_start:

    MOV R0,#2
    MOV R1,#4
    CMP R0,R1

    ADDLT R2,R2,#1
    MOVGE R2,R2,#5
```

## Explanation

- `.global _start`: This line declares `_start` as a global label, making it visible to the linker. It's the entry point of the program.

- `_start:`: This is a label that marks the beginning of the code segment.

- `MOV R0,#2`: Moves the literal value `2` into register `R0`.

- `MOV R1,#4`: Moves the literal value `4` into register `R1`.

- `CMP R0,R1`: Compares the values in `R0` and `R1`. This sets the condition flags based on whether the value in `R0` is less than, equal to, or greater than the value in `R1`.

- `ADDLT R2,R2,#1`: If the result of the comparison is Less Than (LT), this instruction adds `1` to the value in `R2` and stores the result back in `R2`. This instruction is executed only if `R0` is less than `R1`.

- `MOVGE R2,R2,#5`: If the result of the comparison is Greater than or Equal (GE), this instruction moves the literal value `5` into register `R2`. This instruction is executed only if `R0` is greater than or equal to `R1`.

The conditional instructions (`ADDLT`, `MOVGE`) make use of condition codes set by the preceding `CMP` instruction to determine whether they should be executed.

Conditional execution helps in reducing branch instructions and can lead to more efficient code by avoiding pipeline flushes due to branch mispredictions.
