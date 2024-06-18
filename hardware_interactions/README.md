# Hardware Interactions

This README provides an explanation of a simple assembly program that demonstrates hardware interactions between switches and LEDs on a simulated device.

## Assembly Code Explanation

The provided assembly code snippet performs direct memory access to interact with hardware components, specifically LEDs and switches. Here's a line-by-line breakdown:

- `.equ SWITCH, 0xff200040`: This line sets up an alias named `SWITCH` for the memory address `0xff200040`, which corresponds to the switches in the simulator.
- `.equ LED, 0xff200000`: Similarly, `LED` is set as an alias for the memory address `0xff200000`, representing the LEDs in the simulator.

- `.global _start`: This directive indicates that `_start` is a global label, which is where program execution begins.

- `_start:`: The entry point of the program.

- `LDR R0,=SWITCH`: Load the address of `SWITCH` into register R0.
- `LDR R1,[R0]`: Load the value from the address contained in R0 (the state of switches) into register R1.

- `LDR R0,=LED`: Load the address of `LED` into register R0.
- `STR R1,[R0]`: Store the value from register R1 into the address contained in R0 (which will update the state of LEDs).

## Hardware Flow

When this code is executed:
1. The current state of switches (on/off) is read into register R1.
2. The same state is then written to LEDs, causing them to reflect the state of switches.

In essence, flipping a switch will turn on/off its corresponding LED.

## Simulator Image Explanation

![Simulator Interface](https://github.com/Shikha-code36/assembly-ARM-tutorial/blob/main/hardware_interactions/switchled.png)

The image shows a simulator interface divided into two sections: "LEDs" and "Switches". Each section has its own set of addresses that correspond to physical components on an actual device.

- **LEDs**: The indicators are at address `0xff200000`. In this example, three LEDs are lit, indicating that their corresponding switches are turned on.
- **Switches**: Located at address `0xff200040`, several switches are in the 'on' position as indicated by checkmarks.

This visual representation helps understand how the code manipulates these components through memory-mapped I/O addresses.

