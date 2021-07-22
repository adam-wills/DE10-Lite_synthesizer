

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 4



#**************************************************************
# Create Clock
#**************************************************************

#create_clock -period "10.0 MHz" [get_ports ADC_CLK_10]
create_clock -name CLK1_50   -period "50.0 MHz" [get_ports MAX10_CLK1_50]
create_clock -name CLK1_virt -period "50.0 MHz"
create_clock -name CLK2_50   -period "50.0 MHz" [get_ports MAX10_CLK2_50]
create_clock -name CLK1_virt -period "50.0 MHz" 

#**************************************************************
# Create Generated Clock
#**************************************************************


create_generated_clock -source [get_pins {u0|sdram_pll|sd1|pll7|clk[1]}] \
							  -name clk_dram_ext [get_ports {DRAM_CLK}]
							  		 
create_generated_clock -source [get_pins {clockDivider_2|ctr[1]}] \
                       -name I2S_MCLK [get_ports {ARDUINO_IO[3]}]

# TODO: setup feedback pll?? to monitor slave pll? to constrain clocks that don't need constraining?
# clock domains have been pretty much separated
derive_pll_clocks
							  
			  
 							 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty 


#**************************************************************
# Set Input Delay
#**************************************************************
# suppose +- 100 ps skew
# Board Delay (Data) + Propagation Delay - Board Delay (Clock)
# max 5.4(max) +0.4(trace delay) +0.1 = 5.9
# min 2.7(min) +0.4(trace delay) -0.1 = 3.0
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[0]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[1]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[2]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[3]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[4]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[5]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[6]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[7]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[8]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[9]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[10]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[11]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[12]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[13]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[14]]
set_input_delay -max -clock clk_dram_ext  5.9 [get_ports DRAM_DQ[15]]

# TODO: determine correct delays for ARDUINO_IO
set_input_delay -max -clock CLK1_virt      5.9 [get_ports ARDUINO_IO[9]]
set_input_delay -max -clock CLK1_virt      5.9 [get_ports ARDUINO_IO[12]]
set_input_delay -max -clock CLK2_virt      5.9 [get_ports ARDUINO_IO[14]]
set_input_delay -max -clock CLK2_virt      5.9 [get_ports ARDUINO_IO[15]]

set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[0]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[1]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[2]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[3]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[4]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[5]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[6]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[7]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[8]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[9]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[10]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[11]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[12]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[13]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[14]]
set_input_delay -min -clock clk_dram_ext  3.0 [get_ports DRAM_DQ[15]]

set_input_delay -min -clock CLK1_virt     3.0 [get_ports ARDUINO_IO[9]]
set_input_delay -min -clock CLK1_virt     3.0 [get_ports ARDUINO_IO[12]]
set_input_delay -min -clock CLK2_virt     3.0 [get_ports ARDUINO_IO[14]]
set_input_delay -min -clock CLK2_virt     3.0 [get_ports ARDUINO_IO[15]]





#**************************************************************
# Set Output Delay
#**************************************************************
# suppose +- 100 ps skew
# max : Board Delay (Data) - Board Delay (Clock) + tsu (External Device)
# min : Board Delay (Data) - Board Delay (Clock) - th (External Device)
# max 1.5+0.1 =1.6
# min -0.8-0.1 = -0.9
set_output_delay -max -clock clk_dram_ext  1.6  [get_ports DRAM_DQ*]
set_output_delay -max -clock clk_dram_ext  1.6  [get_ports {DRAM_LDQM DRAM_UDQM}]
set_output_delay -max -clock clk_dram_ext  1.6  [get_ports {DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_CKE DRAM_CS_N}]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[7]]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[10]]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[11]]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[13]]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_RESET_N]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[14]]
set_output_delay -max -clock CLK1_virt     1.6 [get_ports ARDUINO_IO[15]]


set_output_delay -min -clock clk_dram_ext  -0.9 [get_ports DRAM_DQ*]
set_output_delay -min -clock clk_dram_ext  -0.9 [get_ports {DRAM_LDQM DRAM_UDQM}]
set_output_delay -min -clock clk_dram_ext  -0.9 [get_ports {DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_CKE DRAM_CS_N}]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[7]]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[10]]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[11]]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[13]]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_RESET_N]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[14]]
set_output_delay -min -clock CLK1_virt     -0.9 [get_ports ARDUINO_IO[15]]




#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from * -to [get_ports LEDR*]
set_false_path -from [get_ports SW*] -to *
set_false_path -from [get_ports KEY*] -to *
set_false_path -from [get_ports {altera_reserved_tdi}] -to *
set_false_path -from [get_ports {altera_reserved_tms}] -to *
set_false_path -from * -to [get_ports {altera_reserved_tdo}]
set_false_path -from * -to [get_ports HEX*]

#set_false_path -from * -to [get_ports ARDUINO_IO[4]]
#set_false_path -from * -to [get_ports ARDUINO_IO[5]]
set_false_path -from [get_ports {ARDUINO_IO[4]}] -to *
set_false_path -from [get_ports {ARDUINO_IO[5]}] -to *
set_false_path -from * -to [get_ports {ARDUINO_IO[3]}]
set_false_path -from * -to [get_ports {ARDUINO_IO[2]}]




#**************************************************************
# Set Multicycle Path
#**************************************************************
set_multicycle_path -from [get_clocks {clk_dram_ext}] \
                    -to   [get_clocks {u0|sdram_pll|sd1|pll7|clk[0]}] \
						  -setup 2
						  

#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

