create_clock -period 40.000 -name clk -waveform {0.000 20.000} -add [get_ports clk]


create_pblock pblock_encoding_8b10b_mod
add_cells_to_pblock [get_pblocks pblock_encoding_8b10b_mod] [get_cells -quiet [list encoding_8b10b_mod]]
resize_pblock [get_pblocks pblock_encoding_8b10b_mod] -add {SLICE_X0Y13:SLICE_X3Y20}
