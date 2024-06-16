## Code Breakdown

### The `.data` Section

```assembly
.data
list:
    .word 4,5,-9,1,0,2,-3
```

- **.data**: This directive indicates that we're starting a section for defining data.
- **list**: This is a label that acts as a pointer to the beginning of our data in memory.
- **.word**: This directive defines a series of 32-bit values (words). In ARM, a word is 32 bits or 4 bytes.

### The `.global` Directive and `_start` Label

```assembly
.global _start
_start:
```

- **.global _start**: This line makes the `_start` label accessible from other files, which is useful when linking multiple files.
- **_start**: This label marks the entry point of our program where execution begins.

### Loading Data with `LDR` Instruction

```assembly
    LDR R0,=list
    LDR R1, [R0]
    LDR R2,[R0,#4]!
    LDR R2,[R0],#4
```

- **LDR R0,=list**: Loads the address of `list` into register R0.
- **LDR R1, [R0]**: Loads the first word from `list` into register R1 (which is `4`).
- **LDR R2,[R0,#4]!**: Pre-increment load; increments R0 by 4 (to point to `5`) and loads that into R2.
- **LDR R2,[R0],#4**: Post-increment load; loads the word at current R0 (which is `-9`) into R2 and then increments R0 by 4.

### Understanding Addressing Modes

Addressing modes in ARM determine how the processor calculates the effective address of an operand:

- **Pre-increment**: The register is incremented before it's used for addressing. For example:
  ```assembly
  LDR R2,[R0,#4]!
  ```
  Here, `R0` is incremented first, then `list[R0]` is accessed.

- **Post-increment**: The register is used for addressing and then incremented. For example:
  ```assembly
  LDR R2,[R0],#4
  ```
  Here, `list[R0]` is accessed first, then `R0` is incremented.

## Conclusion

Through this guide, you've learned about data declaration in `.data`, program entry with `.global _start`, loading data with `LDR`, and addressing modes. These are foundational concepts that will aid you as you delve deeper into ARM assembly programming.
