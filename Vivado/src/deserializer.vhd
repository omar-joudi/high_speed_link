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

Library UNISIM;
use UNISIM.vcomponents.all;


entity deserializer is
    generic (
        link : std_logic_vector(9 downto 0) := "0011111000"
    );
    port (
        clk       : in std_logic;
	       reset     : in std_logic;
        bit_clk   : in std_logic;
        bit_clk_s : in std_logic; 
        data_in   : in std_logic;
        data_out  : out std_logic_vector(9 downto 0)
    );
end deserializer;


architecture arch of deserializer is
	
    signal shift1 : std_logic;
    signal shift2 : std_logic;
    
    signal clkn :std_logic;

begin
 
    clkn <= not clk;

    master_iserdes : ISERDESE2
        generic map (
            DATA_RATE         => "DDR",
            DATA_WIDTH        => 10,
            INTERFACE_TYPE    => "NETWORKING",
            DYN_CLKDIV_INV_EN => "FALSE",
            DYN_CLK_INV_EN    => "FALSE",
            NUM_CE            => 2,
            OFB_USED          => "FALSE",
            IOBDELAY          => "NONE",         
            SERDES_MODE       => "MASTER"
            )
        port map (
            BITSLIP      => '0',
            CE1          => '1',
            CE2          => '1',
            CLK          => bit_clk_s,
            CLKB         => bit_clk,
            CLKDIV       => clkn,
            CLKDIVP      => '0',
            D            => data_in,
            DDLY         => '0',
            O            => open,
            OCLK         => '0',
            OCLKB        => '0',
            OFB          => '0',
            SHIFTIN1     => '0',
            SHIFTIN2     => '0',
            SHIFTOUT1    => shift1,
            SHIFTOUT2    => shift2,
            DYNCLKDIVSEL => '0',
            DYNCLKSEL    => '0',
            RST          => reset,
            Q1           => data_out(9),
            Q2           => data_out(8),
            Q3           => data_out(7),
           Q4           => data_out(6),
            Q5           => data_out(5),
            Q6           => data_out(4),
           Q7           => data_out(3),
            Q8           => data_out(2)
        );

    slave_iserdes : ISERDESE2
        generic map (
            DATA_RATE         => "DDR",
            DATA_WIDTH        => 10,
            INTERFACE_TYPE    => "NETWORKING",
            DYN_CLKDIV_INV_EN => "FALSE",
            DYN_CLK_INV_EN    => "FALSE",
            NUM_CE            => 2,
            OFB_USED          => "FALSE",
            IOBDELAY          => "NONE",         
            SERDES_MODE       => "SLAVE"
            )
        port map (
            BITSLIP       => '0',
            CE1           => '1',
            CE2           => '1',
            CLK           => bit_clk_s,
            CLKB          => bit_clk,
            CLKDIV        => clkn,
            CLKDIVP       => '0',
            D             => '0',
            DDLY          => '0',
            O             => open,
            OCLK          => '0',
            OCLKB         => '0',
            OFB           => '0',
            SHIFTIN1      => shift1,
            SHIFTIN2      => shift2,
            DYNCLKDIVSEL  => '0',
            DYNCLKSEL     => '0',
            SHIFTOUT1     => open,
            SHIFTOUT2     => open,
            RST           => reset,
            Q1            => open,
            Q2            => open,
            Q3            => data_out(1),
            Q4            => data_out(0),
            Q5            => open,
            Q6            => open,
            Q7            => open,
            Q8            => open
    );
	
end arch;
