# ⚙️ Pipelined RISC-V Processor with Hazard Mitigation

A Verilog implementation of a **five-stage pipenlined RISC-V processor** featuring comprehensive hazard handling through **data forwarding and pipeline stalling**. Demonstrates practical computer architecture concepts by resolving data and control hazards in a modular, synthesizable design.

**Core Architecture**:
- ✅ **Full 5-Stage Pipeline** (IF, ID, EX, MEM, WB) implementing instruction-level parallelism
- ✅ **Dual Hazard Mitigation** with **forwarding** (to eliminate stalls) and **stalling** (for unavoidable hazards)
- ✅ **Modular RTL Design** with clean separation of pipeline registers, hazard units, and datapath
- ✅ **MIPS-like Instruction Set** support for arithmetic, memory, and control-flow operations

---

## 📖 Overview

This project implements an educational, yet production-grade, pipelined processor that realistically simulates the challenges and solutions of modern CPU design. Beyond basic pipelining, it focuses on **hazard resolution**—implementing both forwarding (to bypass stalled data) and pipeline stalls (for load-use hazards). The design serves as a comprehensive reference for understanding pipeline optimization, data dependency management, and control logic in hardware description languages.

---

## 🚀 Quick Start

### 1. Prerequisites
Ensure you have a Verilog simulator (e.g., ModelSim, Vivado, or Icarus Verilog) installed.

### 2. Clone & Simulate
```bash
git clone https://github.com/yourusername/riscv-pipelined-processor.git
cd riscv-pipelined-processor/code

# Compile top module and testbench (example for Icarus Verilog)
iverilog -o pipeline_top_tb pipeline_top.v pipeline_top_tb.v
vvp pipeline_top_tb
```

### 3. Configure Hazard Handling Mode
The processor supports three hazard mitigation modes. Set the parameter in the testbench or top module:
```verilog
parameter HAZARD_MODE = 2; // 0: Stall-only, 1: Forward-only, 2: Combined
```

---

## 🏗️ Pipeline Architecture & Hazard Resolution

The processor implements a classic 5-stage pipeline with dedicated hazard detection and resolution units.

| Stage | Module | Key Responsibility |
| :--- | :--- | :--- |
| **IF** (Instruction Fetch) | `pc`, `inst_mem` | Fetches next instruction, manages PC |
| **ID** (Instruction Decode) | `Decoder`, `reg_file`, `ControlUnit` | Decodes instruction, reads registers, detects hazards |
| **EX** (Execute) | `Alu`, `ForwardingUnit`, `ForwardMux` | Performs ALU operations, forwards data from later stages |
| **MEM** (Memory) | `datamemory` | Accesses data memory for loads/stores |
| **WB** (Write Back) | `memTOregMux` | Writes result back to register file |

### 🔁 Hazard Handling Units
| Component | Purpose | Key Logic |
| :--- | :--- | :--- |
| **Forwarding Unit** | Bypasses ALU results from EX/MEM or MEM/WB stages to EX stage inputs | Detects RAW dependencies, selects forwarded data |
| **Hazard Detection Unit** | Inserts pipeline stalls for load-use hazards | Monitors ID stage for dependencies with previous LW instructions |

---

## 📜 Supported Instruction Types

The processor supports a fundamental MIPS-like instruction set across three key formats:

| Type | Example Instructions | Use Case |
| :--- | :--- | :--- |
| **R-Type** | `ADD`, `SUB`, `AND`, `OR`, `SLT` | Register-to-register arithmetic/logic |
| **I-Type** | `LW`, `SW`, `ADDI` | Memory access and immediate operations |
| **B-Type** | `BEQ`, `BNE` | Conditional branch control flow |

---

## 📊 Performance & Hazard Analysis

| Hazard Mode | CPI Impact | Key Advantage | Best For |
| :--- | :--- | :--- | :--- |
| **Stall-Only** | Higher (more bubbles) | Simple control logic | Educational clarity |
| **Forward-Only** | Reduced | Eliminates most stalls | Performance focus |
| **Combined** | Optimized | Handles all hazard cases | Real-world scenarios |

> The **combined mode** represents the industry-standard approach, using forwarding where possible and stalling only for unavoidable load-use hazards.

---

## 🗂️ Project Structure

```
/code
├── Core Pipeline/
│   ├── pc.v                    # Program Counter with branch logic
│   ├── inst_mem.v              # Instruction Memory (ROM)
│   ├── Decoder.v               # Instruction Decoder
│   ├── reg_file.v              # 32-bit Register File
│   ├── ControlUnit.v           # Main Control Unit
│   ├── Alu.v                   # Arithmetic Logic Unit
│   ├── datamemory.v            # Data Memory (RAM)
│   └── memTOregMux.v           # Write-back Multiplexer
├── Pipeline Registers/
│   ├── IFID.v                  # IF/ID Pipeline Register
│   ├── IDEX.v                  # ID/EX Pipeline Register
│   ├── EXMEM.v                 # EX/MEM Pipeline Register
│   └── MEMWB.v                 # MEM/WB Pipeline Register
├── Hazard Handling/
│   ├── ForwardingUnit.v        # Data Forwarding Logic
│   ├── ForwardMux.v            # Forwarding Multiplexers
│   └── HazardDetection.v       # Load-Use Stall Logic
├── Testbench/
│   └── MyTestBench.v           # Comprehensive Testbench
├── AluSrc.v
├── BranchHazard.v
├── InteractionModule.v
├── branchAdder.v
├── branchCondit.v
├── dstRegMux.vhazardrst.v
├── mux1.v
└── Documentation/
    ├── project_report.pdf      # Full Project Report & Analysis
    └── diagrams/               # RTL Schematics & Block Diagrams
```

---

## 🔧 Synthesis & Implementation

The design is written in synthesizable Verilog and can be targeted for:
- **FPGA Platforms** (Tested with Xilinx Vivado)
- **ASIC Flow** using standard cell libraries
- **Educational Simulation** with ModelSim or Icarus Verilog

The modular design allows for easy experimentation with different hazard handling strategies.

---

## 👥 Contributors

- [Aleeza Rizwan](https://github.com/its-aleezA)
- [Muhammad Ibrahim Abdullah](https://github.com/Ibrahim5570)

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

> [!NOTE]
> This project is intended for educational purposes in computer architecture, digital design, and RTL verification. It demonstrates real-world pipeline challenges and solutions.
