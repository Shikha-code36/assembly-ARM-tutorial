# Conditions and Branches in ARM Assembly

## Introduction
In ARM assembly, branching allows for altering the flow of execution based on conditional tests. These conditions are evaluated through flags set by previous instructions, typically comparison operations.

## Branching Instructions
- **B**: Unconditional branch, jumps to the specified label.
- **BEQ**: Branch if equal, jumps if the last comparison was equal.
- **BNE**: Branch if not equal, jumps if the last comparison was not equal.
- **BGT**: Branch if greater than, jumps if the last comparison showed greater than.
- **BLT**: Branch if less than, jumps if the last comparison showed less than.
- **BLE**: Branch if less than or equal to, jumps if the last comparison showed less than or equal.
- **BAL**: Branch always, an unconditional jump (equivalent to B).

## Example Code Explanation
```assembly
.global _start
_start:
    MOV R0,#1
    MOV R1,#2
    
    CMP R0,R1 
    
    BGT greater
    BAL default
    
greater:
    MOV R2,#1

default:
    MOV R2,#2
```

### Line-by-Line Breakdown:
1. `MOV R0,#1`: Load the immediate value 1 into register R0.
2. `MOV R1,#2`: Load the immediate value 2 into register R1.
3. `CMP R0,R1`: Compare the values in registers R0 and R1.
4. `BGT greater`: If R0 is greater than R1, branch to the label 'greater'.
5. `BAL default`: Unconditionally branch to the label 'default'.

### Execution Flow:
- The `CMP` instruction sets condition flags based on the comparison of `R0` and `R1`.
- If `R0` is greater than `R1`, execution jumps to `greater`, setting `R2` to 1.
- If not, it falls through to `default` due to the unconditional branch (`BAL`), setting `R2` to 2.

In this example, since `R0` contains 1 and `R1` contains 2, the condition for `BGT` is not met. Therefore, execution proceeds to the 'default' label where `R2` is set to 2.
