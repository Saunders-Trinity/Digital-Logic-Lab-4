This is a simualation of creating a ALU using vhdl, quartus and model sim.
Heres a more specific description: 
A CPU consists of two main components (in simple): an ALU and a controller. This ALU does the arithmetic operations and changes the registers according to three main signals: the operation, the source for register A, the source for register B. The operation signal determines what the ALU will output. This can be a negation of a register, addition of registers, bitwise operations, or anything else you can implement. This lab will be focusing on the ALU.

The ALU by itself is an asynchronous component. This means that the output changes as soon as any of the inputs change. It takes in four inputs: A, B, C_in, and OP. A and B are the two numbers passed in to do operations on, OP determines what operation is done, and C_in is carry in for the addition operation. Then, it has two outputs: F_OUT and C_out. F_OUT is the result of the operation, and C_out is the carry out for the addition operation. When the operation is not addition, C_in should be ignored and C_out should be 0.

Registers
Once we connect registers to the ALU, we get a registered ALU. These registers are 4 bits, and consist of 4 D-FFs in series. Each register has 5 inputs and 4 outputs: D3 - D0,  which are the inputs for each flip-flop, and a clock signal connected to each one. You should also be able to reset each register through an asynchronous reset signal. 

Looking at the figure on the next page, the inputs for the registers are determined by select signals. The input will be from the input bus, the output of the ALU, the output of register A, or the output of register B. For example, you could load two different values into register A and register B through the input bus, perform an operation, then load that value into register B. 

Putting it Together
We can control the registers and the ALU at the same time with something called a control signal. To control the registers, we use SELA and SELB (2 bits each). To control the ALU, we use OP (3 bits). We can concatenate these signals into a single 7 bit signal called ALU_CTRL, where the order is [SELA][SELB][OP]. Your datapath.vhd should receive a clock, this 7 bit control signal, and a reset for the registers. The control signal should be distributed among the ALU and registers, and the clock should control the registers.
