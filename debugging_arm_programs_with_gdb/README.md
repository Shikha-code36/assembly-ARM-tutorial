# Debugging ARM Programs with GDB

Welcome to the final chapter of our ARM assembly tutorial. In this section, we'll explore how to debug ARM programs using the GNU Debugger (GDB). We'll use our previous chapter's program as an example, which you can find [here](https://github.com/Shikha-code36/assembly-ARM-tutorial/tree/main/printing_strings_to_terminal).

## What is GDB?

GDB, or the GNU Debugger, is a powerful tool used by developers to debug programs. It allows you to see what is going on 'inside' another program while it executes or what another program was doing at the moment it crashed. GDB can do four main kinds of things to help you catch bugs in the act:
- Start your program, specifying anything that might affect its behavior.
- Make your program stop on specified conditions.
- Examine what has happened when your program has stopped.
- Change things in your program so you can experiment with correcting the effects of one bug and go on to learn about another.

## Why Use GDB?

GDB allows you to trace the execution of your code line by line, inspect memory and registers, change variable values at runtime, and even when your program crashes, it helps you to examine the state it was in.

## Debugging with GDB

Let's walk through some common GDB commands using our `helloworld` program as an example:

### Starting GDB

```bash
gdb helloworld
```
This command starts the debugger with `helloworld` loaded.

### Setting Breakpoints

```bash
break _start
```
This sets a breakpoint at the beginning of the program (`_start` label).

### Running the Program

```bash
run
```
Begins execution of your program up to the next breakpoint or until completion.

### Inspecting Registers

```bash
(gdb) info register r0
r0             0x0      0
```
Displays the current value of register `r0`.

### Stepping Through Instructions

```bash
(gdb) stepi
0x00010078 in _start ()
(gdb) stepi
0x0001007c in _start ()
```
Executes one instruction at a time.

### Examining Memory

```bash
(gdb) x/10x $r1
```
Displays memory contents at the address contained in `r1` in hexadecimal format.

### Changing Layouts

```bash
layout regs
```
Switches to a layout that displays registers.

Here's an example showing how we can examine memory as characters:

```bash
(gdb) x/15c $r1
0x20098:        114 'r' 97 'a'  100 'd' 104 'h' 101 'e' 32 ' '  114 'r' 97 'a'
0x200a0:        100 'd' 104 'h' 101 'e' 32 ' '  10 '\n' 0 '\000'        65 'A'
```

As you can see, we've printed "radhe radhe" followed by a newline and null terminator.

### Assembly Layout

```bash
layout asm
```
Switches to a layout that displays disassembled code.



```
Thank you everyone for following along with this tutorial. We hope you've found it helpful in understanding ARM assembly and how to debug programs using GDB. Happy coding!
```
