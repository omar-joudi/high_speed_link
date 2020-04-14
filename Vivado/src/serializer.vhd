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

Library UNISIM;
use UNISIM.vcomponents.all;

entity serializer is
    port (
	clk      : in std_logic;
	reset    : in std_logic;
	bit_clk  : in std_logic;
	data_in  : in std_logic_vector(9 downto 0); 
	data_out : out std_logic
    );
end serializer;


architecture arch of serializer is
	
    signal shift1 : std_logic;
    signal shift2 : std_logic;

begin	
				
    master_serdes : OSERDESE2
       generic map (
          DATA_RATE_OQ   => "DDR",   
          DATA_RATE_TQ   => "DDR",   
          DATA_WIDTH     => 10,        
          INIT_OQ        => '0',          
          INIT_TQ        => '0',          
          SERDES_MODE    => "MASTER", 
          SRVAL_OQ       => '0',        
          SRVAL_TQ       => '0',         
          TBYTE_CTL      => "FALSE",   
          TBYTE_SRC      => "FALSE",   
          TRISTATE_WIDTH => 1      
       )
       port map (
          OFB       => open,             
          OQ        => data_out,              
          SHIFTOUT1 => open,
          SHIFTOUT2 => open,
          TBYTEOUT  => open,   
          TFB       => open,        
          TQ        => open,              
          CLK       => bit_clk,             
          CLKDIV    => clk,      
          D1        => data_in(0),
          D2        => data_in(1),
          D3        => data_in(2),
          D4        => data_in(3),
          D5        => data_in(4),
          D6        => data_in(5),
          D7        => data_in(6),
          D8        => data_in(7),
          OCE       => '1', 
          RST       => reset,         
          SHIFTIN1  => shift1,
          SHIFTIN2  => shift2,
          T1        => '0',
          T2        => '0',
          T3        => '0',
          T4        => '0',
          TBYTEIN   => '0', 
          TCE       => '0'                 
       );

    slave_serdes : OSERDESE2
       generic map (
          DATA_RATE_OQ   => "DDR",  
          DATA_RATE_TQ   => "DDR",   
          DATA_WIDTH     => 10,   
          INIT_OQ        => '1',     
          INIT_TQ        => '1',   
          SERDES_MODE    => "SLAVE",
          SRVAL_OQ       => '0',  
          SRVAL_TQ       => '0',     
          TBYTE_CTL      => "FALSE", 
          TBYTE_SRC      => "FALSE", 
          TRISTATE_WIDTH => 1       
       )
       port map (
          OFB       => open,        
          OQ        => open,         
          SHIFTOUT1 => shift1,
          SHIFTOUT2 => shift2,
          TBYTEOUT  => open,  
          TFB       => open,   
          TQ        => open,    
          CLK       => bit_clk, 
          CLKDIV    => clk,     
          D1        => '0',
          D2        => '0',
          D3        => data_in(8),
          D4        => data_in(9),
          D5        => '0',
          D6        => '0',
          D7        => '0',
          D8        => '0',
          OCE       => '1', 
          RST       => reset,    
          SHIFTIN1  => '0',
          SHIFTIN2  => '0',
          T1        => '0',
          T2        => '0',
          T3        => '0',
          T4        => '0',
          TBYTEIN   => '0',     
          TCE       => '0'      
       );
	    
end arch;
