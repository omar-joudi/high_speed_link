----------------------------------------------------------------------------
--HIGH SPEED LINK
--decoding_8b10b.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg 
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity decoding_8b10b is
	port (
		data_in      : in std_logic_vector(9 downto 0);
		op : out std_logic_vector(7 downto 0)
	);
end decoding_8b10b;


architecture arch of decoding_8b10b is

begin

	with data_in select
		op <= "00000000" when "1001110100" | "0110001011",
			  "00000001" when "0111010100" | "1000101011",
			  "00000010" when "1011010100" | "0100101011",
			  "00000011" when "1100011011" | "1100010100",
			  "00000100" when "1101010100" | "0010101011",
			  "00000101" when "1010011011" | "1010010100",
			  "00000110" when "0110011011" | "0110010100",
			  "00000111" when "1110001011" | "0001110100",
			  "00001000" when "1110010100" | "0001101011",
			  "00001001" when "1001011011" | "1001010100",
			  "00001010" when "0101011011" | "0101010100",
			  "00001011" when "1101001011" | "1101000100",
			  "00001100" when "0011011011" | "0011010100",
			  "00001101" when "1011001011" | "1011000100",
			  "00001110" when "0111001011" | "0111000100",
			  "00001111" when "0101110100" | "1010001011",
			  "00010000" when "0110110100" | "1001001011",
			  "00010001" when "1000111011" | "1000110100",
			  "00010010" when "0100111011" | "0100110100",
			  "00010011" when "1100101011" | "1100100100",
			  "00010100" when "0010111011" | "0010110100",
			  "00010101" when "1010101011" | "1010100100",
			  "00010110" when "0110101011" | "0110100100",
			  "00010111" when "1110100100" | "0001011011",
			  "00011000" when "1100110100" | "0011001011",
			  "00011001" when "1001101011" | "1001100100",
			  "00011010" when "0101101011" | "0101100100",
			  "00011011" when "1101100100" | "0010011011",
			  "00011100" when "0011101011" | "0011100100",
			  "00011101" when "1011100100" | "0100011011",
			  "00011110" when "0111100100" | "1000011011",
			  "00011111" when "1010110100" | "0101001011",
			  "00100000" when "1001111001" | "0110001001",
			  "00100001" when "0111011001" | "1000101001",
			  "00100010" when "1011011001" | "0100101001",
			  "00100011" when "1100011001",
			  "00100100" when "1101011001" | "0010101001",
			  "00100101" when "1010011001",
			  "00100110" when "0110011001",
			  "00100111" when "1110001001" | "0001111001",
			  "00101000" when "1110011001" | "0001101001",
			  "00101001" when "1001011001",
			  "00101010" when "0101011001",
			  "00101011" when "1101001001",
			  "00101100" when "0011011001",
			  "00101101" when "1011001001",
			  "00101110" when "0111001001",
			  "00101111" when "0101111001" | "1010001001",
			  "00110000" when "0110111001" | "1001001001",
			  "00110001" when "1000111001",
			  "00110010" when "0100111001",
			  "00110011" when "1100101001",
			  "00110100" when "0010111001",
			  "00110101" when "1010101001",
			  "00110110" when "0110101001",
			  "00110111" when "1110101001" | "0001011001",
			  "00111000" when "1100111001" | "0011001001",
			  "00111001" when "1001101001",
			  "00111010" when "0101101001",
			  "00111011" when "1101101001" | "0010011001",
			  "00111100" when "0011101001",
			  "00111101" when "1011101001" | "0100011001",
			  "00111110" when "0111101001" | "1000011001",
			  "00111111" when "1010111001" | "0101001001",
			  "01000000" when "1001110101" | "0110000101",
			  "01000001" when "0111010101" | "1000100101",
			  "01000010" when "1011010101" | "0100100101",
			  "01000011" when "1100010101",
			  "01000100" when "1101010101" | "0010100101",
			  "01000101" when "1010010101",
			  "01000110" when "0110010101",
			  "01000111" when "1110000101" | "0001110101",
			  "01001000" when "1110010101" | "0001100101",
			  "01001001" when "1001010101",
			  "01001010" when "0101010101",
			  "01001011" when "1101000101",
			  "01001100" when "0011010101",
			  "01001101" when "1011000101",
			  "01001110" when "0111000101",
			  "01001111" when "0101110101" | "1010000101",
			  "01010000" when "0110110101" | "1001000101",
			  "01010001" when "1000110101",
			  "01010010" when "0100110101",
			  "01010011" when "1100100101",
			  "01010100" when "0010110101",
			  "01010101" when "1010100101",
			  "01010110" when "0110100101",
			  "01010111" when "1110100101" | "0001010101",
			  "01011000" when "1100110101" | "0011000101",
			  "01011001" when "1001100101",
			  "01011010" when "0101100101",
			  "01011011" when "1101100101" | "0010010101",
			  "01011100" when "0011100101",
			  "01011101" when "1011100101" | "0100010101",
			  "01011110" when "0111100101" | "1000010101",
			  "01011111" when "1010110101" | "0101000101",
			  "01100000" when "1001110011" | "0110001100",
			  "01100001" when "0111010011" | "1000101100",
			  "01100010" when "1011010011" | "0100101100",
			  "01100011" when "1100011100" | "1100010011",
			  "01100100" when "1101010011" | "0010101100",
			  "01100101" when "1010011100" | "1010010011",
			  "01100110" when "0110011100" | "0110010011",
			  "01100111" when "1110001100" | "0001110011",
			  "01101000" when "1110010011" | "0001101100",
			  "01101001" when "1001011100" | "1001010011",
			  "01101010" when "0101011100" | "0101010011",
			  "01101011" when "1101001100" | "1101000011",
			  "01101100" when "0011011100" | "0011010011",
			  "01101101" when "1011001100" | "1011000011",
			  "01101110" when "0111001100" | "0111000011",
			  "01101111" when "0101110011" | "1010001100",
			  "01110000" when "0110110011" | "1001001100",
			  "01110001" when "1000111100" | "1000110011",
			  "01110010" when "0100111100" | "0100110011",
			  "01110011" when "1100101100" | "1100100011",
			  "01110100" when "0010111100" | "0010110011",
			  "01110101" when "1010101100" | "1010100011",
			  "01110110" when "0110101100" | "0110100011",
			  "01110111" when "1110100011" | "0001011100",
			  "01111000" when "1100110011" | "0011001100",
			  "01111001" when "1001101100" | "1001100011",
			  "01111010" when "0101101100" | "0101100011",
			  "01111011" when "1101100011" | "0010011100",
			  "01111100" when "0011101100" | "0011100011",
			  "01111101" when "1011100011" | "0100011100",
			  "01111110" when "0111100011" | "1000011100",
			  "01111111" when "1010110011" | "0101001100",
			  "10000000" when "1001110010" | "0110001101",
			  "10000001" when "0111010010" | "1000101101",
			  "10000010" when "1011010010" | "0100101101",
			  "10000011" when "1100011101" | "1100010010",
			  "10000100" when "1101010010" | "0010101101",
			  "10000101" when "1010011101" | "1010010010",
			  "10000110" when "0110011101" | "0110010010",
			  "10000111" when "1110001101" | "0001110010",
			  "10001000" when "1110010010" | "0001101101",
			  "10001001" when "1001011101" | "1001010010",
			  "10001010" when "0101011101" | "0101010010",
			  "10001011" when "1101001101" | "1101000010",
			  "10001100" when "0011011101" | "0011010010",
			  "10001101" when "1011001101" | "1011000010",
			  "10001110" when "0111001101" | "0111000010",
			  "10001111" when "0101110010" | "1010001101",
			  "10010000" when "0110110010" | "1001001101",
			  "10010001" when "1000111101" | "1000110010",
			  "10010010" when "0100111101" | "0100110010",
			  "10010011" when "1100101101" | "1100100010",
			  "10010100" when "0010111101" | "0010110010",
			  "10010101" when "1010101101" | "1010100010",
			  "10010110" when "0110101101" | "0110100010",
			  "10010111" when "1110100010" | "0001011101",
			  "10011000" when "1100110010" | "0011001101",
			  "10011001" when "1001101101" | "1001100010",
			  "10011010" when "0101101101" | "0101100010",
			  "10011011" when "1101100010" | "0010011101",
			  "10011100" when "0011101101" | "0011100010",
			  "10011101" when "1011100010" | "0100011101",
			  "10011110" when "0111100010" | "1000011101",
			  "10011111" when "1010110010" | "0101001101",
			  "10100000" when "1001111010" | "0110001010",
			  "10100001" when "0111011010" | "1000101010",
			  "10100010" when "1011011010" | "0100101010",
			  "10100011" when "1100011010",
			  "10100100" when "1101011010" | "0010101010",
			  "10100101" when "1010011010",
			  "10100110" when "0110011010",
			  "10100111" when "1110001010" | "0001111010",
			  "10101000" when "1110011010" | "0001101010",
			  "10101001" when "1001011010",
			  "10101010" when "0101011010",
			  "10101011" when "1101001010",
			  "10101100" when "0011011010",
			  "10101101" when "1011001010",
			  "10101110" when "0111001010",
			  "10101111" when "0101111010" | "1010001010",
			  "10110000" when "0110111010" | "1001001010",
			  "10110001" when "1000111010",
			  "10110010" when "0100111010",
			  "10110011" when "1100101010",
			  "10110100" when "0010111010",
			  "10110101" when "1010101010",
			  "10110110" when "0110101010",
			  "10110111" when "1110101010" | "0001011010",
			  "10111000" when "1100111010" | "0011001010",
			  "10111001" when "1001101010",
			  "10111010" when "0101101010",
			  "10111011" when "1101101010" | "0010011010",
			  "10111100" when "0011101010",
			  "10111101" when "1011101010" | "0100011010",
			  "10111110" when "0111101010" | "1000011010",
			  "10111111" when "1010111010" | "0101001010",
			  "11000000" when "1001110110" | "0110000110",
			  "11000001" when "0111010110" | "1000100110",
			  "11000010" when "1011010110" | "0100100110",
			  "11000011" when "1100010110",
			  "11000100" when "1101010110" | "0010100110",
			  "11000101" when "1010010110",
			  "11000110" when "0110010110",
			  "11000111" when "1110000110" | "0001110110",
			  "11001000" when "1110010110" | "0001100110",
			  "11001001" when "1001010110",
			  "11001010" when "0101010110",
			  "11001011" when "1101000110",
			  "11001100" when "0011010110",
			  "11001101" when "1011000110",
			  "11001110" when "0111000110",
			  "11001111" when "0101110110" | "1010000110",
			  "11010000" when "0110110110" | "1001000110",
			  "11010001" when "1000110110",
			  "11010010" when "0100110110",
			  "11010011" when "1100100110",
			  "11010100" when "0010110110",
			  "11010101" when "1010100110",
			  "11010110" when "0110100110",
			  "11010111" when "1110100110" | "0001010110",
			  "11011000" when "1100110110" | "0011000110",
			  "11011001" when "1001100110",
			  "11011010" when "0101100110",
			  "11011011" when "1101100110" | "0010010110",
			  "11011100" when "0011100110",
			  "11011101" when "1011100110" | "0100010110",
			  "11011110" when "0111100110" | "1000010110",
			  "11011111" when "1010110110" | "0101000110",
			  "11100000" when "1001110001" | "0110001110",
			  "11100001" when "0111010001" | "1000101110",
			  "11100010" when "1011010001" | "0100101110",
			  "11100011" when "1100011110" | "1100010001",
			  "11100100" when "1101010001" | "0010101110",
			  "11100101" when "1010011110" | "1010010001",
			  "11100110" when "0110011110" | "0110010001",
			  "11100111" when "1110001110" | "0001110001",
			  "11101000" when "1110010001" | "0001101110",
			  "11101001" when "1001011110" | "1001010001",
			  "11101010" when "0101011110" | "0101010001",
			  "11101011" when "1101001110" | "1101001000",
			  "11101100" when "0011011110" | "0011010001",
			  "11101101" when "1011001110" | "1011001000",
			  "11101110" when "0111001110" | "0111001000",
			  "11101111" when "0101110001" | "1010001110",
			  "11110000" when "0110110001" | "1001001110",
			  "11110001" when "1000110111" | "1000110001",
			  "11110010" when "0100110111" | "0100110001",
			  "11110011" when "1100101110" | "1100100001",
			  "11110100" when "0010110111" | "0010110001",
			  "11110101" when "1010101110" | "1010100001",
			  "11110110" when "0110101110" | "0110100001",
			  "11110111" when "1110100001" | "0001011110",
			  "11111000" when "1100110001" | "0011001110",
			  "11111001" when "1001101110" | "1001100001",
			  "11111010" when "0101101110" | "0101100001",
			  "11111011" when "1101100001" | "0010011110",
			  "11111100" when "0011101110" | "0011100001",
			  "11111101" when "1011100001" | "0100011110",
			  "11111110" when "0111100001" | "1000011110",
			  "11111111" when "1010110001" | "0101001110",
			  "00000000" when others;

end arch;
