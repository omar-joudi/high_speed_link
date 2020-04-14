----------------------------------------------------------------------------
--HIGH SPEED LINK
--tb.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity tb is
	generic (
		period : time := 41.666ns;
		--
		seed : std_logic_vector (7 downto 0) := "11001010"
	);
end tb;


architecture arch of tb is

	signal clk : std_logic;
	signal reset : std_logic;
		
	signal data_decoded : std_logic_vector(7 downto 0);
	
	signal prn : std_logic_vector(7 downto 0);
	
begin

	top_mod: entity work.top
		port map (
			clk => clk,
			reset => reset,
			data_decoded => data_decoded,
			prn => prn
		);
	   
	prng: process (clk)
	begin
		if rising_edge(clk) or falling_edge(clk) then 
			if reset = '1' then
				prn <= seed;
			else
				prn <= prn(6 downto 0) & (prn(1) xor prn(2) xor prn(3) xor prn(7));
			end if;
		end if;
	end process prng;
	
	in_clk : process 
	begin
		clk <= '0';
		wait for period/2;

		clk <= '1';
		wait for period/2;
	end process in_clk;
	
	test : process
	begin
			reset <= '1';
			wait for 2.09us;
			reset <= '0';
			wait for 6us;
	end process test;

end arch;