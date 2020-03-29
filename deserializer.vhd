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
		bit_clk  : in std_logic; 
		data_in  : in std_logic;
		data_out : out std_logic_vector(9 downto 0)
	);
end deserializer;


architecture arch of deserializer is

	signal reg_r   : std_logic_vector (9 downto 0);
	signal reg_f   : std_logic_vector (9 downto 0);
	
	signal op_r   : std_logic_vector (9 downto 0);
	signal op_f   : std_logic_vector (9 downto 0);
	
	signal count_r : integer range 0 to 10;
	signal count_f : integer range 0 to 10;

begin
			
	data_out <= op_f when (count_r = 10 and count_f = 0) or count_r = 1 or count_r = 3 or count_r = 5 or count_r = 7 or count_r = 9 else
	            op_r;
		
	--process (bit_clk)

	deserialize : process (bit_clk)
	begin	
		if rising_edge(bit_clk)  then
			reg_r <= data_in & reg_f(9 downto 1);
			
			if reg_f = link then 
				count_r <= 0;
			else 
				if count_f = 10 then 
					count_r <= 0;
					op_r <= reg_f;
				else 
					count_r <= count_f + 1;
				end if;
			end if;
		end if;
			
	end process deserialize;
	
	deserialize2 : process (bit_clk)
	begin	
		if falling_edge(bit_clk)  then
			reg_f <= data_in & reg_r(9 downto 1);
			
			if reg_r = link then 
				count_f <= 0;
			else 
				if count_r = 10 then 
					count_f <= 0;
					op_f <= reg_r;
				else 
					count_f <= count_r + 1;
				end if;
			end if;
		end if;
			
	end process deserialize2;
	
end arch;