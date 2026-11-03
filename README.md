# D Flip-Flop (DFF) Using Verilog HDL

## Project Overview
This project implements a positive-edge-triggered D Flip-Flop using Verilog HDL with an asynchronous active-high reset. A testbench is used to verify the functionality and generate a VCD waveform file for visualization using GTKWave.

## Features
- Positive-edge-triggered D Flip-Flop
- Asynchronous active-high reset
- Verilog RTL implementation
- Testbench verification
- VCD waveform generation
- GTKWave waveform visualization

## Project Structure
```
D-Flip-Flop-Verilog/
├── dff.v
├── dff_tb.v
├── README.md
└── dff.vcd
```

## Timescale
```verilog
`timescale 1ns/1ps
```
- Time unit: 1 ns
- Time precision: 1 ps
- Clock period: 10 ns
- Clock frequency: 100 MHz

## RTL Design
File: `dff.v`

```verilog
`timescale 1ns/1ps

module dff (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
```

## Testbench
File: `dff_tb.v`

```verilog
`timescale 1ns/1ps

module dff_tb;

reg clk, rst, d;
wire q;

dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("dff.vcd");
    $dumpvars(0, dff_tb);

    clk = 0;
    rst = 1;
    d = 0;

    #10 rst = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #20 $finish;
end

initial
begin
    $monitor("Time=%0t clk=%b rst=%b d=%b q=%b",
             $time, clk, rst, d, q);
end

endmodule
```

## Tools Required
- Verilog HDL
- Icarus Verilog
- GTKWave

## Simulation Steps

### 1. Compile the Verilog files
```bash
iverilog -o dff_sim dff.v dff_tb.v
```

### 2. Run the simulation
```bash
vvp dff_sim
```

### 3. Open the waveform
```bash
gtkwave dff.vcd
```

## VCD Dump Commands
```verilog
$dumpfile("dff.vcd");
$dumpvars(0, dff_tb);
```

- `$dumpfile`: Creates the VCD waveform file.
- `$dumpvars`: Records signal changes.
- `$monitor`: Displays signal values in the terminal.
- `$finish`: Stops the simulation.

## Expected Output

| Condition | Output Q |
|---|---|
| Reset = 1 | 0 |
| Rising edge, D = 0 | 0 |
| Rising edge, D = 1 | 1 |
| No rising clock edge | Holds previous value |

## Conclusion
The D Flip-Flop was successfully designed and simulated using Verilog HDL. The testbench verifies asynchronous reset and positive-edge data capture. The generated VCD waveform can be viewed using GTKWave.

## Author
Hariharan D

## Tags
Verilog | VLSI | Digital Electronics | D Flip-Flop | Icarus Verilog | GTKWave
