# Loops with Branches

This README.md provides a detailed explanation of an ARM assembly code snippet that demonstrates the use of loops with branches. The code calculates the sum of a list of numbers using a loop structure.

## Code Explanation

### Setup
```assembly
.global _start
.equ endlist, 0xaaaaaaaa
```
- `.global _start`: This line makes the `_start` label accessible from other files, which is necessary for the linker.
- `.equ endlist, 0xaaaaaaaa`: This line defines a constant `endlist` with the value `0xaaaaaaaa`, which we'll use as a sentinel value to mark the end of our list.

### Entry Point
```assembly
_start:
	LDR R0,=list
	LDR R3,=endlist
	LDR R1,[R0]
	ADD R2,R2,R1
```
- `_start:`: This label marks the entry point of our code.
- `LDR R0,=list`: Loads the address of the `list` into register `R0`.
- `LDR R3,=endlist`: Loads the sentinel value into register `R3`.
- `LDR R1,[R0]`: Loads the first word (number) from the address pointed by `R0` into register `R1`.
- `ADD R2,R2,R1`: Adds the value in `R1` to `R2`. Since `R2` is not initialized, it should be cleared before this operation to avoid undefined behavior.

### Loop Structure
```assembly
loop:
	LDR R1,[R0,#4]!
	CMP R1,R3
	BEQ exit
	ADD R2,R2,R1
	BAL loop
```
- `loop:`: This label marks the beginning of our loop.
- `LDR R1,[R0,#4]!`: Loads the next word from the address pointed by `R0` into `R1` and then increments `R0` by 4 bytes (since our list contains 32-bit numbers).
- `CMP R1,R3`: Compares the loaded word in `R1` with our sentinel value in `R3`.
- `BEQ exit`: If the values are equal (meaning we've hit our sentinel value), branch to the label `exit`.
- `ADD R2,R2,R1`: If not equal, add the value in `R1` to our running total in `R2`.
- `BAL loop`: Unconditionally branch back to the beginning of the loop to process the next number.

### Exit Point
```assembly
exit:
```
- `exit:`: This label marks our exit point from the loop where we can proceed to further instructions or terminate the program.

### Data Section
```assembly
.data
list:
	.word 1,2,3,4,5,6,7,8,9,10
```
- `.data`: This directive indicates that we are starting a data section where we define our list.
- `list:`: This label marks the beginning of our list in memory.
- `.word 1,2,3,...`: Defines a series of 32-bit numbers that will be summed by our code.

## Flow and Register Values

At each iteration of the loop:
- **R0** holds the current address being read from our list.
- **R1** holds the current number being added to our sum.
- **R2** accumulates our running total sum.
- **R3** always holds our sentinel value for comparison.

Initially:
- **R0** = address of first element in list (value = 1)
- **R1** = first number from list (value = 1)
- **R2** = undefined (should be initialized to 0 before starting)

After first iteration:
- **R0** = address of second element (value = 2)
- **R1** = second number from list (value = 2)
- **R2** = sum so far (value = 1)

This pattern continues until **R1** equals **endlist**, at which point we exit the loop.

Remember to initialize **R2** to zero before entering `_start`, as it's used for accumulating our sum. Also note that this code does not handle termination properly; it will just stop executing after reaching the end of the loop without any clean-up or system call to exit.
