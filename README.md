# High Speed Link
**A high speed link between two FPGAs with a common clock using serdes and coding**
- A LFSR PRNG is used to generate the input data for testing.
- An 8b/10b encoding is used to achieve DC balance and bounded disparity.
- DDR is used for doubling the frequency.
- The control symbol "0011111000” is used for link training as it does not have a corresponding 8 bit data byte.
- A PLL block is used to multiply the common clock between the transmitter and receiver.
- Reset signal is only connected to the transmitter.
- The design is simulated on two FPGAs (implementation can work up to 500 MHz):
  - Lattice MachXO2 (LCMXO2-1200HC-6TG100C)
  - Xilinx Zynq (xc7z020clg400-1)
