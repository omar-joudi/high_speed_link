# high_speed_link

- A LFSR PRNG is used to generate the input data for testing.
- An 8b/10b encoding is used to achieve DC balance and bounded disparity.
- The control symbol “11111100” is used for link training as it does not have a corresponding 8 bit data byte.
- Reset signal is only connected to the transmitter.
- The design is tested on two FPGAs:
- Lattice MachXO2 (LCMXO2-1200HC-6TG100C)
- Xilinx Zynq (LCMXO2-1200HC-6TG100C)
