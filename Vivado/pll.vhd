----------------------------------------------------------------------------
--HIGH SPEED LINK
--pll.vhd
--
--GSoC 2020
--
--Copyright (C) 2020 Omar Joudi
--Email: s-omarmonzer@zewailcity.edu.eg
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;


entity pll is
		port (
			CLKI  : in std_logic; 
			CLKOP : out std_logic;
			CLKOPS : out std_logic
		);
end pll;


architecture Behavioral of pll is

    signal CLKFBOUT : std_logic;
    signal LOCKED : std_logic;
    constant PWRDWN : std_logic := '0';
    constant RST : std_logic:= '0';
	signal CLKFBI : std_logic;
	signal IBUF : std_logic;
    
begin

    PLLE2_BASE_inst : PLLE2_BASE
        generic map (
            	CLKFBOUT_MULT => 20, -- Multiply value for all CLKOUT, (2-64)
            	CLKFBOUT_PHASE => 0.0, -- Phase offset in degrees of CLKFB, (-360.000-360.000).
            	CLKIN1_PERIOD => 20.500, --input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
            	DIVCLK_DIVIDE => 1, -- Master division value, (1-56)
		CLKOUT0_DIVIDE => 4,	
	        CLKOUT0_PHASE => 90.0,
		CLKOUT1_DIVIDE => 4,	
	        CLKOUT1_PHASE => 00.0
        )
        port map (
            	CLKOUT0 => CLKOPS,
            	CLKOUT1 => CLKOP,
            	CLKFBOUT => CLKFBOUT, -- 1-bit output: Feedback clock
            	LOCKED => LOCKED, -- 1-bit output: LOCK
            	CLKIN1 => CLKI, -- 1-bit input: Input clock\
            	PWRDWN => PWRDWN, -- 1-bit input: Power-down
            	RST => RST, -- 1-bit input: Reset\
            	CLKFBIN => CLKFBI -- 1-bit input: Feedback clock
        );
        
        CLKFBI <= CLKFBOUT;

end Behavioral;
