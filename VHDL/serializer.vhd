----------------------------------------------------------------------------
--HIGH SPEED LINK
--serializer.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity serializer is
	port (
	   clk      : in std_logic;
	   bit_clk  : in std_logic; 
	   data_in  : in std_logic_vector(9 downto 0); 
	   data_out : out std_logic
	);
end serializer;


architecture arch of serializer is

	signal input : std_logic_vector(9 downto 0);
	
	signal op_r : std_logic;
	signal op_f : std_logic;
	 
	signal clk_s : std_logic;

begin
	
	ser_r : process (bit_clk)
	begin
		if rising_edge(bit_clk) then
		    if clk_s = clk then
		        op_r  <= input(0);
		        input <= input(1) & '0' & input(9 downto 2);
		    else
		        op_r  <= data_in(0);
		        input <= data_in(1) & '0' & data_in(9 downto 2);
		        clk_s <= clk;
		    end if;
		end if;
	end process ser_r;
	
	ser_f : process (bit_clk)
	begin
		if falling_edge(bit_clk) then
		    op_f <= input(9);
		end if;
	end process ser_f;
	
	data_out <= op_r when bit_clk = '1' else
		    op_f when bit_clk = '0';

end arch;
