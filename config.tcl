# User config
set script_dir [file dirname [file normalize [info script]]]

# name of your project, should also match the name of the top module
set ::env(DESIGN_NAME) wrapped_spraid

# add your source files here
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/wrapper.v \
    $::env(DESIGN_DIR)/spraid/src/wb_spraid.v \
	$::env(DESIGN_DIR)/spraid/src/spraid.v \
	$::env(DESIGN_DIR)/spraid/src/raid.v \
	$::env(DESIGN_DIR)/spraid/src/flash_ctl.v \
	$::env(DESIGN_DIR)/spraid/src/spi32.v \
	$::env(DESIGN_DIR)/spraid/src/spi_master.v \
	$::env(DESIGN_DIR)/spraid/src/pload_shift.v \
	$::env(DESIGN_DIR)/spraid/src/sync_fifo.v "

set ::env(ROUTING_CORES) 32

# target density, change this if you can't get your design to fit
set ::env(FP_CORE_UTIL) 45
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

# don't put clock buffers on the outputs, need tristates to be the final cells
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.2
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.2

# set absolute size of the die to 300 x 300 um
#set ::env(DIE_AREA) "0 0 600 600"
#set ::env(FP_SIZING) absolute

# define number of IO pads
set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# clock period is ns
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "wb_clk_i"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# turn off CVC as we have multiple power domains
set ::env(RUN_CVC) 0

# make pins wider to solve routing issues
set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4
