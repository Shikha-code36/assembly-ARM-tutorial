## ARM Assembly Code Explanation

The given code snippet is an ARM assembly language program that performs a simple system call to exit a program. Here's a line-by-line breakdown:

- `.global _start`: This line declares `_start` as a global label, which means it can be seen by other files and is typically used as the entry point of the program.

- `_start:`: This is the label for the entry point of the program.

- `MOV R0,#30`: This instruction moves the literal value `30` into register `R0`. In this context, it's just loading data into `R0`, but it's not used further in this program.

- `MOV R7,#1`: This instruction moves the literal value `1` into register `R7`. The value `1` is a special number that represents the system call number for exiting a program.

- `SWI 0`: This instruction triggers a software interrupt with value `0`. The software interrupt (`SWI`) is used to make a system call in ARM. The operating system checks register `R7` to determine which system call to execute. Since we've moved `1` into `R7`, it corresponds to the exit system call.

The narrative provided explains that register `R7` is used for system calls in ARM architecture. When an interrupt is called, the operating system looks at `R7` to determine what action to take based on the value it contains. In this case, since `R7` contains `1`, it tells the operating system to terminate the current program.
