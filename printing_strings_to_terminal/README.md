# ARM Assembly Printing Strings to Terminal

Welcome to your Raspberry Pi linux terminal. If you're here, you've successfully connected via SSH using `ssh pi@127.0.0.1 -p 5022`. If you're unsure about the setup process, please refer to the previous notes on setting up QEMU for ARM [here](https://github.com/Shikha-code36/assembly-ARM-tutorial/tree/main/setting_up_qemu_for_arm).

## Writing the Code

Open the `helloworld.s` file in the nano editor:

```sh
nano helloworld.s
```

Here's the `helloworld.s` ARM assembly code:

```assembly
.global _start
_start:
        MOV R0,#1
        LDR R1,=message
        LDR R2,=len
        MOV R7,#4
        SWI 0

        MOV R7,#1
        SWI 0

.data
message:
        .asciz "radhe radhe \n"
len = .-message
```

## Code Explanation

- `.global _start`: Marks the `_start` label as global, making it visible to the linker.
- `_start:`: The entry point of our program.
- `MOV R0,#1`: Moves the value `1` into register `R0`, which is used for file descriptor (stdout).
- `LDR R1,=message`: Loads the address of the `message` label into register `R1`.
- `LDR R2,=len`: Loads the address of the `len` label into register `R2`.
- `MOV R7,#4`: Moves the value `4` into register `R7`, which is the system call number for 'write'.
- `SWI 0`: Triggers an interrupt to invoke a system call.
- `.data`: Indicates that what follows is data (not code).
- `message:`: A label marking where our message starts.
- `.asciz "radhe radhe \n"`: Defines a null-terminated string.
- `len = .-message`: Defines the length of our message.

## Compiling and Running

Compile the assembly code into an object file:

```sh
as helloworld.s -o helloworld.o
```

Link the object file to create an executable:

```sh
ld helloworld.o -o helloworld
```

Verify that all files are present:

```sh
ls
```

Run your executable:

```sh
./helloworld
```

You should see the output:

```
radhe radhe 
```

