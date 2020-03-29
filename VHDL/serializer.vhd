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
		bit_clk  : in std_logic; 
		data_in  : in std_logic_vector(9 downto 0);
		data_out : out std_logic
	);
end serializer;


architecture arch of serializer is

	signal count_r : integer 	range 0 to 10;
	signal count_f : integer 	range 0 to 10;
	
	signal op_r :std_logic;
	signal op_f :std_logic;

begin
	
	ser_r : process (bit_clk)
	begin
		if rising_edge(bit_clk) then
			if data_in = "0000000000" then
				count_r <= 10;
			else
				if count_f = 10 then 
					count_r <= 0;
				else
					count_r <= count_f + 1;
				end if;
			end if;
		
			if count_f /= 10 then 
				op_r <= data_in(count_f);
			end if;
		end if;
	end process ser_r;
	
	ser_f : process (bit_clk)
	begin
		if falling_edge(bit_clk) then
			if data_in = "0000000000" then
				count_f <= 10;
			else
				if count_r = 10 then 
					count_f <= 0;
				else
					count_f <= count_r + 1;
				end if;
			end if;
		
			if count_r /= 10 then 
				op_f <= data_in(count_r);
			end if;
		end if;
	end process ser_f;
	
	data_out <= op_r when bit_clk = '1' else
		    op_f when bit_clk = '0';

end arch;
