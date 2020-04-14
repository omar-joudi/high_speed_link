export TEMP=/tmp
export LSC_INI_PATH=""
export LSC_DIAMOND=true
export TCL_LIBRARY=/usr/local/diamond/3.11_x64/tcltk/lib/tcl8.5
export FOUNDRY=/usr/local/diamond/3.11_x64/ispFPGA
export PATH=$FOUNDRY/bin/nt:$PATH
/usr/local/diamond/3.11_x64/bin/lin64/diamondc script.tcl > output1.txt
