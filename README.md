# Matrix Pmod&trade; compatible module

Matrix is a simple 4x4 LED matrix module with a 12-pin Pmod&trade; compatible header.

This repo contains schematics, pinouts and example gateware.

Find more information on the [Matrix product page](https://machdyne.com/product/matrix-led-pmod/).

## Hello World Example

Building the example requires [Yosys](https://github.com/YosysHQ/yosys), [nextpnr-ice40](https://github.com/YosysHQ/nextpnr) and [IceStorm](https://github.com/YosysHQ/icestorm).

Assuming they are installed, you can simply type `make` to build the gateware, which will be written to output/matrix.bin. This example targets the Kröte FPGA board but can be easily adapted to any FPGA board with a 12-pin PMOD connector.

## Pinout

| Signal | Pin |
| ------ | --- |
| ROW0 | 1 |
| ROW1 | 2 |
| ROW2 | 3 |
| ROW3 | 4 |
| GND | 5 |
| 3V3 | 6 |
| COL0 | 7 |
| COL1 | 8 |
| COL2 | 9 |
| COL3 | 10 |
| GND | 11 |
| 3V3 | 12 |
