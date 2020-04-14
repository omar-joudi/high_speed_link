----------------------------------------------------------------------------
--HIGH SPEED LINK
--top.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;


entity top is
	port (
		clk          : in std_logic;
		reset        : in std_logic;
		prn          : in std_logic_vector(7 downto 0);
		data_decoded : out std_logic_vector(7 downto 0)
	);
end top;
 

architecture arch of top is

	signal bit_clk : std_logic;

	signal encoded : std_logic_vector(9 downto 0);

	signal ser_data : std_logic;
	
	signal data_out : std_logic_vector(9 downto 0);

begin

	pll_mod: entity work.pll
		port map (
		    CLKI  => clk,
			CLKOP => bit_clk
		);

	encoding_8b10b_mod: entity work.encoding_8b10b(arch)
		port map(
			clk          => clk,
			reset        => reset,
			data_in      => prn,
			encoded => encoded
		);

	serializer_mod: entity work.serializer(arch)
		port map(
		    clk => clk,
			bit_clk  => bit_clk, 
			data_in  => encoded,
			data_out => ser_data
		);	
 
	deserializer_mod: entity work.deserializer(arch)
		port map(
		    clk => clk,
			bit_clk  => bit_clk, 
			data_in  => ser_data,
			data_out =>  data_out
		);

	decoding_8b10b_mod: entity work.decoding_8b10b(arch)
		port map(
			data_in => data_out,
			output  => data_decoded
		);
		
end arch;
