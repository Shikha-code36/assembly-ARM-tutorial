# Guide to ARM Assembly Language

## Introduction
ARM assembly language is a low-level programming language designed for ARM (Advanced RISC Machine) processors, which are prevalent in embedded systems like smartphones and laptops. It enables direct interaction with the hardware, offering precise control over the device's operations.

It is estimated that over 200 billion devices contain an ARM chip, making the arm language valuable to understand. By understanding the arm assembly language, programmers can work at a lower level, allowing them to write code that interacts with hardware in an efficient manner. Arm is a programming language that's used in a variety of different applications. You see it in a lot of different embedded devices. And really popular devices such as different phones, a lot of Android devices and some iPhone devices are running ARM based chips.

## Registers
Registers are fast-access storage locations within the CPU that hold data temporarily during execution. They play a crucial role in assembly language programming due to their speed compared to memory access.

### General-Purpose Registers (R0-R6)
- **R0-R6**: Used for general computations and temporary storage.
- **Example**: Storing and adding numbers.
  ```assembly
  MOV R0, #5    ; Move 5 into R0
  MOV R1, #10   ; Move 10 into R1
  ADD R2, R0, R1; Add R0 and R1, result in R2 (R2 = 15)
  ```

### Special-Purpose Registers
- **R7**: System Call Register for OS services.
  ```assembly
  MOV R7, #1    ; System call number for program exit
  SWI 0         ; Invoke system call
  ```
- **SP (Stack Pointer)**: Points to the stack's top for managing function calls and local variables.
  ```assembly
  PUSH {R0}     ; Push R0 onto the stack
  POP {R0}      ; Pop from stack into R0
  ```
- **LR (Link Register)**: Holds the return address for functions.
  ```assembly
  BL function   ; Call 'function', store return address in LR
  ```
- **PC (Program Counter)**: Points to the next instruction.
  ```assembly
  LDR PC, [R0]   ; Load address into PC from R0
  ```

### CPSR (Current Program Status Register)
Stores flags indicating conditions after operations, like negative or zero results. It guides conditional execution based on these flags.

**Example**: Using flags for conditional branching.
```assembly
CMP R0, R1     ; Compare R0 and R1
BEQ label      ; If equal (Zero flag set), branch to 'label'
```

## Memory Sizes
- **Word**: Maximum data size for a register (32 bits on a 32-bit processor).
- **Half-word**: Half of a word (16 bits).
- **Byte**: Always 8 bits.

## Stack Memory
A slower but larger capacity memory used for complex data like arrays. Managed using the stack pointer (SP).

## Detailed Register Usage Examples

### Using General-Purpose Registers
```assembly
MOV R3, #15   ; Store 15 in R3
MOV R4, #20   ; Store 20 in R4
MUL R5, R3, R4; Multiply R3 by R4, result in R5 (R5 = 300)
```

### Managing Function Calls with LR and SP
```assembly
PUSH {LR}     ; Save LR before function call
BL some_func  ; Call 'some_func', LR updated with return address
POP {LR}      ; Restore LR after function return
```

### Conditional Execution with CPSR Flags
```assembly
SUBS R6, R4, R3; Subtract R3 from R4, update flags based on result
BMI negative   ; Branch to 'negative' if result is negative (Negative flag set)
```

This guide provides an organized overview of ARM assembly language programming concepts.Beginners can use this as a foundation for further learning and practice in ARM assembly programming.


### File Extensions for ARM Assembly

- **.s**: Use this extension for ARM assembly code files intended for the GNU Assembler (GAS), which is part of the GNU toolchain commonly used on Linux systems, including the Raspberry Pi.

- **.asm**: This extension can also be used for assembly code files but is more commonly associated with Intel syntax and assemblers like NASM or MASM. For ARM assembly on Raspberry Pi, `.s` is the preferred extension when using GAS.

### Follow the Guide

- [x] [First Program](first_program)
- [x] [Addressing Modes](addressing_modes)
- [x] [Arithmetic and CPSR Flags](arithmetic_and_cpsr_flags)
- [x] [Logical Operations](logical_operations)
- [x] [Logical Shifts and Rotations](logical_shifts_and_rotations)
- [x] [Conditions and Branches](conditions_and_branches)
- [x] [Loops with Branches](loops_with_branches)
