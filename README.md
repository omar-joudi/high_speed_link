# high_speed_link

- A LFSR PRNG is used to generate the input data for testing.
- An 8b/10b encoding is used to achieve DC balance and bounded disparity.
- The control symbol “11111100” is used for link training as it does not have a corresponding 8 bit data byte.
- Reset signal is only connected to the transmitter.
- The design is simulated on two FPGAs (still have some timing violations):
  - Lattice MachXO2 (LCMXO2-1200HC-6TG100C)
    - Can work up to 480 MHz (240x2).
  - Xilinx Zynq (xc7z020clg400-1)
    - Still have some timing violations.
