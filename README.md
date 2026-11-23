# HDL-verilog

Combinational logic in Verilog, from basic gates up to a 4-bit ALU. I wrote these as lab exercises for an introductory HDL course in 2024 and simulated them with [Icarus Verilog](https://steveicarus.github.io/iverilog/).

Most designs are written three ways, so the files can be compared side by side:

| Suffix | Style | What it looks like |
|---|---|---|
| `_st` | Structural | Instantiates smaller gate modules and wires them together |
| `_df` | Dataflow | Continuous `assign` statements with Boolean operators |
| `_bh` | Behavioral | `always @(*)` blocks with `if` / `case` |

Each testbench (`*_tb.v`) runs all available styles of a design on the same inputs and prints their outputs next to each other, so you can check that they agree.

## Contents

| Folder | Designs |
|---|---|
| [`gates/`](gates) | AND, OR, NOT, NAND, NOR, XOR, XNOR |
| [`arithmetic/`](arithmetic) | Half adder, full adder, half subtractor, full subtractor, 4-bit ripple-carry adder/subtractor |
| [`mux/`](mux) | 2:1, 4:1 and 8:1 multiplexers, plus a 4:1 built from three 2:1 muxes |
| [`decoder/`](decoder) | 3-to-8 decoder with enable |
| [`alu/`](alu) | 4-bit ALU with 4 logic and 8 arithmetic operations |

### 4-bit ALU operations

`Mode = 0` selects a logic operation and `Mode = 1` an arithmetic one.

| Mode | Operation | Cin | F |
|---|---|---|---|
| 0 | 00 | x | A AND B |
| 0 | 01 | x | A OR B |
| 0 | 10 | x | A XOR B |
| 0 | 11 | x | A XNOR B |
| 1 | 00 | 0 | A |
| 1 | 00 | 1 | A + 1 |
| 1 | 01 | 0 | A + B |
| 1 | 01 | 1 | A + B + 1 |
| 1 | 10 | 0 | A + ~B |
| 1 | 10 | 1 | A − B |
| 1 | 11 | 0 | B + ~A |
| 1 | 11 | 1 | B − A |

## Running a simulation

You need [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog` and `vvp` on your PATH). [GTKWave](https://gtkwave.sourceforge.net/) is optional and opens the waveform files.

Windows (PowerShell):

```powershell
.\sim.ps1 mux4x1     # runs mux/mux4x1_tb.v
.\sim.ps1 -All       # runs every testbench
```

Linux / macOS:

```sh
./sim.sh mux4x1
./sim.sh --all
```

The scripts pass every source folder to `iverilog -I`, so the `` `include `` lines resolve. They write the compiled `.vvp` files and the `.vcd` waveforms to `build/`, which git ignores. To view a waveform:

```sh
gtkwave build/mux4x1.vcd
```

## Notes

- I fixed a few bugs in the original lab code during the 2026 cleanup: ALU XNOR and subtraction, the behavioral 2:1 mux select, the I7 term of the structural 8:1 mux, and the adder/subtractor carry. The commit history has the details. These fixes have not been re-simulated yet.
- For a larger Verilog project, see [single-cycle-mips-processor](https://github.com/jbzmcs/single-cycle-mips-processor).
