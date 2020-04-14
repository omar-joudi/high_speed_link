----------------------------------------------------------------------------
--HIGH SPEED LINK
--encoding_8b10b.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity encoding_8b10b is
	generic (
		link : std_logic_vector(10 downto 0) := "00011111000"
	);
	port (
		clk     : in std_logic;
		reset   : in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		encoded : out std_logic_vector(9 downto 0)
	);
end encoding_8b10b;


architecture arch of encoding_8b10b is

	signal encode : std_logic_vector(10 downto 0);

	signal linked : std_logic;

	
	type map_t is array (0 to 511) of std_logic_vector(10 downto 0); 
	
	constant table : map_t :=
		(--RD abcdei fghj	
		"01001110100",
		"00111010100",
		"01011010100",
		"11100011011",
		"01101010100",
		"11010011011",
		"10110011011",
		"11110001011",
		"01110010100",
		"11001011011",
		"10101011011",
		"11101001011",
		"10011011011",
		"11011001011",
		"10111001011",
		"00101110100",
		"00110110100",
		"11000111011",
		"10100111011",
		"11100101011",
		"10010111011",
		"11010101011",
		"10110101011",
		"01110100100",
		"01100110100",
		"11001101011",
		"10101101011",
		"01101100100",
		"10011101011",
		"01011100100",
		"00111100100",
		"01010110100",
		"11001111001",
		"10111011001",
		"11011011001",
		"01100011001",
		"11101011001",
		"01010011001",
		"00110011001",
		"01110001001",
		"11110011001",
		"01001011001",
		"00101011001",
		"01101001001",
		"00011011001",
		"01011001001",
		"00111001001",
		"00101111001",
		"10110111001",
		"01000111001",
		"00100111001",
		"01100101001",
		"00010111001",
		"01010101001",
		"00110101001",
		"11110101001",
		"11100111001",
		"01001101001",
		"00101101001",
		"11101101001",
		"00011101001",
		"11011101001",
		"10111101001",
		"11010111001",
		"11001110101",
		"10111010101",
		"11011010101",
		"01100010101",
		"11101010101",
		"01010010101",
		"00110010101",
		"01110000101",
		"11110010101",
		"01001010101",
		"00101010101",
		"01101000101",
		"00011010101",
		"01011000101",
		"00111000101",
		"10101110101",
		"10110110101",
		"01000110101",
		"00100110101",
		"01100100101",
		"00010110101",
		"01010100101",
		"00110100101",
		"11110100101",
		"11100110101",
		"01001100101",
		"00101100101",
		"11101100101",
		"00011100101",
		"11011100101",
		"10111100101",
		"11010110101",
		"11001110011",
		"10111010011",
		"11011010011",
		"01100011100",
		"11101010011",
		"01010011100",
		"00110011100",
		"01110001100",
		"11110010011",
		"01001011100",
		"00101011100",
		"01101001100",
		"00011011100",
		"01011001100",
		"00111001100",
		"10101110011",
		"10110110011",
		"01000111100",
		"00100111100",
		"01100101100",
		"00010111100",
		"11010101100",
		"00110101100",
		"11110100011",
		"11100110011",
		"01001101100",
		"00101101100",
		"11101100011",
		"00011101100",
		"11011100011",
		"10111100011",
		"11010110011",
		"11001110010",
		"00111010010",
		"01011010010",
		"11100011101",
		"01101010010",
		"11010011101",
		"10110011101",
		"11110001101",
		"01110010010",
		"11001011101",
		"10101011101",
		"11101001101",
		"10011011101",
		"11011001101",
		"10111001101",
		"00101110010",
		"00110110010",
		"11000111101",
		"10100111101",
		"11100101101",
		"10010111101",
		"11010101101",
		"10110101101",
		"01110100010",
		"01100110010",
		"11001101101",
		"10101101101",
		"01101100010",
		"10011101101",
		"01011100010",
		"00111100010",
		"01010110010",
		"11001111010",
		"10111011010",
		"11011011010",
		"01100011010",
		"11101011010",
		"01010011010",
		"00110011010",
		"01110001010",
		"11110011010",
		"01001011010",
		"00101011010",
		"01101001010",
		"00011011010",
		"01011001010",
		"00111001010",
		"10101111010",
		"10110111010",
		"01000111010",
		"00100111010",
		"01100101010",
		"00010111010",
		"01010101010",
		"00110101010",
		"11110101010",
		"11100111010",
		"01001101010",
		"00101101010",
		"11101101010",
		"00011101010",
		"11011101010",
		"10111101010",
		"11010111010",
		"11001110110",
		"10111010110",
		"11011010110",
		"01100010110",
		"11101010110",
		"01010010110",
		"00110010110",
		"01110000110",
		"11110010110",
		"01001010110",
		"00101010110",
		"01101000110",
		"00011010110",
		"01011000110",
		"00111000110",
		"10101110110",
		"10110110110",
		"01000110110",
		"00100110110",
		"01100100110",
		"00010110110",
		"01010100110",
		"00110100110",
		"11110100110",
		"11100110110",
		"01001100110",
		"00101100110",
		"11101100110",
		"00011100110",
		"11011100110",
		"10111100110",
		"11010110110",
		"01001110001",
		"00111010001",
		"01011010001",
		"11100011110",
		"01101010001",
		"11010011110",
		"10110011110",
		"11110001110",
		"01110010001",
		"11001011110",
		"10101011110",
		"11101001110",
		"10011011110",
		"11011001110",
		"10111001110",
		"00101110001",
		"00110110001",
		"11000110111",
		"10100110111",
		"11100101110",
		"10010110111",
		"11010101110",
		"10110101110",
		"01110100001",
		"01100110001",
		"11001101110",
		"10101101110",
		"01101100001",
		"10011101110",
		"01011100001",
		"00111100001",
		"01010110001",
		
		"10110001011",
		"11000101011",
		"10100101011",
		"01100010100",
		"10010101011",
		"01010010100",
		"00110010100",
		"00001110100",
		"10001101011",
		"01001010100",
		"00101010100",
		"01101000100",
		"00011010100",
		"01011000100",
		"00111000100",
		"11010001011",
		"11001001011",
		"01000110100",
		"00100110100",
		"01100100100",
		"00010110100",
		"01010100100",
		"00110100100",
		"00001011011",
		"10011001011",
		"01001100100",
		"00101100100",
		"10010011011",
		"00011100100",
		"10100011011",
		"11000011011",
		"10101001011",
		"00110001001",
		"01000101001",
		"00100101001",
		"11100011001",
		"00010101001",
		"11010011001",
		"10110011001",
		"10001111001",
		"00001101001",
		"11001011001",
		"10101011001",
		"11101001001",
		"10011011001",
		"11011001001",
		"10111001001",
		"01010001001",
		"01001001001",
		"11000111001",
		"10100111001",
		"11100101001",
		"10010111001",
		"11010101001",
		"10110101001",
		"00001011001",
		"00011001001",
		"11001101001",
		"10101101001",
		"00010011001",
		"10011101001",
		"00100011001",
		"01000011001",
		"00101001001",
		"00110000101",
		"01000100101",
		"00100100101",
		"11100010101",
		"00010100101",
		"11010010101",
		"10110010101",
		"10001110101",
		"00001100101",
		"11001010101",
		"10101010101",
		"11101000101",
		"10011010101",
		"11011000101",
		"10111000101",
		"01010000101",
		"01001000101",
		"11000110101",
		"10100110101",
		"11100100101",
		"10010110101",
		"11010100101",
		"10110100101",
		"00001010101",
		"00011000101",
		"11001100101",
		"10101100101",
		"00010010101",
		"10011100101",
		"00100010101",
		"01000010101",
		"00101000101",
		"00110001100",
		"01000101100",
		"00100101100",
		"11100010011",
		"00010101100",
		"11010010011",
		"10110010011",
		"10001110011",
		"00001101100",
		"11001010011",
		"10101010011",
		"11101000011",
		"10011010011",
		"11011000011",
		"10111000011",
		"01010001100",
		"01001001100",
		"11000110011",
		"10100110011",
		"11100100011",
		"10010110011",
		"11010100011",
		"10110100011",
		"00001011100",
		"00011001100",
		"11001100011",
		"10101100011",
		"00010011100",
		"10011100011",
		"00100011100",
		"01000011100",
		"00101001100",
		"10110001101",
		"11000101101",
		"10100101101",
		"01100010010",
		"10010101101",
		"01010010010",
		"00110010010",
		"00001110010",
		"10001101101",
		"01001010010",
		"00101010010",
		"01101000010",
		"00011010010",
		"01011000010",
		"00111000010",
		"11010001101",
		"11001001101",
		"01000110010",
		"00100110010",
		"01100100010",
		"00010110010",
		"01010100010",
		"00110100010",
		"10001011101",
		"10011001101",
		"01001100010",
		"00101100010",
		"10010011101",
		"00011100010",
		"10100011101",
		"11000011101",
		"10101001101",
		"00110001010",
		"01000101010",
		"00100101010",
		"11100011010",
		"00010101010",
		"11010011010",
		"10110011010",
		"10001111010",
		"00001101010",
		"11001011010",
		"10101011010",
		"11101001010",
		"10011011010",
		"11011001010",
		"10111001010",
		"01010001010",
		"01001001010",
		"11000111010",
		"10100111010",
		"11100101010",
		"10010111010",
		"11010101010",
		"10110101010",
		"00001011010",
		"00011001010",
		"11001101010",
		"10101101010",
		"00010011010",
		"10011101010",
		"00100011010",
		"01000011010",
		"00101001010",
		"00110000110",
		"01000100110",
		"00100100110",
		"11100010110",
		"00010100110",
		"11010010110",
		"10110010110",
		"10001110110",
		"00001100110",
		"11001010110",
		"10101010110",
		"11101000110",
		"10011010110",
		"11011000110",
		"10111000110",
		"01010000110",
		"01001000110",
		"11000110110",
		"10100110110",
		"11100100110",
		"10010110110",
		"11010100110",
		"10110100110",
		"00001010110",
		"00011000110",
		"11001100110",
		"10101100110",
		"00010010110",
		"10011100110",
		"00100010110",
		"01000010110",
		"00101000110",
		"10110001110",
		"11000101110",
		"10100101110",
		"01100010001",
		"10010101110",
		"01010010001",
		"00110010001",
		"00001110001",
		"10001101110",
		"01001010001",
		"00101010001",
		"01101001000",
		"00011010001",
		"01011001000",
		"00111001000",
		"11010001110",
		"11001001110",
		"01000110001",
		"00100110001",
		"01100100001",
		"00010110001",
		"01010100001",
		"00110100001",
		"10001011110",
		"10011001110",
		"01001100001",
		"00101100001",
		"10010011110",
		"00011100001",
		"10100011110",
		"11000011110",
		"10101001110"
        );
	
begin
	
	enc : process (clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				encode <= "00000000000";
				linked <= '0';
			else
				if linked = '1' then
					encode <= table(to_integer(unsigned(encode(10) & data_in)));
				else
					linked <= '1';
					encode <= link;
				end if;
			end if;
		end if;

	end process enc;
	
	encoded <= encode(9 downto 0);

end arch;