----------------------------------------------------------------------------
--HIGH SPEED LINK
--deserializer.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity deserializer is
	generic (
		link : std_logic_vector(9 downto 0) := "0011111000"
	);
	port (
		clk      : in std_logic;
		bit_clk  : in std_logic; 
		data_in  : in std_logic;
		data_out : out std_logic_vector(9 downto 0)
	);
end deserializer;


architecture arch of deserializer is

	signal clk_s : std_logic;
	
	signal op_r : std_logic_vector(4 downto 0);
	signal op_f : std_logic_vector(4 downto 0);

begin

	deser_r : process (bit_clk)
	begin	
		if rising_edge(bit_clk) then
		    op_r <= data_in & op_r(4 downto 1);
		end if;	
	end process deser_r;
	
	deser_f : process (bit_clk)
	begin	
		if falling_edge(bit_clk)  then
		    op_f <= data_in & op_f(4 downto 1);
		end if;	
	end process deser_f;
	
	process (bit_clk)
	begin
	    if falling_edge(bit_clk) then
		    if clk_s /= clk then
		        clk_s <= clk;
		        data_out <= op_r(4) & op_f(4) & op_r(3) & op_f(3) & 
				    op_r(2) & op_f(2) & op_r(1) & op_f(1) & 
				    op_r(0) & op_f(0);
		    end if;
		end if;
    end process;
	
end arch;
