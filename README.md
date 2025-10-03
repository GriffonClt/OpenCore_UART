# OpenCore_UART
Part of a personal project aiming to share open-source cores (open-source equivalent of IP) for VLSI (RTL Design).

# Environment for testing
## FPGA / HDL Development Environment

This repository provides instructions to install and configure a complete working environment under **WSL (Windows Subsystem for Linux)** with the following tools:

* [WSL](https://learn.microsoft.com/en-us/windows/wsl/) : Windows Subsystem for Linux
* [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build) : Bundle containing GHDL, GTKWave, Yosys, and other FPGA tools
* [cocotb](https://docs.cocotb.org/) : Python-based testing framework for HDL
* [nvc](https://github.com/nickg/nvc) : Open-source VHDL compiler
* [GHDL](https://github.com/ghdl/ghdl) : VHDL compiler/simulator
* [GTKWave](http://gtkwave.sourceforge.net/) : Waveform viewer

---

### WSL Installation

1. Enable WSL from PowerShell (administrator mode):

   ```powershell
   wsl --install -d Ubuntu
   ```
2. Restart your machine if necessary.
3. Verify the installation:

   ```
   wsl --list --verbose
   ```

### Installation of COCOTB, GHDL, GTKWAVE

1. Go to the root of the project
2. Run the following instruction 
   ```bash
   docs/install_tools/install_venv.sh
   ```