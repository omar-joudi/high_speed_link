#source <script.tcl>

prj_project new -name "high_speed_link" -impl "impl1" -dev LCMXO2-1200HC-6TG100C -synthesis "synplify"

prj_src add "/src/decoding_8b10b.vhd" "/src/deserializer.vhd" "/src/encoding_8b10b.vhd" "/src/serializer.vhd" "/home/omar31/Desktop/high_speed_link-master/VHDL/top.vhd" "/src/pll.vhd" "/src/tp.vhd" "/src/sdc.sdc"

prj_src syn_sim -src "/src/tp.vhd" SimulateOnly

prj_project save

prj_run Synthesis -impl impl1

prj_run Translate -impl impl1

prj_run Map -impl impl1 -task MapTrace

prj_run PAR -impl impl1 -task PARTrace

prj_run Export -impl impl1 -task Bitgen

prj_run Export -impl impl1 -task Jedecgen

prj_project close

