//altpll_reconfig_avalon CBX_SINGLE_OUTPUT_FILE="ON" busy clock counter_param counter_type data_in data_out pll_areset pll_areset_in pll_configupdate pll_scanclk pll_scanclkena pll_scandata pll_scandataout pll_scandone read_param reconfig reset reset_rom_address rom_address_out rom_data_in write_from_rom write_param write_rom_ena device_family="MAX10"
//VERSION_BEGIN 20.1 cbx_altera_syncram_nd_impl 2020:06:05:12:04:51:SJ cbx_altpll_reconfig 2020:06:05:12:04:51:SJ cbx_altpll_reconfig_avalon 2020:06:05:12:04:51:SJ cbx_altsyncram 2020:06:05:12:04:51:SJ cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_lpm_mux 2020:06:05:12:04:51:SJ cbx_lpm_shiftreg 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ cbx_stratixiii 2020:06:05:12:04:51:SJ cbx_stratixv 2020:06:05:12:04:51:SJ cbx_util_mgl 2020:06:05:12:04:51:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2020  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.




//altpll_reconfig CBX_SINGLE_OUTPUT_FILE="ON" device_family="MAX10" init_from_rom="NO" busy clock counter_param counter_type data_in data_out pll_areset pll_areset_in pll_configupdate pll_scanclk pll_scanclkena pll_scandata pll_scandataout pll_scandone read_param reconfig reset rom_address_out write_from_rom write_param write_rom_ena
//VERSION_BEGIN 20.1 cbx_altera_syncram_nd_impl 2020:06:05:12:04:51:SJ cbx_altpll_reconfig 2020:06:05:12:04:51:SJ cbx_altsyncram 2020:06:05:12:04:51:SJ cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_lpm_mux 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ cbx_stratixiii 2020:06:05:12:04:51:SJ cbx_stratixv 2020:06:05:12:04:51:SJ cbx_util_mgl 2020:06:05:12:04:51:SJ  VERSION_END


//altsyncram CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" NUMWORDS_A=144 OPERATION_MODE="SINGLE_PORT" WIDTH_A=1 WIDTH_BYTEENA_A=1 WIDTHAD_A=8 address_a clock0 data_a q_a wren_a
//VERSION_BEGIN 20.1 cbx_altera_syncram_nd_impl 2020:06:05:12:04:51:SJ cbx_altsyncram 2020:06:05:12:04:51:SJ cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_lpm_mux 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ cbx_stratixiii 2020:06:05:12:04:51:SJ cbx_stratixv 2020:06:05:12:04:51:SJ cbx_util_mgl 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = M9K 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"OPTIMIZE_POWER_DURING_SYNTHESIS=NORMAL_COMPILATION"} *)
module  finalProject_i2s_mclk_reconfig_altsyncram_pdg
	( 
	address_a,
	clock0,
	data_a,
	q_a,
	wren_a) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  address_a;
	input   clock0;
	input   [0:0]  data_a;
	output   [0:0]  q_a;
	input   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clock0;
	tri1   [0:0]  data_a;
	tri0   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_ram_block18a_0portadataout;
	wire  [7:0]  address_a_wire;

	fiftyfivenm_ram_block   ram_block18a_0
	( 
	.clk0(clock0),
	.portaaddr({address_a_wire[7:0]}),
	.portadatain({data_a[0]}),
	.portadataout(wire_ram_block18a_0portadataout[0:0]),
	.portare(1'b1),
	.portawe(wren_a),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.ena2(1'b1),
	.ena3(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbre(1'b1),
	.portbwe(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block18a_0.clk0_core_clock_enable = "none",
		ram_block18a_0.clk0_input_clock_enable = "none",
		ram_block18a_0.connectivity_checking = "OFF",
		ram_block18a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block18a_0.operation_mode = "single_port",
		ram_block18a_0.port_a_address_width = 8,
		ram_block18a_0.port_a_byte_enable_mask_width = 1,
		ram_block18a_0.port_a_byte_size = 1,
		ram_block18a_0.port_a_data_out_clear = "none",
		ram_block18a_0.port_a_data_out_clock = "none",
		ram_block18a_0.port_a_data_width = 1,
		ram_block18a_0.port_a_first_address = 0,
		ram_block18a_0.port_a_first_bit_number = 0,
		ram_block18a_0.port_a_last_address = 143,
		ram_block18a_0.port_a_logical_ram_depth = 144,
		ram_block18a_0.port_a_logical_ram_width = 1,
		ram_block18a_0.port_a_read_during_write_mode = "new_data_no_nbe_read",
		ram_block18a_0.ram_block_type = "AUTO",
		ram_block18a_0.lpm_type = "fiftyfivenm_ram_block";
	assign
		address_a_wire = address_a,
		q_a = {wire_ram_block18a_0portadataout[0]};
endmodule //finalProject_i2s_mclk_reconfig_altsyncram_pdg


//lpm_add_sub CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" LPM_WIDTH=9 cin dataa datab result
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END


//lpm_add_sub CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" LPM_WIDTH=8 cin dataa result
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END


//lpm_compare CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" LPM_WIDTH=8 aeb dataa datab
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cmpr_f58
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [7:0]  dataa;
	input   [7:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [7:0]  dataa;
	tri0   [7:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [19:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = (((data_wire[0] | data_wire[1]) | data_wire[2]) | data_wire[3]),
		data_wire = {datab[7], dataa[7], datab[6], dataa[6], datab[5], dataa[5], datab[4], dataa[4], datab[3], dataa[3], datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], ((data_wire[16] ^ data_wire[17]) | (data_wire[18] ^ data_wire[19])), ((data_wire[12] ^ data_wire[13]) | (data_wire[14] ^ data_wire[15])), ((data_wire[8] ^ data_wire[9]) | (data_wire[10] ^ data_wire[11])), ((data_wire[4] ^ data_wire[5]) | (data_wire[6] ^ data_wire[7]))},
		eq_wire = aeb_result_wire;
endmodule //finalProject_i2s_mclk_reconfig_cmpr_f58


//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" lpm_direction="DOWN" lpm_modulus=144 lpm_port_updown="PORT_UNUSED" lpm_width=8 clock cnt_en data q sload
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 8 reg 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cntr_ldf
	( 
	clock,
	cnt_en,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	input   [7:0]  data;
	output   [7:0]  q;
	input   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
	tri0   [7:0]  data;
	tri0   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_2combout;
	wire  [0:0]   wire_counter_comb_bita_3combout;
	wire  [0:0]   wire_counter_comb_bita_4combout;
	wire  [0:0]   wire_counter_comb_bita_5combout;
	wire  [0:0]   wire_counter_comb_bita_6combout;
	wire  [0:0]   wire_counter_comb_bita_7combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire  [0:0]   wire_counter_comb_bita_5cout;
	wire  [0:0]   wire_counter_comb_bita_6cout;
	wire  [0:0]   wire_counter_comb_bita_7cout;
	wire	[7:0]	wire_counter_reg_bit_d;
	wire	[7:0]	wire_counter_reg_bit_asdata;
	reg	[7:0]	counter_reg_bit;
	wire	[7:0]	wire_counter_reg_bit_ena;
	wire	[7:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire  cout_actual;
	wire  external_cin;
	wire  [7:0]  modulus_bus;
	wire  modulus_trigger;
	wire  [7:0]  s_val;
	wire  [7:0]  safe_q;
	wire sclr;
	wire sset;
	wire  time_to_clear;
	wire  updown_dir;

	fiftyfivenm_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(wire_counter_comb_bita_2combout[0:0]),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.dataa(counter_reg_bit[2]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_2.lut_mask = 16'h5A90,
		counter_comb_bita_2.sum_lutc_input = "cin",
		counter_comb_bita_2.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(wire_counter_comb_bita_3combout[0:0]),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.dataa(counter_reg_bit[3]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_3.lut_mask = 16'h5A90,
		counter_comb_bita_3.sum_lutc_input = "cin",
		counter_comb_bita_3.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(wire_counter_comb_bita_4combout[0:0]),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.dataa(counter_reg_bit[4]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_4.lut_mask = 16'h5A90,
		counter_comb_bita_4.sum_lutc_input = "cin",
		counter_comb_bita_4.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(wire_counter_comb_bita_5combout[0:0]),
	.cout(wire_counter_comb_bita_5cout[0:0]),
	.dataa(counter_reg_bit[5]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_5.lut_mask = 16'h5A90,
		counter_comb_bita_5.sum_lutc_input = "cin",
		counter_comb_bita_5.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_6
	( 
	.cin(wire_counter_comb_bita_5cout[0:0]),
	.combout(wire_counter_comb_bita_6combout[0:0]),
	.cout(wire_counter_comb_bita_6cout[0:0]),
	.dataa(counter_reg_bit[6]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_6.lut_mask = 16'h5A90,
		counter_comb_bita_6.sum_lutc_input = "cin",
		counter_comb_bita_6.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_7
	( 
	.cin(wire_counter_comb_bita_6cout[0:0]),
	.combout(wire_counter_comb_bita_7combout[0:0]),
	.cout(wire_counter_comb_bita_7cout[0:0]),
	.dataa(counter_reg_bit[7]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_7.lut_mask = 16'h5A90,
		counter_comb_bita_7.sum_lutc_input = "cin",
		counter_comb_bita_7.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1) 
			if (wire_counter_reg_bit_sload[2:2] == 1'b1) counter_reg_bit[2:2] <= wire_counter_reg_bit_asdata[2:2];
			else  counter_reg_bit[2:2] <= wire_counter_reg_bit_d[2:2];
	// synopsys translate_off
	initial
		counter_reg_bit[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[3:3] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[3:3] == 1'b1) 
			if (wire_counter_reg_bit_sload[3:3] == 1'b1) counter_reg_bit[3:3] <= wire_counter_reg_bit_asdata[3:3];
			else  counter_reg_bit[3:3] <= wire_counter_reg_bit_d[3:3];
	// synopsys translate_off
	initial
		counter_reg_bit[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[4:4] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[4:4] == 1'b1) 
			if (wire_counter_reg_bit_sload[4:4] == 1'b1) counter_reg_bit[4:4] <= wire_counter_reg_bit_asdata[4:4];
			else  counter_reg_bit[4:4] <= wire_counter_reg_bit_d[4:4];
	// synopsys translate_off
	initial
		counter_reg_bit[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[5:5] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[5:5] == 1'b1) 
			if (wire_counter_reg_bit_sload[5:5] == 1'b1) counter_reg_bit[5:5] <= wire_counter_reg_bit_asdata[5:5];
			else  counter_reg_bit[5:5] <= wire_counter_reg_bit_d[5:5];
	// synopsys translate_off
	initial
		counter_reg_bit[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[6:6] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[6:6] == 1'b1) 
			if (wire_counter_reg_bit_sload[6:6] == 1'b1) counter_reg_bit[6:6] <= wire_counter_reg_bit_asdata[6:6];
			else  counter_reg_bit[6:6] <= wire_counter_reg_bit_d[6:6];
	// synopsys translate_off
	initial
		counter_reg_bit[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[7:7] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[7:7] == 1'b1) 
			if (wire_counter_reg_bit_sload[7:7] == 1'b1) counter_reg_bit[7:7] <= wire_counter_reg_bit_asdata[7:7];
			else  counter_reg_bit[7:7] <= wire_counter_reg_bit_d[7:7];
	assign
		wire_counter_reg_bit_asdata = ({8{(~ sclr)}} & (({8{sset}} & s_val) | ({8{(~ sset)}} & (({8{sload}} & data) | (({8{(~ sload)}} & modulus_bus) & {8{(~ updown_dir)}}))))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_7combout[0:0], wire_counter_comb_bita_6combout[0:0], wire_counter_comb_bita_5combout[0:0], wire_counter_comb_bita_4combout[0:0], wire_counter_comb_bita_3combout[0:0], wire_counter_comb_bita_2combout[0:0], wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {8{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {8{(((sclr | sset) | sload) | modulus_trigger)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		cout_actual = (wire_counter_comb_bita_7cout[0:0] | (time_to_clear & updown_dir)),
		external_cin = 1'b1,
		modulus_bus = 8'b10001111,
		modulus_trigger = cout_actual,
		q = safe_q,
		s_val = {8{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sset = 1'b0,
		time_to_clear = 1'b0,
		updown_dir = 1'b0;
endmodule //finalProject_i2s_mclk_reconfig_cntr_ldf


//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" lpm_direction="DOWN" lpm_port_updown="PORT_UNUSED" lpm_width=6 clock cnt_en data q sload
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 6 reg 6 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cntr_c0e
	( 
	clock,
	cnt_en,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	input   [5:0]  data;
	output   [5:0]  q;
	input   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
	tri0   [5:0]  data;
	tri0   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_2combout;
	wire  [0:0]   wire_counter_comb_bita_3combout;
	wire  [0:0]   wire_counter_comb_bita_4combout;
	wire  [0:0]   wire_counter_comb_bita_5combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire	[5:0]	wire_counter_reg_bit_d;
	wire	[5:0]	wire_counter_reg_bit_asdata;
	reg	[5:0]	counter_reg_bit;
	wire	[5:0]	wire_counter_reg_bit_ena;
	wire	[5:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire  external_cin;
	wire  [5:0]  s_val;
	wire  [5:0]  safe_q;
	wire sclr;
	wire sset;
	wire  updown_dir;

	fiftyfivenm_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(wire_counter_comb_bita_2combout[0:0]),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.dataa(counter_reg_bit[2]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_2.lut_mask = 16'h5A90,
		counter_comb_bita_2.sum_lutc_input = "cin",
		counter_comb_bita_2.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(wire_counter_comb_bita_3combout[0:0]),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.dataa(counter_reg_bit[3]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_3.lut_mask = 16'h5A90,
		counter_comb_bita_3.sum_lutc_input = "cin",
		counter_comb_bita_3.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(wire_counter_comb_bita_4combout[0:0]),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.dataa(counter_reg_bit[4]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_4.lut_mask = 16'h5A90,
		counter_comb_bita_4.sum_lutc_input = "cin",
		counter_comb_bita_4.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(wire_counter_comb_bita_5combout[0:0]),
	.cout(),
	.dataa(counter_reg_bit[5]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_5.lut_mask = 16'h5A90,
		counter_comb_bita_5.sum_lutc_input = "cin",
		counter_comb_bita_5.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1) 
			if (wire_counter_reg_bit_sload[2:2] == 1'b1) counter_reg_bit[2:2] <= wire_counter_reg_bit_asdata[2:2];
			else  counter_reg_bit[2:2] <= wire_counter_reg_bit_d[2:2];
	// synopsys translate_off
	initial
		counter_reg_bit[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[3:3] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[3:3] == 1'b1) 
			if (wire_counter_reg_bit_sload[3:3] == 1'b1) counter_reg_bit[3:3] <= wire_counter_reg_bit_asdata[3:3];
			else  counter_reg_bit[3:3] <= wire_counter_reg_bit_d[3:3];
	// synopsys translate_off
	initial
		counter_reg_bit[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[4:4] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[4:4] == 1'b1) 
			if (wire_counter_reg_bit_sload[4:4] == 1'b1) counter_reg_bit[4:4] <= wire_counter_reg_bit_asdata[4:4];
			else  counter_reg_bit[4:4] <= wire_counter_reg_bit_d[4:4];
	// synopsys translate_off
	initial
		counter_reg_bit[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[5:5] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[5:5] == 1'b1) 
			if (wire_counter_reg_bit_sload[5:5] == 1'b1) counter_reg_bit[5:5] <= wire_counter_reg_bit_asdata[5:5];
			else  counter_reg_bit[5:5] <= wire_counter_reg_bit_d[5:5];
	assign
		wire_counter_reg_bit_asdata = ({6{(~ sclr)}} & (({6{sset}} & s_val) | ({6{(~ sset)}} & data))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_5combout[0:0], wire_counter_comb_bita_4combout[0:0], wire_counter_comb_bita_3combout[0:0], wire_counter_comb_bita_2combout[0:0], wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {6{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {6{((sclr | sset) | sload)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		external_cin = 1'b1,
		q = safe_q,
		s_val = {6{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b0;
endmodule //finalProject_i2s_mclk_reconfig_cntr_c0e


//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" lpm_direction="DOWN" lpm_port_updown="PORT_UNUSED" lpm_width=8 clock cnt_en data q sload
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 8 reg 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cntr_e0e
	( 
	clock,
	cnt_en,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	input   [7:0]  data;
	output   [7:0]  q;
	input   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
	tri0   [7:0]  data;
	tri0   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_2combout;
	wire  [0:0]   wire_counter_comb_bita_3combout;
	wire  [0:0]   wire_counter_comb_bita_4combout;
	wire  [0:0]   wire_counter_comb_bita_5combout;
	wire  [0:0]   wire_counter_comb_bita_6combout;
	wire  [0:0]   wire_counter_comb_bita_7combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire  [0:0]   wire_counter_comb_bita_5cout;
	wire  [0:0]   wire_counter_comb_bita_6cout;
	wire	[7:0]	wire_counter_reg_bit_d;
	wire	[7:0]	wire_counter_reg_bit_asdata;
	reg	[7:0]	counter_reg_bit;
	wire	[7:0]	wire_counter_reg_bit_ena;
	wire	[7:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire  external_cin;
	wire  [7:0]  s_val;
	wire  [7:0]  safe_q;
	wire sclr;
	wire sset;
	wire  updown_dir;

	fiftyfivenm_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(wire_counter_comb_bita_2combout[0:0]),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.dataa(counter_reg_bit[2]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_2.lut_mask = 16'h5A90,
		counter_comb_bita_2.sum_lutc_input = "cin",
		counter_comb_bita_2.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(wire_counter_comb_bita_3combout[0:0]),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.dataa(counter_reg_bit[3]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_3.lut_mask = 16'h5A90,
		counter_comb_bita_3.sum_lutc_input = "cin",
		counter_comb_bita_3.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(wire_counter_comb_bita_4combout[0:0]),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.dataa(counter_reg_bit[4]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_4.lut_mask = 16'h5A90,
		counter_comb_bita_4.sum_lutc_input = "cin",
		counter_comb_bita_4.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(wire_counter_comb_bita_5combout[0:0]),
	.cout(wire_counter_comb_bita_5cout[0:0]),
	.dataa(counter_reg_bit[5]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_5.lut_mask = 16'h5A90,
		counter_comb_bita_5.sum_lutc_input = "cin",
		counter_comb_bita_5.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_6
	( 
	.cin(wire_counter_comb_bita_5cout[0:0]),
	.combout(wire_counter_comb_bita_6combout[0:0]),
	.cout(wire_counter_comb_bita_6cout[0:0]),
	.dataa(counter_reg_bit[6]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_6.lut_mask = 16'h5A90,
		counter_comb_bita_6.sum_lutc_input = "cin",
		counter_comb_bita_6.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_7
	( 
	.cin(wire_counter_comb_bita_6cout[0:0]),
	.combout(wire_counter_comb_bita_7combout[0:0]),
	.cout(),
	.dataa(counter_reg_bit[7]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_7.lut_mask = 16'h5A90,
		counter_comb_bita_7.sum_lutc_input = "cin",
		counter_comb_bita_7.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1) 
			if (wire_counter_reg_bit_sload[2:2] == 1'b1) counter_reg_bit[2:2] <= wire_counter_reg_bit_asdata[2:2];
			else  counter_reg_bit[2:2] <= wire_counter_reg_bit_d[2:2];
	// synopsys translate_off
	initial
		counter_reg_bit[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[3:3] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[3:3] == 1'b1) 
			if (wire_counter_reg_bit_sload[3:3] == 1'b1) counter_reg_bit[3:3] <= wire_counter_reg_bit_asdata[3:3];
			else  counter_reg_bit[3:3] <= wire_counter_reg_bit_d[3:3];
	// synopsys translate_off
	initial
		counter_reg_bit[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[4:4] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[4:4] == 1'b1) 
			if (wire_counter_reg_bit_sload[4:4] == 1'b1) counter_reg_bit[4:4] <= wire_counter_reg_bit_asdata[4:4];
			else  counter_reg_bit[4:4] <= wire_counter_reg_bit_d[4:4];
	// synopsys translate_off
	initial
		counter_reg_bit[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[5:5] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[5:5] == 1'b1) 
			if (wire_counter_reg_bit_sload[5:5] == 1'b1) counter_reg_bit[5:5] <= wire_counter_reg_bit_asdata[5:5];
			else  counter_reg_bit[5:5] <= wire_counter_reg_bit_d[5:5];
	// synopsys translate_off
	initial
		counter_reg_bit[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[6:6] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[6:6] == 1'b1) 
			if (wire_counter_reg_bit_sload[6:6] == 1'b1) counter_reg_bit[6:6] <= wire_counter_reg_bit_asdata[6:6];
			else  counter_reg_bit[6:6] <= wire_counter_reg_bit_d[6:6];
	// synopsys translate_off
	initial
		counter_reg_bit[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[7:7] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[7:7] == 1'b1) 
			if (wire_counter_reg_bit_sload[7:7] == 1'b1) counter_reg_bit[7:7] <= wire_counter_reg_bit_asdata[7:7];
			else  counter_reg_bit[7:7] <= wire_counter_reg_bit_d[7:7];
	assign
		wire_counter_reg_bit_asdata = ({8{(~ sclr)}} & (({8{sset}} & s_val) | ({8{(~ sset)}} & data))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_7combout[0:0], wire_counter_comb_bita_6combout[0:0], wire_counter_comb_bita_5combout[0:0], wire_counter_comb_bita_4combout[0:0], wire_counter_comb_bita_3combout[0:0], wire_counter_comb_bita_2combout[0:0], wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {8{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {8{((sclr | sset) | sload)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		external_cin = 1'b1,
		q = safe_q,
		s_val = {8{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b0;
endmodule //finalProject_i2s_mclk_reconfig_cntr_e0e


//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" lpm_direction="DOWN" lpm_port_updown="PORT_UNUSED" lpm_width=5 clock cnt_en data q sload
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 5 reg 5 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cntr_b0e
	( 
	clock,
	cnt_en,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	input   [4:0]  data;
	output   [4:0]  q;
	input   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
	tri0   [4:0]  data;
	tri0   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_2combout;
	wire  [0:0]   wire_counter_comb_bita_3combout;
	wire  [0:0]   wire_counter_comb_bita_4combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire	[4:0]	wire_counter_reg_bit_d;
	wire	[4:0]	wire_counter_reg_bit_asdata;
	reg	[4:0]	counter_reg_bit;
	wire	[4:0]	wire_counter_reg_bit_ena;
	wire	[4:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire  external_cin;
	wire  [4:0]  s_val;
	wire  [4:0]  safe_q;
	wire sclr;
	wire sset;
	wire  updown_dir;

	fiftyfivenm_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(wire_counter_comb_bita_2combout[0:0]),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.dataa(counter_reg_bit[2]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_2.lut_mask = 16'h5A90,
		counter_comb_bita_2.sum_lutc_input = "cin",
		counter_comb_bita_2.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(wire_counter_comb_bita_3combout[0:0]),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.dataa(counter_reg_bit[3]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_3.lut_mask = 16'h5A90,
		counter_comb_bita_3.sum_lutc_input = "cin",
		counter_comb_bita_3.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(wire_counter_comb_bita_4combout[0:0]),
	.cout(),
	.dataa(counter_reg_bit[4]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_4.lut_mask = 16'h5A90,
		counter_comb_bita_4.sum_lutc_input = "cin",
		counter_comb_bita_4.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1) 
			if (wire_counter_reg_bit_sload[2:2] == 1'b1) counter_reg_bit[2:2] <= wire_counter_reg_bit_asdata[2:2];
			else  counter_reg_bit[2:2] <= wire_counter_reg_bit_d[2:2];
	// synopsys translate_off
	initial
		counter_reg_bit[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[3:3] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[3:3] == 1'b1) 
			if (wire_counter_reg_bit_sload[3:3] == 1'b1) counter_reg_bit[3:3] <= wire_counter_reg_bit_asdata[3:3];
			else  counter_reg_bit[3:3] <= wire_counter_reg_bit_d[3:3];
	// synopsys translate_off
	initial
		counter_reg_bit[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[4:4] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[4:4] == 1'b1) 
			if (wire_counter_reg_bit_sload[4:4] == 1'b1) counter_reg_bit[4:4] <= wire_counter_reg_bit_asdata[4:4];
			else  counter_reg_bit[4:4] <= wire_counter_reg_bit_d[4:4];
	assign
		wire_counter_reg_bit_asdata = ({5{(~ sclr)}} & (({5{sset}} & s_val) | ({5{(~ sset)}} & data))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_4combout[0:0], wire_counter_comb_bita_3combout[0:0], wire_counter_comb_bita_2combout[0:0], wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {5{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {5{((sclr | sset) | sload)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		external_cin = 1'b1,
		q = safe_q,
		s_val = {5{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b0;
endmodule //finalProject_i2s_mclk_reconfig_cntr_b0e


//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" lpm_direction="UP" lpm_port_updown="PORT_UNUSED" lpm_width=8 clock cnt_en data q sload
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_counter 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 8 reg 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_cntr_rpd
	( 
	clock,
	cnt_en,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	input   [7:0]  data;
	output   [7:0]  q;
	input   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
	tri0   [7:0]  data;
	tri0   sload;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_counter_comb_bita_0combout;
	wire  [0:0]   wire_counter_comb_bita_1combout;
	wire  [0:0]   wire_counter_comb_bita_2combout;
	wire  [0:0]   wire_counter_comb_bita_3combout;
	wire  [0:0]   wire_counter_comb_bita_4combout;
	wire  [0:0]   wire_counter_comb_bita_5combout;
	wire  [0:0]   wire_counter_comb_bita_6combout;
	wire  [0:0]   wire_counter_comb_bita_7combout;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_4cout;
	wire  [0:0]   wire_counter_comb_bita_5cout;
	wire  [0:0]   wire_counter_comb_bita_6cout;
	wire	[7:0]	wire_counter_reg_bit_d;
	wire	[7:0]	wire_counter_reg_bit_asdata;
	reg	[7:0]	counter_reg_bit;
	wire	[7:0]	wire_counter_reg_bit_ena;
	wire	[7:0]	wire_counter_reg_bit_sload;
	wire  aclr_actual;
	wire clk_en;
	wire  external_cin;
	wire  [7:0]  s_val;
	wire  [7:0]  safe_q;
	wire sclr;
	wire sset;
	wire  updown_dir;

	fiftyfivenm_lcell_comb   counter_comb_bita_0
	( 
	.cin(external_cin),
	.combout(wire_counter_comb_bita_0combout[0:0]),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.dataa(counter_reg_bit[0]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_0.lut_mask = 16'h5A90,
		counter_comb_bita_0.sum_lutc_input = "cin",
		counter_comb_bita_0.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(wire_counter_comb_bita_1combout[0:0]),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.dataa(counter_reg_bit[1]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_1.lut_mask = 16'h5A90,
		counter_comb_bita_1.sum_lutc_input = "cin",
		counter_comb_bita_1.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(wire_counter_comb_bita_2combout[0:0]),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.dataa(counter_reg_bit[2]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_2.lut_mask = 16'h5A90,
		counter_comb_bita_2.sum_lutc_input = "cin",
		counter_comb_bita_2.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(wire_counter_comb_bita_3combout[0:0]),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.dataa(counter_reg_bit[3]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_3.lut_mask = 16'h5A90,
		counter_comb_bita_3.sum_lutc_input = "cin",
		counter_comb_bita_3.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_4
	( 
	.cin(wire_counter_comb_bita_3cout[0:0]),
	.combout(wire_counter_comb_bita_4combout[0:0]),
	.cout(wire_counter_comb_bita_4cout[0:0]),
	.dataa(counter_reg_bit[4]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_4.lut_mask = 16'h5A90,
		counter_comb_bita_4.sum_lutc_input = "cin",
		counter_comb_bita_4.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_5
	( 
	.cin(wire_counter_comb_bita_4cout[0:0]),
	.combout(wire_counter_comb_bita_5combout[0:0]),
	.cout(wire_counter_comb_bita_5cout[0:0]),
	.dataa(counter_reg_bit[5]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_5.lut_mask = 16'h5A90,
		counter_comb_bita_5.sum_lutc_input = "cin",
		counter_comb_bita_5.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_6
	( 
	.cin(wire_counter_comb_bita_5cout[0:0]),
	.combout(wire_counter_comb_bita_6combout[0:0]),
	.cout(wire_counter_comb_bita_6cout[0:0]),
	.dataa(counter_reg_bit[6]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_6.lut_mask = 16'h5A90,
		counter_comb_bita_6.sum_lutc_input = "cin",
		counter_comb_bita_6.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   counter_comb_bita_7
	( 
	.cin(wire_counter_comb_bita_6cout[0:0]),
	.combout(wire_counter_comb_bita_7combout[0:0]),
	.cout(),
	.dataa(counter_reg_bit[7]),
	.datab(updown_dir),
	.datad(1'b1),
	.datac(1'b0)
	);
	defparam
		counter_comb_bita_7.lut_mask = 16'h5A90,
		counter_comb_bita_7.sum_lutc_input = "cin",
		counter_comb_bita_7.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1) 
			if (wire_counter_reg_bit_sload[0:0] == 1'b1) counter_reg_bit[0:0] <= wire_counter_reg_bit_asdata[0:0];
			else  counter_reg_bit[0:0] <= wire_counter_reg_bit_d[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1) 
			if (wire_counter_reg_bit_sload[1:1] == 1'b1) counter_reg_bit[1:1] <= wire_counter_reg_bit_asdata[1:1];
			else  counter_reg_bit[1:1] <= wire_counter_reg_bit_d[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1) 
			if (wire_counter_reg_bit_sload[2:2] == 1'b1) counter_reg_bit[2:2] <= wire_counter_reg_bit_asdata[2:2];
			else  counter_reg_bit[2:2] <= wire_counter_reg_bit_d[2:2];
	// synopsys translate_off
	initial
		counter_reg_bit[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[3:3] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[3:3] == 1'b1) 
			if (wire_counter_reg_bit_sload[3:3] == 1'b1) counter_reg_bit[3:3] <= wire_counter_reg_bit_asdata[3:3];
			else  counter_reg_bit[3:3] <= wire_counter_reg_bit_d[3:3];
	// synopsys translate_off
	initial
		counter_reg_bit[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[4:4] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[4:4] == 1'b1) 
			if (wire_counter_reg_bit_sload[4:4] == 1'b1) counter_reg_bit[4:4] <= wire_counter_reg_bit_asdata[4:4];
			else  counter_reg_bit[4:4] <= wire_counter_reg_bit_d[4:4];
	// synopsys translate_off
	initial
		counter_reg_bit[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[5:5] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[5:5] == 1'b1) 
			if (wire_counter_reg_bit_sload[5:5] == 1'b1) counter_reg_bit[5:5] <= wire_counter_reg_bit_asdata[5:5];
			else  counter_reg_bit[5:5] <= wire_counter_reg_bit_d[5:5];
	// synopsys translate_off
	initial
		counter_reg_bit[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[6:6] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[6:6] == 1'b1) 
			if (wire_counter_reg_bit_sload[6:6] == 1'b1) counter_reg_bit[6:6] <= wire_counter_reg_bit_asdata[6:6];
			else  counter_reg_bit[6:6] <= wire_counter_reg_bit_d[6:6];
	// synopsys translate_off
	initial
		counter_reg_bit[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[7:7] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[7:7] == 1'b1) 
			if (wire_counter_reg_bit_sload[7:7] == 1'b1) counter_reg_bit[7:7] <= wire_counter_reg_bit_asdata[7:7];
			else  counter_reg_bit[7:7] <= wire_counter_reg_bit_d[7:7];
	assign
		wire_counter_reg_bit_asdata = ({8{(~ sclr)}} & (({8{sset}} & s_val) | ({8{(~ sset)}} & data))),
		wire_counter_reg_bit_d = {wire_counter_comb_bita_7combout[0:0], wire_counter_comb_bita_6combout[0:0], wire_counter_comb_bita_5combout[0:0], wire_counter_comb_bita_4combout[0:0], wire_counter_comb_bita_3combout[0:0], wire_counter_comb_bita_2combout[0:0], wire_counter_comb_bita_1combout[0:0], wire_counter_comb_bita_0combout[0:0]};
	assign
		wire_counter_reg_bit_ena = {8{(clk_en & (((sclr | sset) | sload) | cnt_en))}},
		wire_counter_reg_bit_sload = {8{((sclr | sset) | sload)}};
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		external_cin = 1'b1,
		q = safe_q,
		s_val = {8{1'b1}},
		safe_q = counter_reg_bit,
		sclr = 1'b0,
		sset = 1'b0,
		updown_dir = 1'b1;
endmodule //finalProject_i2s_mclk_reconfig_cntr_rpd


//lpm_decode CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX10" LPM_DECODES=5 LPM_WIDTH=3 data eq
//VERSION_BEGIN 20.1 cbx_cycloneii 2020:06:05:12:04:51:SJ cbx_lpm_add_sub 2020:06:05:12:04:51:SJ cbx_lpm_compare 2020:06:05:12:04:51:SJ cbx_lpm_decode 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ cbx_nadder 2020:06:05:12:04:51:SJ cbx_stratix 2020:06:05:12:04:51:SJ cbx_stratixii 2020:06:05:12:04:51:SJ  VERSION_END

//synthesis_resources = lut 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig_decode_9j8
	( 
	data,
	eq) /* synthesis synthesis_clearbox=1 */;
	input   [2:0]  data;
	output   [4:0]  eq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [2:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [2:0]  data_wire;
	wire  [4:0]  eq_node;
	wire  [7:0]  eq_wire;
	wire  [3:0]  w_anode2251w;
	wire  [3:0]  w_anode2269w;
	wire  [3:0]  w_anode2280w;
	wire  [3:0]  w_anode2291w;
	wire  [3:0]  w_anode2302w;
	wire  [3:0]  w_anode2313w;
	wire  [3:0]  w_anode2324w;
	wire  [3:0]  w_anode2335w;

	assign
		data_wire = data,
		eq = eq_node,
		eq_node = eq_wire[4:0],
		eq_wire = {w_anode2335w[3], w_anode2324w[3], w_anode2313w[3], w_anode2302w[3], w_anode2291w[3], w_anode2280w[3], w_anode2269w[3], w_anode2251w[3]},
		w_anode2251w = {(w_anode2251w[2] & (~ data_wire[2])), (w_anode2251w[1] & (~ data_wire[1])), (w_anode2251w[0] & (~ data_wire[0])), 1'b1},
		w_anode2269w = {(w_anode2269w[2] & (~ data_wire[2])), (w_anode2269w[1] & (~ data_wire[1])), (w_anode2269w[0] & data_wire[0]), 1'b1},
		w_anode2280w = {(w_anode2280w[2] & (~ data_wire[2])), (w_anode2280w[1] & data_wire[1]), (w_anode2280w[0] & (~ data_wire[0])), 1'b1},
		w_anode2291w = {(w_anode2291w[2] & (~ data_wire[2])), (w_anode2291w[1] & data_wire[1]), (w_anode2291w[0] & data_wire[0]), 1'b1},
		w_anode2302w = {(w_anode2302w[2] & data_wire[2]), (w_anode2302w[1] & (~ data_wire[1])), (w_anode2302w[0] & (~ data_wire[0])), 1'b1},
		w_anode2313w = {(w_anode2313w[2] & data_wire[2]), (w_anode2313w[1] & (~ data_wire[1])), (w_anode2313w[0] & data_wire[0]), 1'b1},
		w_anode2324w = {(w_anode2324w[2] & data_wire[2]), (w_anode2324w[1] & data_wire[1]), (w_anode2324w[0] & (~ data_wire[0])), 1'b1},
		w_anode2335w = {(w_anode2335w[2] & data_wire[2]), (w_anode2335w[1] & data_wire[1]), (w_anode2335w[0] & data_wire[0]), 1'b1};
endmodule //finalProject_i2s_mclk_reconfig_decode_9j8

//synthesis_resources = lut 84 M9K 1 reg 158 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ADV_NETLIST_OPT_ALLOWED=\"NEVER_ALLOW\";suppress_da_rule_internal=C106;{-to le_comb10} PLL_SCAN_RECONFIG_COUNTER_REMAP_LCELL=1;{-to le_comb11} PLL_SCAN_RECONFIG_COUNTER_REMAP_LCELL=2;{-to le_comb9} PLL_SCAN_RECONFIG_COUNTER_REMAP_LCELL=0"} *)
module  finalProject_i2s_mclk_reconfig_pllrcfg_5601
	( 
	busy,
	clock,
	counter_param,
	counter_type,
	data_in,
	data_out,
	pll_areset,
	pll_areset_in,
	pll_configupdate,
	pll_scanclk,
	pll_scanclkena,
	pll_scandata,
	pll_scandataout,
	pll_scandone,
	read_param,
	reconfig,
	reset,
	rom_address_out,
	write_from_rom,
	write_param,
	write_rom_ena) /* synthesis synthesis_clearbox=1 */;
	output   busy;
	input   clock;
	input   [2:0]  counter_param;
	input   [3:0]  counter_type;
	input   [8:0]  data_in;
	output   [8:0]  data_out;
	output   pll_areset;
	input   pll_areset_in;
	output   pll_configupdate;
	output   pll_scanclk;
	output   pll_scanclkena;
	output   pll_scandata;
	input   pll_scandataout;
	input   pll_scandone;
	input   read_param;
	input   reconfig;
	input   reset;
	output   [7:0]  rom_address_out;
	input   write_from_rom;
	input   write_param;
	output   write_rom_ena;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [2:0]  counter_param;
	tri0   [3:0]  counter_type;
	tri0   [8:0]  data_in;
	tri0   pll_areset_in;
	tri0   pll_scandataout;
	tri0   pll_scandone;
	tri0   read_param;
	tri0   reconfig;
	tri0   write_from_rom;
	tri0   write_param;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_altsyncram5_q_a;
	wire  wire_le_comb10_combout;
	wire  wire_le_comb11_combout;
	wire  wire_le_comb9_combout;
	reg	[7:0]	addr_from_rom;
	reg	[7:0]	addr_from_rom2;
	reg	areset_init_state_1;
	reg	areset_state;
	reg	C0_data_state;
	reg	C0_ena_state;
	reg	C1_data_state;
	reg	C1_ena_state;
	reg	C2_data_state;
	reg	C2_ena_state;
	reg	C3_data_state;
	reg	C3_ena_state;
	reg	C4_data_state;
	reg	C4_ena_state;
	reg	configupdate2_state;
	reg	configupdate3_state;
	reg	configupdate_state;
	reg	[2:0]	counter_param_latch_reg;
	reg	[3:0]	counter_type_latch_reg;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	idle_state;
	reg	[0:0]	nominal_data0;
	reg	[0:0]	nominal_data1;
	reg	[0:0]	nominal_data2;
	reg	[0:0]	nominal_data3;
	reg	[0:0]	nominal_data4;
	reg	[0:0]	nominal_data5;
	reg	[0:0]	nominal_data6;
	reg	[0:0]	nominal_data7;
	reg	[0:0]	nominal_data8;
	reg	[0:0]	nominal_data9;
	reg	[0:0]	nominal_data10;
	reg	[0:0]	nominal_data11;
	reg	[0:0]	nominal_data12;
	reg	[0:0]	nominal_data13;
	reg	[0:0]	nominal_data14;
	reg	[0:0]	nominal_data15;
	reg	[0:0]	nominal_data16;
	reg	[0:0]	nominal_data17;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_data_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_first_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_first_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_init_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_last_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	read_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_counter_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_post_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_seq_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_seq_ena_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	reconfig_wait_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	reset_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_first_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_second_last_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	rom_second_state;
	reg	[0:0]	shift_reg0;
	reg	[0:0]	shift_reg1;
	reg	[0:0]	shift_reg2;
	reg	[0:0]	shift_reg3;
	reg	[0:0]	shift_reg4;
	reg	[0:0]	shift_reg5;
	reg	[0:0]	shift_reg6;
	reg	[0:0]	shift_reg7;
	reg	[0:0]	shift_reg8;
	reg	[0:0]	shift_reg9;
	reg	[0:0]	shift_reg10;
	reg	[0:0]	shift_reg11;
	reg	[0:0]	shift_reg12;
	reg	[0:0]	shift_reg13;
	reg	[0:0]	shift_reg14;
	reg	[0:0]	shift_reg15;
	reg	[0:0]	shift_reg16;
	reg	[0:0]	shift_reg17;
	wire	[17:0]	wire_shift_reg_ena;
	reg	tmp_nominal_data_out_state;
	reg	tmp_seq_ena_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_data_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_init_nominal_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_init_state;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=LOW"} *)
	reg	write_nominal_state;
	wire	[9:0]	wire_add_sub6_result_int;
	wire	wire_add_sub6_cin;
	wire	[8:0]	wire_add_sub6_dataa;
	wire	[8:0]	wire_add_sub6_datab;
	wire	[8:0]	wire_add_sub6_result;
	wire	[8:0]	wire_add_sub7_result_int;
	wire	wire_add_sub7_cin;
	wire	[7:0]	wire_add_sub7_dataa;
	wire	[7:0]	wire_add_sub7_result;
	wire  wire_cmpr8_aeb;
	wire  [7:0]   wire_cntr13_q;
	wire  [5:0]   wire_cntr14_q;
	wire  [7:0]   wire_cntr15_q;
	wire  [4:0]   wire_cntr16_q;
	wire  [7:0]   wire_cntr17_q;
	wire  [7:0]   wire_cntr2_q;
	wire  [7:0]   wire_cntr3_q;
	wire  [4:0]   wire_cntr4_q;
	wire  [4:0]   wire_decode12_eq;
	wire  addr_counter_enable;
	wire  [7:0]  addr_counter_out;
	wire  addr_counter_sload;
	wire  [7:0]  addr_counter_sload_value;
	wire  [7:0]  addr_decoder_out;
	wire  [7:0]  c0_wire;
	wire  [7:0]  c1_wire;
	wire  [7:0]  c2_wire;
	wire  [7:0]  c3_wire;
	wire  [7:0]  c4_wire;
	wire  [7:0]  const_scan_chain_size;
	wire  [2:0]  counter_param_latch;
	wire  [3:0]  counter_type_latch;
	wire  [2:0]  cuda_combout_wire;
	wire  dummy_scandataout;
	wire  [2:0]  encode_out;
	wire  input_latch_enable;
	wire  power_up;
	wire  read_addr_counter_done;
	wire  read_addr_counter_enable;
	wire  [7:0]  read_addr_counter_out;
	wire  read_addr_counter_sload;
	wire  [7:0]  read_addr_counter_sload_value;
	wire  [7:0]  read_addr_decoder_out;
	wire  read_nominal_out;
	wire  reconfig_addr_counter_enable;
	wire  [7:0]  reconfig_addr_counter_out;
	wire  reconfig_addr_counter_sload;
	wire  [7:0]  reconfig_addr_counter_sload_value;
	wire  reconfig_done;
	wire  reconfig_post_done;
	wire  reconfig_width_counter_done;
	wire  reconfig_width_counter_enable;
	wire  reconfig_width_counter_sload;
	wire  [5:0]  reconfig_width_counter_sload_value;
	wire reset_rom_address;
	wire rom_data_in;
	wire  rom_width_counter_done;
	wire  rom_width_counter_enable;
	wire  rom_width_counter_sload;
	wire  [7:0]  rom_width_counter_sload_value;
	wire  rotate_addr_counter_enable;
	wire  [7:0]  rotate_addr_counter_out;
	wire  rotate_addr_counter_sload;
	wire  [7:0]  rotate_addr_counter_sload_value;
	wire  [4:0]  rotate_decoder_wires;
	wire  rotate_width_counter_done;
	wire  rotate_width_counter_enable;
	wire  rotate_width_counter_sload;
	wire  [4:0]  rotate_width_counter_sload_value;
	wire  [7:0]  scan_cache_address;
	wire  scan_cache_in;
	wire  scan_cache_out;
	wire  scan_cache_write_enable;
	wire  sel_param_bypass_LF_unused;
	wire  sel_param_c;
	wire  sel_param_high_i_postscale;
	wire  sel_param_low_r;
	wire  sel_param_nominal_count;
	wire  sel_param_odd_CP_unused;
	wire  sel_type_c0;
	wire  sel_type_c1;
	wire  sel_type_c2;
	wire  sel_type_c3;
	wire  sel_type_c4;
	wire  sel_type_cplf;
	wire  sel_type_m;
	wire  sel_type_n;
	wire  sel_type_vco;
	wire  [7:0]  seq_addr_wire;
	wire  [5:0]  seq_sload_value;
	wire  shift_reg_clear;
	wire  shift_reg_load_enable;
	wire  shift_reg_load_nominal_enable;
	wire  shift_reg_serial_in;
	wire  shift_reg_serial_out;
	wire  shift_reg_shift_enable;
	wire  shift_reg_shift_nominal_enable;
	wire  [7:0]  shift_reg_width_select;
	wire  w1565w;
	wire  w1592w;
	wire  w64w;
	wire  width_counter_done;
	wire  width_counter_enable;
	wire  width_counter_sload;
	wire  [4:0]  width_counter_sload_value;
	wire  [4:0]  width_decoder_out;
	wire  [7:0]  width_decoder_select;

	finalProject_i2s_mclk_reconfig_altsyncram_pdg   altsyncram5
	( 
	.address_a(scan_cache_address),
	.clock0(clock),
	.data_a({scan_cache_in}),
	.q_a(wire_altsyncram5_q_a),
	.wren_a(scan_cache_write_enable));
	fiftyfivenm_lcell_comb   le_comb10
	( 
	.combout(wire_le_comb10_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb10.dont_touch = "on",
		le_comb10.lut_mask = 16'hCCCC,
		le_comb10.sum_lutc_input = "datac",
		le_comb10.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   le_comb11
	( 
	.combout(wire_le_comb11_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb11.dont_touch = "on",
		le_comb11.lut_mask = 16'hF0F0,
		le_comb11.sum_lutc_input = "datac",
		le_comb11.lpm_type = "fiftyfivenm_lcell_comb";
	fiftyfivenm_lcell_comb   le_comb9
	( 
	.combout(wire_le_comb9_combout),
	.cout(),
	.dataa(encode_out[0]),
	.datab(encode_out[1]),
	.datac(encode_out[2]),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb9.dont_touch = "on",
		le_comb9.lut_mask = 16'hAAAA,
		le_comb9.sum_lutc_input = "datac",
		le_comb9.lpm_type = "fiftyfivenm_lcell_comb";
	// synopsys translate_off
	initial
		addr_from_rom = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  addr_from_rom <= read_addr_counter_out;
	// synopsys translate_off
	initial
		addr_from_rom2 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  addr_from_rom2 <= addr_from_rom;
	// synopsys translate_off
	initial
		areset_init_state_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  areset_init_state_1 <= pll_scandone;
	// synopsys translate_off
	initial
		areset_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  areset_state <= (areset_init_state_1 & (~ reset));
	// synopsys translate_off
	initial
		C0_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C0_data_state <= (C0_ena_state | (C0_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C0_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C0_ena_state <= (C1_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C1_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C1_data_state <= (C1_ena_state | (C1_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C1_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C1_ena_state <= (C2_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C2_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C2_data_state <= (C2_ena_state | (C2_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C2_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C2_ena_state <= (C3_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C3_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C3_data_state <= (C3_ena_state | (C3_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C3_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C3_ena_state <= (C4_data_state & rotate_width_counter_done);
	// synopsys translate_off
	initial
		C4_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C4_data_state <= (C4_ena_state | (C4_data_state & (~ rotate_width_counter_done)));
	// synopsys translate_off
	initial
		C4_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  C4_ena_state <= reconfig_init_state;
	// synopsys translate_off
	initial
		configupdate2_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  configupdate2_state <= configupdate_state;
	// synopsys translate_off
	initial
		configupdate3_state = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  configupdate3_state <= configupdate2_state;
	// synopsys translate_off
	initial
		configupdate_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  configupdate_state <= reconfig_post_state;
	// synopsys translate_off
	initial
		counter_param_latch_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) counter_param_latch_reg <= 3'b0;
		else if  (input_latch_enable == 1'b1)   counter_param_latch_reg <= counter_param;
	// synopsys translate_off
	initial
		counter_type_latch_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) counter_type_latch_reg <= 4'b0;
		else if  (input_latch_enable == 1'b1)   counter_type_latch_reg <= counter_type;
	// synopsys translate_off
	initial
		idle_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) idle_state <= 1'b0;
		else  idle_state <= (((((((((((((idle_state & (~ read_param)) & (~ write_param)) & (~ reconfig)) & (~ write_from_rom)) | read_last_state) | (write_data_state & width_counter_done)) | (write_nominal_state & width_counter_done)) | read_last_nominal_state) | (reconfig_wait_state & reconfig_done)) | ((rom_data_state & rom_width_counter_done) & (~ reset_rom_address))) | (rom_second_last_state & (~ reset_rom_address))) | (rom_last_state & (~ reset_rom_address))) | reset_state);
	// synopsys translate_off
	initial
		nominal_data0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data0 <= 1'b0;
		else  nominal_data0 <= wire_add_sub7_result[0];
	// synopsys translate_off
	initial
		nominal_data1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data1 <= 1'b0;
		else  nominal_data1 <= wire_add_sub7_result[1];
	// synopsys translate_off
	initial
		nominal_data2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data2 <= 1'b0;
		else  nominal_data2 <= wire_add_sub7_result[2];
	// synopsys translate_off
	initial
		nominal_data3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data3 <= 1'b0;
		else  nominal_data3 <= wire_add_sub7_result[3];
	// synopsys translate_off
	initial
		nominal_data4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data4 <= 1'b0;
		else  nominal_data4 <= wire_add_sub7_result[4];
	// synopsys translate_off
	initial
		nominal_data5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data5 <= 1'b0;
		else  nominal_data5 <= wire_add_sub7_result[5];
	// synopsys translate_off
	initial
		nominal_data6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data6 <= 1'b0;
		else  nominal_data6 <= wire_add_sub7_result[6];
	// synopsys translate_off
	initial
		nominal_data7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data7 <= 1'b0;
		else  nominal_data7 <= wire_add_sub7_result[7];
	// synopsys translate_off
	initial
		nominal_data8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data8 <= 1'b0;
		else  nominal_data8 <= data_in[0];
	// synopsys translate_off
	initial
		nominal_data9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data9 <= 1'b0;
		else  nominal_data9 <= data_in[1];
	// synopsys translate_off
	initial
		nominal_data10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data10 <= 1'b0;
		else  nominal_data10 <= data_in[2];
	// synopsys translate_off
	initial
		nominal_data11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data11 <= 1'b0;
		else  nominal_data11 <= data_in[3];
	// synopsys translate_off
	initial
		nominal_data12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data12 <= 1'b0;
		else  nominal_data12 <= data_in[4];
	// synopsys translate_off
	initial
		nominal_data13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data13 <= 1'b0;
		else  nominal_data13 <= data_in[5];
	// synopsys translate_off
	initial
		nominal_data14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data14 <= 1'b0;
		else  nominal_data14 <= data_in[6];
	// synopsys translate_off
	initial
		nominal_data15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data15 <= 1'b0;
		else  nominal_data15 <= data_in[7];
	// synopsys translate_off
	initial
		nominal_data16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data16 <= 1'b0;
		else  nominal_data16 <= data_in[8];
	// synopsys translate_off
	initial
		nominal_data17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) nominal_data17 <= 1'b0;
		else  nominal_data17 <= wire_cmpr8_aeb;
	// synopsys translate_off
	initial
		read_data_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_data_nominal_state <= 1'b0;
		else  read_data_nominal_state <= ((read_first_nominal_state & (~ width_counter_done)) | (read_data_nominal_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		read_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_data_state <= 1'b0;
		else  read_data_state <= ((read_first_state & (~ width_counter_done)) | (read_data_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		read_first_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_first_nominal_state <= 1'b0;
		else  read_first_nominal_state <= read_init_nominal_state;
	// synopsys translate_off
	initial
		read_first_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_first_state <= 1'b0;
		else  read_first_state <= read_init_state;
	// synopsys translate_off
	initial
		read_init_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_init_nominal_state <= 1'b0;
		else  read_init_nominal_state <= ((idle_state & read_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]));
	// synopsys translate_off
	initial
		read_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_init_state <= 1'b0;
		else  read_init_state <= ((idle_state & read_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])));
	// synopsys translate_off
	initial
		read_last_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_last_nominal_state <= 1'b0;
		else  read_last_nominal_state <= ((read_first_nominal_state & width_counter_done) | (read_data_nominal_state & width_counter_done));
	// synopsys translate_off
	initial
		read_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) read_last_state <= 1'b0;
		else  read_last_state <= ((read_first_state & width_counter_done) | (read_data_state & width_counter_done));
	// synopsys translate_off
	initial
		reconfig_counter_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_counter_state <= 1'b0;
		else  reconfig_counter_state <= ((((((((((reconfig_init_state | C0_data_state) | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state) | C0_ena_state) | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state);
	// synopsys translate_off
	initial
		reconfig_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_init_state <= 1'b0;
		else  reconfig_init_state <= (idle_state & reconfig);
	// synopsys translate_off
	initial
		reconfig_post_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_post_state <= 1'b0;
		else  reconfig_post_state <= ((reconfig_seq_data_state & reconfig_width_counter_done) | (reconfig_post_state & (~ reconfig_post_done)));
	// synopsys translate_off
	initial
		reconfig_seq_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_seq_data_state <= 1'b0;
		else  reconfig_seq_data_state <= (reconfig_seq_ena_state | (reconfig_seq_data_state & (~ reconfig_width_counter_done)));
	// synopsys translate_off
	initial
		reconfig_seq_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_seq_ena_state <= 1'b0;
		else  reconfig_seq_ena_state <= tmp_seq_ena_state;
	// synopsys translate_off
	initial
		reconfig_wait_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reconfig_wait_state <= 1'b0;
		else  reconfig_wait_state <= ((reconfig_post_state & reconfig_post_done) | (reconfig_wait_state & (~ reconfig_done)));
	// synopsys translate_off
	initial
		reset_state = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) reset_state <= {1{1'b1}};
		else  reset_state <= power_up;
	// synopsys translate_off
	initial
		rom_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_data_state <= 1'b0;
		else  rom_data_state <= (rom_second_state | ((rom_data_state & (~ read_addr_counter_done)) & (~ reset_rom_address)));
	// synopsys translate_off
	initial
		rom_first_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_first_state <= 1'b0;
		else  rom_first_state <= rom_init_state;
	// synopsys translate_off
	initial
		rom_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_init_state <= 1'b0;
		else  rom_init_state <= (((((idle_state & write_from_rom) | (rom_first_state & reset_rom_address)) | (rom_second_state & reset_rom_address)) | (rom_data_state & reset_rom_address)) | (rom_second_last_state & reset_rom_address));
	// synopsys translate_off
	initial
		rom_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_last_state <= 1'b0;
		else  rom_last_state <= (rom_second_last_state & (~ reset_rom_address));
	// synopsys translate_off
	initial
		rom_second_last_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_second_last_state <= 1'b0;
		else  rom_second_last_state <= ((rom_data_state & read_addr_counter_done) & (~ reset_rom_address));
	// synopsys translate_off
	initial
		rom_second_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) rom_second_state <= 1'b0;
		else  rom_second_state <= (rom_first_state & (~ reset_rom_address));
	// synopsys translate_off
	initial
		shift_reg0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg0 <= 1'b0;
		else if  (wire_shift_reg_ena[0:0] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg0 <= 1'b0;
			else  shift_reg0 <= ((((shift_reg_load_nominal_enable & nominal_data17[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg_serial_in)) | (shift_reg_shift_nominal_enable & shift_reg_serial_in));
	// synopsys translate_off
	initial
		shift_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg1 <= 1'b0;
		else if  (wire_shift_reg_ena[1:1] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg1 <= 1'b0;
			else  shift_reg1 <= ((((shift_reg_load_nominal_enable & nominal_data16[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg0[0:0])) | (shift_reg_shift_nominal_enable & shift_reg0[0:0]));
	// synopsys translate_off
	initial
		shift_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg2 <= 1'b0;
		else if  (wire_shift_reg_ena[2:2] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg2 <= 1'b0;
			else  shift_reg2 <= ((((shift_reg_load_nominal_enable & nominal_data15[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg1[0:0])) | (shift_reg_shift_nominal_enable & shift_reg1[0:0]));
	// synopsys translate_off
	initial
		shift_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg3 <= 1'b0;
		else if  (wire_shift_reg_ena[3:3] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg3 <= 1'b0;
			else  shift_reg3 <= ((((shift_reg_load_nominal_enable & nominal_data14[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg2[0:0])) | (shift_reg_shift_nominal_enable & shift_reg2[0:0]));
	// synopsys translate_off
	initial
		shift_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg4 <= 1'b0;
		else if  (wire_shift_reg_ena[4:4] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg4 <= 1'b0;
			else  shift_reg4 <= ((((shift_reg_load_nominal_enable & nominal_data13[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg3[0:0])) | (shift_reg_shift_nominal_enable & shift_reg3[0:0]));
	// synopsys translate_off
	initial
		shift_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg5 <= 1'b0;
		else if  (wire_shift_reg_ena[5:5] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg5 <= 1'b0;
			else  shift_reg5 <= ((((shift_reg_load_nominal_enable & nominal_data12[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg4[0:0])) | (shift_reg_shift_nominal_enable & shift_reg4[0:0]));
	// synopsys translate_off
	initial
		shift_reg6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg6 <= 1'b0;
		else if  (wire_shift_reg_ena[6:6] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg6 <= 1'b0;
			else  shift_reg6 <= ((((shift_reg_load_nominal_enable & nominal_data11[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg5[0:0])) | (shift_reg_shift_nominal_enable & shift_reg5[0:0]));
	// synopsys translate_off
	initial
		shift_reg7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg7 <= 1'b0;
		else if  (wire_shift_reg_ena[7:7] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg7 <= 1'b0;
			else  shift_reg7 <= ((((shift_reg_load_nominal_enable & nominal_data10[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg6[0:0])) | (shift_reg_shift_nominal_enable & shift_reg6[0:0]));
	// synopsys translate_off
	initial
		shift_reg8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg8 <= 1'b0;
		else if  (wire_shift_reg_ena[8:8] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg8 <= 1'b0;
			else  shift_reg8 <= ((((shift_reg_load_nominal_enable & nominal_data9[0:0]) | (shift_reg_load_enable & w64w)) | (shift_reg_shift_enable & shift_reg7[0:0])) | (shift_reg_shift_nominal_enable & shift_reg7[0:0]));
	// synopsys translate_off
	initial
		shift_reg9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg9 <= 1'b0;
		else if  (wire_shift_reg_ena[9:9] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg9 <= 1'b0;
			else  shift_reg9 <= ((((shift_reg_load_nominal_enable & nominal_data8[0:0]) | (shift_reg_load_enable & data_in[8])) | (shift_reg_shift_enable & shift_reg8[0:0])) | (shift_reg_shift_nominal_enable & shift_reg8[0:0]));
	// synopsys translate_off
	initial
		shift_reg10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg10 <= 1'b0;
		else if  (wire_shift_reg_ena[10:10] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg10 <= 1'b0;
			else  shift_reg10 <= ((((shift_reg_load_nominal_enable & nominal_data7[0:0]) | (shift_reg_load_enable & data_in[7])) | (shift_reg_shift_enable & shift_reg9[0:0])) | (shift_reg_shift_nominal_enable & shift_reg9[0:0]));
	// synopsys translate_off
	initial
		shift_reg11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg11 <= 1'b0;
		else if  (wire_shift_reg_ena[11:11] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg11 <= 1'b0;
			else  shift_reg11 <= ((((shift_reg_load_nominal_enable & nominal_data6[0:0]) | (shift_reg_load_enable & data_in[6])) | (shift_reg_shift_enable & shift_reg10[0:0])) | (shift_reg_shift_nominal_enable & shift_reg10[0:0]));
	// synopsys translate_off
	initial
		shift_reg12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg12 <= 1'b0;
		else if  (wire_shift_reg_ena[12:12] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg12 <= 1'b0;
			else  shift_reg12 <= ((((shift_reg_load_nominal_enable & nominal_data5[0:0]) | (shift_reg_load_enable & data_in[5])) | (shift_reg_shift_enable & shift_reg11[0:0])) | (shift_reg_shift_nominal_enable & shift_reg11[0:0]));
	// synopsys translate_off
	initial
		shift_reg13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg13 <= 1'b0;
		else if  (wire_shift_reg_ena[13:13] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg13 <= 1'b0;
			else  shift_reg13 <= ((((shift_reg_load_nominal_enable & nominal_data4[0:0]) | (shift_reg_load_enable & data_in[4])) | (shift_reg_shift_enable & shift_reg12[0:0])) | (shift_reg_shift_nominal_enable & shift_reg12[0:0]));
	// synopsys translate_off
	initial
		shift_reg14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg14 <= 1'b0;
		else if  (wire_shift_reg_ena[14:14] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg14 <= 1'b0;
			else  shift_reg14 <= ((((shift_reg_load_nominal_enable & nominal_data3[0:0]) | (shift_reg_load_enable & data_in[3])) | (shift_reg_shift_enable & shift_reg13[0:0])) | (shift_reg_shift_nominal_enable & shift_reg13[0:0]));
	// synopsys translate_off
	initial
		shift_reg15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg15 <= 1'b0;
		else if  (wire_shift_reg_ena[15:15] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg15 <= 1'b0;
			else  shift_reg15 <= ((((shift_reg_load_nominal_enable & nominal_data2[0:0]) | (shift_reg_load_enable & data_in[2])) | (shift_reg_shift_enable & shift_reg14[0:0])) | (shift_reg_shift_nominal_enable & shift_reg14[0:0]));
	// synopsys translate_off
	initial
		shift_reg16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg16 <= 1'b0;
		else if  (wire_shift_reg_ena[16:16] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg16 <= 1'b0;
			else  shift_reg16 <= ((((shift_reg_load_nominal_enable & nominal_data1[0:0]) | (shift_reg_load_enable & data_in[1])) | (shift_reg_shift_enable & shift_reg15[0:0])) | (shift_reg_shift_nominal_enable & shift_reg15[0:0]));
	// synopsys translate_off
	initial
		shift_reg17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) shift_reg17 <= 1'b0;
		else if  (wire_shift_reg_ena[17:17] == 1'b1) 
			if (shift_reg_clear == 1'b1) shift_reg17 <= 1'b0;
			else  shift_reg17 <= ((((shift_reg_load_nominal_enable & nominal_data0[0:0]) | (shift_reg_load_enable & data_in[0])) | (shift_reg_shift_enable & shift_reg16[0:0])) | (shift_reg_shift_nominal_enable & shift_reg16[0:0]));
	assign
		wire_shift_reg_ena = {18{((((shift_reg_load_enable | shift_reg_shift_enable) | shift_reg_load_nominal_enable) | shift_reg_shift_nominal_enable) | shift_reg_clear)}};
	// synopsys translate_off
	initial
		tmp_nominal_data_out_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  tmp_nominal_data_out_state <= ((read_last_nominal_state & (~ idle_state)) | (tmp_nominal_data_out_state & idle_state));
	// synopsys translate_off
	initial
		tmp_seq_ena_state = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  tmp_seq_ena_state <= (reconfig_counter_state & (C0_data_state & rotate_width_counter_done));
	// synopsys translate_off
	initial
		write_data_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_data_state <= 1'b0;
		else  write_data_state <= (write_init_state | (write_data_state & (~ width_counter_done)));
	// synopsys translate_off
	initial
		write_init_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_init_nominal_state <= 1'b0;
		else  write_init_nominal_state <= ((idle_state & write_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]));
	// synopsys translate_off
	initial
		write_init_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_init_state <= 1'b0;
		else  write_init_state <= ((idle_state & write_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])));
	// synopsys translate_off
	initial
		write_nominal_state = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge reset)
		if (reset == 1'b1) write_nominal_state <= 1'b0;
		else  write_nominal_state <= (write_init_nominal_state | (write_nominal_state & (~ width_counter_done)));
	assign
		wire_add_sub6_result_int = {wire_add_sub6_dataa, wire_add_sub6_cin} + {wire_add_sub6_datab, wire_add_sub6_cin};
	assign
		wire_add_sub6_result = wire_add_sub6_result_int[9:1];
	assign
		wire_add_sub6_cin = 1'b0,
		wire_add_sub6_dataa = {1'b0, shift_reg8[0:0], shift_reg7[0:0], shift_reg6[0:0], shift_reg5[0:0], shift_reg4[0:0], shift_reg3[0:0], shift_reg2[0:0], shift_reg1[0:0]},
		wire_add_sub6_datab = {1'b0, shift_reg17[0:0], shift_reg16[0:0], shift_reg15[0:0], shift_reg14[0:0], shift_reg13[0:0], shift_reg12[0:0], shift_reg11[0:0], shift_reg10[0:0]};
	assign
		wire_add_sub7_result_int = {wire_add_sub7_dataa, wire_add_sub7_cin} + {8'b00000000, wire_add_sub7_cin};
	assign
		wire_add_sub7_result = wire_add_sub7_result_int[8:1];
	assign
		wire_add_sub7_cin = data_in[0],
		wire_add_sub7_dataa = {data_in[8:1]};
	finalProject_i2s_mclk_reconfig_cmpr_f58   cmpr8
	( 
	.aeb(wire_cmpr8_aeb),
	.dataa({data_in[7:0]}),
	.datab(8'b00000001));
	finalProject_i2s_mclk_reconfig_cntr_ldf   cntr13
	( 
	.clock(clock),
	.cnt_en(reconfig_addr_counter_enable),
	.data(reconfig_addr_counter_sload_value),
	.q(wire_cntr13_q),
	.sload(reconfig_addr_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_c0e   cntr14
	( 
	.clock(clock),
	.cnt_en(reconfig_width_counter_enable),
	.data(reconfig_width_counter_sload_value),
	.q(wire_cntr14_q),
	.sload(reconfig_width_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_e0e   cntr15
	( 
	.clock(clock),
	.cnt_en(rom_width_counter_enable),
	.data(rom_width_counter_sload_value),
	.q(wire_cntr15_q),
	.sload(rom_width_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_b0e   cntr16
	( 
	.clock(clock),
	.cnt_en(rotate_width_counter_enable),
	.data(rotate_width_counter_sload_value),
	.q(wire_cntr16_q),
	.sload(rotate_width_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_ldf   cntr17
	( 
	.clock(clock),
	.cnt_en(rotate_addr_counter_enable),
	.data(rotate_addr_counter_sload_value),
	.q(wire_cntr17_q),
	.sload(rotate_addr_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_ldf   cntr2
	( 
	.clock(clock),
	.cnt_en(addr_counter_enable),
	.data(addr_counter_sload_value),
	.q(wire_cntr2_q),
	.sload(addr_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_rpd   cntr3
	( 
	.clock(clock),
	.cnt_en(read_addr_counter_enable),
	.data(read_addr_counter_sload_value),
	.q(wire_cntr3_q),
	.sload(read_addr_counter_sload));
	finalProject_i2s_mclk_reconfig_cntr_b0e   cntr4
	( 
	.clock(clock),
	.cnt_en(width_counter_enable),
	.data(width_counter_sload_value),
	.q(wire_cntr4_q),
	.sload(width_counter_sload));
	finalProject_i2s_mclk_reconfig_decode_9j8   decode12
	( 
	.data(cuda_combout_wire),
	.eq(wire_decode12_eq));
	assign
		addr_counter_enable = (write_data_state | write_nominal_state),
		addr_counter_out = wire_cntr2_q,
		addr_counter_sload = (write_init_state | write_init_nominal_state),
		addr_counter_sload_value = (addr_decoder_out & {8{(write_init_state | write_init_nominal_state)}}),
		addr_decoder_out = ((((((((((((((((((((((((((((((((((({{7{1'b0}}, (sel_type_cplf & sel_param_bypass_LF_unused)} | {{6{1'b0}}, {2{(sel_type_cplf & sel_param_c)}}}) | {{4{1'b0}}, (sel_type_cplf & sel_param_low_r), {3{1'b0}}}) | {{4{1'b0}}, (sel_type_vco & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_vco & sel_param_high_i_postscale)}) | {{4{1'b0}}, {3{(sel_type_cplf & sel_param_odd_CP_unused)}}, 1'b0}) | {{3{1'b0}}, (sel_type_cplf & sel_param_high_i_postscale), {3{1'b0}}, (sel_type_cplf & sel_param_high_i_postscale)}) | {{3{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), 1'b0}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_high_i_postscale)}}, 1'b0, (sel_type_n & sel_param_high_i_postscale), 1'b0}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_odd_CP_unused)}}, 1'b0, {2{(sel_type_n & sel_param_odd_CP_unused)}}}) | {{2{1'b0}}, (sel_type_n & sel_param_low_r), {3{1'b0}}, {2{(sel_type_n & sel_param_low_r)}}}) | {{2{1'b0}}, (sel_type_n & sel_param_nominal_count), {3{1'b0}}, {2{(sel_type_n & sel_param_nominal_count)}}}) | {{2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), 1'b0, {2{(sel_type_m & sel_param_high_i_postscale)}}, {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_odd_CP_unused), 1'b0, {2{(sel_type_m & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_m & sel_param_odd_CP_unused)}) | {{2{1'b0}}, {2{(sel_type_m & sel_param_low_r)}}, 1'b0, (sel_type_m & sel_param_low_r), 1'b0, (sel_type_m & sel_param_low_r)}) | {{2{1'b0}}, {2{(sel_type_m & sel_param_nominal_count)}}, 1'b0, (sel_type_m & sel_param_nominal_count), 1'b0, (sel_type_m & sel_param_nominal_count)}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0}) | {{2{1'b0}}, {5{(sel_type_c0 & sel_param_high_i_postscale)}}, 1'b0}) | {{2{1'b0}}, {6{(sel_type_c0 & sel_param_odd_CP_unused)}}}) | {1'b0, (sel_type_c0 & sel_param_low_r
), {3{1'b0}}, {3{(sel_type_c0 & sel_param_low_r)}}}) | {1'b0, (sel_type_c1 & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_c1 & sel_param_bypass_LF_unused), {3{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_high_i_postscale), 1'b0, (sel_type_c1 & sel_param_high_i_postscale), {4{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_odd_CP_unused), 1'b0, (sel_type_c1 & sel_param_odd_CP_unused), {3{1'b0}}, (sel_type_c1 & sel_param_odd_CP_unused)}) | {1'b0, (sel_type_c1 & sel_param_low_r), 1'b0, {2{(sel_type_c1 & sel_param_low_r)}}, {2{1'b0}}, (sel_type_c1 & sel_param_low_r)}) | {1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0, {2{(sel_type_c2 & sel_param_bypass_LF_unused)}}, 1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0}) | {1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}, {3{1'b0}}, (sel_type_c2 & sel_param_high_i_postscale), 1'b0}) | {1'b0, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}, {3{1'b0}}, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_low_r)}}, 1'b0, (sel_type_c2 & sel_param_low_r), 1'b0, {2{(sel_type_c2 & sel_param_low_r)}}}) | {1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, {2{1'b0}}}) | {1'b0, {3{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, (sel_type_c3 & sel_param_high_i_postscale), {2{1'b0}}}) | {1'b0, {3{(sel_type_c3 & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_c3 & sel_param_odd_CP_unused), 1'b0, (sel_type_c3 & sel_param_odd_CP_unused)}) | {1'b0, {5{(sel_type_c3 & sel_param_low_r)}}, 1'b0, (sel_type_c3 & sel_param_low_r)}) | {1'b0, {6{(sel_type_c4 & sel_param_bypass_LF_unused)}}, 1'b0}) | {(sel_type_c4 & sel_param_high_i_postscale), {4{1'b0}}, {2{(sel_type_c4 & sel_param_high_i_postscale)}}, 1'b0}) | {(sel_type_c4 & sel_param_odd_CP_unused), {4{1'b0}}, {3{(sel_type_c4 & sel_param_odd_CP_unused)}}}) | {(sel_type_c4 & sel_param_low_r), {3{1'b0}}, {4{(sel_type_c4 & sel_param_low_r)}}}),
		busy = ((~ idle_state) | areset_state),
		c0_wire = 8'b01000111,
		c1_wire = 8'b01011001,
		c2_wire = 8'b01101011,
		c3_wire = 8'b01111101,
		c4_wire = 8'b10001111,
		const_scan_chain_size = 8'b10001111,
		counter_param_latch = counter_param_latch_reg,
		counter_type_latch = counter_type_latch_reg,
		cuda_combout_wire = {wire_le_comb11_combout, wire_le_comb10_combout, wire_le_comb9_combout},
		data_out = {((shift_reg8[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[8] & read_nominal_out)), ((shift_reg7[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[7] & read_nominal_out)), ((shift_reg6[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[6] & read_nominal_out)), ((shift_reg5[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[5] & read_nominal_out)), ((shift_reg4[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[4] & read_nominal_out)), ((shift_reg3[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[3] & read_nominal_out)), ((shift_reg2[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[2] & read_nominal_out)), ((shift_reg1[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[1] & read_nominal_out)), ((shift_reg0[0:0] & (~ read_nominal_out)) | (wire_add_sub6_result[0] & read_nominal_out))},
		dummy_scandataout = pll_scandataout,
		encode_out = {C4_ena_state, (C2_ena_state | C3_ena_state), (C1_ena_state | C3_ena_state)},
		input_latch_enable = (idle_state & (write_param | read_param)),
		pll_areset = (pll_areset_in | (areset_state & reconfig_wait_state)),
		pll_configupdate = (configupdate_state & (~ configupdate3_state)),
		pll_scanclk = clock,
		pll_scanclkena = ((rotate_width_counter_enable & (~ rotate_width_counter_done)) | reconfig_seq_data_state),
		pll_scandata = (scan_cache_out & ((rotate_width_counter_enable | reconfig_seq_data_state) | reconfig_post_state)),
		power_up = ((((((((((((((((((((((((((~ reset_state) & (~ idle_state)) & (~ read_init_state)) & (~ read_first_state)) & (~ read_data_state)) & (~ read_last_state)) & (~ read_init_nominal_state)) & (~ read_first_nominal_state)) & (~ read_data_nominal_state)) & (~ read_last_nominal_state)) & (~ write_init_state)) & (~ write_data_state)) & (~ write_init_nominal_state)) & (~ write_nominal_state)) & (~ reconfig_init_state)) & (~ reconfig_counter_state)) & (~ reconfig_seq_ena_state)) & (~ reconfig_seq_data_state)) & (~ reconfig_post_state)) & (~ reconfig_wait_state)) & (~ rom_init_state)) & (~ rom_first_state)) & (~ rom_second_state)) & (~ rom_data_state)) & (~ rom_second_last_state)) & (~ rom_last_state)),
		read_addr_counter_done = (((((((wire_cntr3_q[0] & wire_cntr3_q[1]) & wire_cntr3_q[2]) & wire_cntr3_q[3]) & (~ wire_cntr3_q[4])) & (~ wire_cntr3_q[5])) & (~ wire_cntr3_q[6])) & wire_cntr3_q[7]),
		read_addr_counter_enable = ((((read_first_state | read_data_state) | read_first_nominal_state) | read_data_nominal_state) | ((rom_data_state | rom_first_state) | rom_second_state)),
		read_addr_counter_out = wire_cntr3_q,
		read_addr_counter_sload = ((read_init_state | read_init_nominal_state) | rom_init_state),
		read_addr_counter_sload_value = (read_addr_decoder_out & {8{(read_init_state | read_init_nominal_state)}}),
		read_addr_decoder_out = ((((((((((((((((((((((((((((((((((({8{1'b0}} | {{6{1'b0}}, (sel_type_cplf & sel_param_c), 1'b0}) | {{5{1'b0}}, (sel_type_cplf & sel_param_low_r), {2{1'b0}}}) | {{4{1'b0}}, (sel_type_vco & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_vco & sel_param_high_i_postscale)}) | {{4{1'b0}}, (sel_type_cplf & sel_param_odd_CP_unused), 1'b0, (sel_type_cplf & sel_param_odd_CP_unused), 1'b0}) | {{4{1'b0}}, {4{(sel_type_cplf & sel_param_high_i_postscale)}}}) | {{3{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_n & sel_param_bypass_LF_unused), 1'b0}) | {{3{1'b0}}, (sel_type_n & sel_param_high_i_postscale), {2{1'b0}}, {2{(sel_type_n & sel_param_high_i_postscale)}}}) | {{3{1'b0}}, {2{(sel_type_n & sel_param_odd_CP_unused)}}, 1'b0, {2{(sel_type_n & sel_param_odd_CP_unused)}}}) | {{3{1'b0}}, {3{(sel_type_n & sel_param_low_r)}}, {2{1'b0}}}) | {{3{1'b0}}, (sel_type_n & sel_param_nominal_count), {2{1'b0}}, (sel_type_n & sel_param_nominal_count), 1'b0}) | {{2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}, (sel_type_m & sel_param_bypass_LF_unused), {2{1'b0}}}) | {{2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_m & sel_param_high_i_postscale), 1'b0, (sel_type_m & sel_param_high_i_postscale)}) | {{2{1'b0}}, (sel_type_m & sel_param_odd_CP_unused), 1'b0, {2{(sel_type_m & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_m & sel_param_odd_CP_unused)}) | {{2{1'b0}}, (sel_type_m & sel_param_low_r), 1'b0, {3{(sel_type_m & sel_param_low_r)}}, 1'b0}) | {{2{1'b0}}, (sel_type_m & sel_param_nominal_count), {2{1'b0}}, (sel_type_m & sel_param_nominal_count), {2{1'b0}}}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c0 & sel_param_bypass_LF_unused)}}, 1'b0}) | {{2{1'b0}}, {2{(sel_type_c0 & sel_param_high_i_postscale)}}, 1'b0, {3{(sel_type_c0 & sel_param_high_i_postscale)}}}) | {{2{1'b0}}, {6{(sel_type_c0 & sel_param_odd_CP_unused)}}}) | {1'b0, (sel_type_c0 & sel_param_low_r), {6{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_bypass_LF_unused
), {2{1'b0}}, (sel_type_c1 & sel_param_bypass_LF_unused), {3{1'b0}}}) | {1'b0, (sel_type_c1 & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_c1 & sel_param_high_i_postscale), {2{1'b0}}, (sel_type_c1 & sel_param_high_i_postscale)}) | {1'b0, (sel_type_c1 & sel_param_odd_CP_unused), 1'b0, (sel_type_c1 & sel_param_odd_CP_unused), {3{1'b0}}, (sel_type_c1 & sel_param_odd_CP_unused)}) | {1'b0, (sel_type_c1 & sel_param_low_r), 1'b0, (sel_type_c1 & sel_param_low_r), {2{1'b0}}, (sel_type_c1 & sel_param_low_r), 1'b0}) | {1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0, {2{(sel_type_c2 & sel_param_bypass_LF_unused)}}, 1'b0, (sel_type_c2 & sel_param_bypass_LF_unused), 1'b0}) | {1'b0, (sel_type_c2 & sel_param_high_i_postscale), 1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}, 1'b0, {2{(sel_type_c2 & sel_param_high_i_postscale)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}, {3{1'b0}}, {2{(sel_type_c2 & sel_param_odd_CP_unused)}}}) | {1'b0, {2{(sel_type_c2 & sel_param_low_r)}}, {2{1'b0}}, (sel_type_c2 & sel_param_low_r), {2{1'b0}}}) | {1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, 1'b0, {2{(sel_type_c3 & sel_param_bypass_LF_unused)}}, {2{1'b0}}}) | {1'b0, {2{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, {2{(sel_type_c3 & sel_param_high_i_postscale)}}, 1'b0, (sel_type_c3 & sel_param_high_i_postscale)}) | {1'b0, {3{(sel_type_c3 & sel_param_odd_CP_unused)}}, 1'b0, (sel_type_c3 & sel_param_odd_CP_unused), 1'b0, (sel_type_c3 & sel_param_odd_CP_unused)}) | {1'b0, {3{(sel_type_c3 & sel_param_low_r)}}, 1'b0, {2{(sel_type_c3 & sel_param_low_r)}}, 1'b0}) | {1'b0, {6{(sel_type_c4 & sel_param_bypass_LF_unused)}}, 1'b0}) | {1'b0, {7{(sel_type_c4 & sel_param_high_i_postscale)}}}) | {(sel_type_c4 & sel_param_odd_CP_unused), {4{1'b0}}, {3{(sel_type_c4 & sel_param_odd_CP_unused)}}}) | {(sel_type_c4 & sel_param_low_r), {3{1'b0}}, (sel_type_c4 & sel_param_low_r), {3{1'b0}}}),
		read_nominal_out = tmp_nominal_data_out_state,
		reconfig_addr_counter_enable = reconfig_seq_data_state,
		reconfig_addr_counter_out = wire_cntr13_q,
		reconfig_addr_counter_sload = reconfig_seq_ena_state,
		reconfig_addr_counter_sload_value = ({8{reconfig_seq_ena_state}} & seq_addr_wire),
		reconfig_done = ((~ pll_scandone) & (dummy_scandataout | (~ dummy_scandataout))),
		reconfig_post_done = pll_scandone,
		reconfig_width_counter_done = ((((((~ wire_cntr14_q[0]) & (~ wire_cntr14_q[1])) & (~ wire_cntr14_q[2])) & (~ wire_cntr14_q[3])) & (~ wire_cntr14_q[4])) & (~ wire_cntr14_q[5])),
		reconfig_width_counter_enable = reconfig_seq_data_state,
		reconfig_width_counter_sload = reconfig_seq_ena_state,
		reconfig_width_counter_sload_value = ({6{reconfig_seq_ena_state}} & seq_sload_value),
		reset_rom_address = 1'b0,
		rom_address_out = (read_addr_counter_out & {8{((rom_first_state | rom_second_state) | rom_data_state)}}),
		rom_data_in = 1'b0,
		rom_width_counter_done = ((((((((~ wire_cntr15_q[0]) & (~ wire_cntr15_q[1])) & (~ wire_cntr15_q[2])) & (~ wire_cntr15_q[3])) & (~ wire_cntr15_q[4])) & (~ wire_cntr15_q[5])) & (~ wire_cntr15_q[6])) & (~ wire_cntr15_q[7])),
		rom_width_counter_enable = ((rom_data_state | rom_last_state) | rom_second_last_state),
		rom_width_counter_sload = rom_init_state,
		rom_width_counter_sload_value = const_scan_chain_size,
		rotate_addr_counter_enable = ((((C0_data_state | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state),
		rotate_addr_counter_out = wire_cntr17_q,
		rotate_addr_counter_sload = ((((C0_ena_state | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state),
		rotate_addr_counter_sload_value = (((((c0_wire & {8{rotate_decoder_wires[0]}}) | (c1_wire & {8{rotate_decoder_wires[1]}})) | (c2_wire & {8{rotate_decoder_wires[2]}})) | (c3_wire & {8{rotate_decoder_wires[3]}})) | (c4_wire & {8{rotate_decoder_wires[4]}})),
		rotate_decoder_wires = wire_decode12_eq,
		rotate_width_counter_done = (((((~ wire_cntr16_q[0]) & (~ wire_cntr16_q[1])) & (~ wire_cntr16_q[2])) & (~ wire_cntr16_q[3])) & (~ wire_cntr16_q[4])),
		rotate_width_counter_enable = ((((C0_data_state | C1_data_state) | C2_data_state) | C3_data_state) | C4_data_state),
		rotate_width_counter_sload = ((((C0_ena_state | C1_ena_state) | C2_ena_state) | C3_ena_state) | C4_ena_state),
		rotate_width_counter_sload_value = 5'b10010,
		scan_cache_address = (((((addr_counter_out & {8{addr_counter_enable}}) | (rotate_addr_counter_out & {8{rotate_addr_counter_enable}})) | (reconfig_addr_counter_out & {8{reconfig_addr_counter_enable}})) | ((read_addr_counter_out & {8{read_addr_counter_enable}}) & {8{(~ (rom_data_state | rom_first_state))}})) | ({8{(rom_width_counter_enable & ((rom_data_state | rom_second_last_state) | rom_last_state))}} & addr_from_rom2)),
		scan_cache_in = ((shift_reg_serial_out & (~ (((rom_first_state | rom_data_state) | rom_second_last_state) | rom_last_state))) | (rom_data_in & (((rom_first_state | rom_data_state) | rom_second_last_state) | rom_last_state))),
		scan_cache_out = wire_altsyncram5_q_a[0],
		scan_cache_write_enable = ((((write_data_state | write_nominal_state) | rom_data_state) | rom_second_last_state) | rom_last_state),
		sel_param_bypass_LF_unused = (((~ counter_param_latch[0]) & (~ counter_param_latch[1])) & counter_param_latch[2]),
		sel_param_c = (((~ counter_param_latch[0]) & counter_param_latch[1]) & (~ counter_param_latch[2])),
		sel_param_high_i_postscale = (((~ counter_param_latch[0]) & (~ counter_param_latch[1])) & (~ counter_param_latch[2])),
		sel_param_low_r = ((counter_param_latch[0] & (~ counter_param_latch[1])) & (~ counter_param_latch[2])),
		sel_param_nominal_count = ((counter_param_latch[0] & counter_param_latch[1]) & counter_param_latch[2]),
		sel_param_odd_CP_unused = ((counter_param_latch[0] & (~ counter_param_latch[1])) & counter_param_latch[2]),
		sel_type_c0 = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c1 = (((counter_type_latch[0] & (~ counter_type_latch[1])) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c2 = ((((~ counter_type_latch[0]) & counter_type_latch[1]) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c3 = (((counter_type_latch[0] & counter_type_latch[1]) & counter_type_latch[2]) & (~ counter_type_latch[3])),
		sel_type_c4 = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & counter_type_latch[3]),
		sel_type_cplf = ((((~ counter_type_latch[0]) & counter_type_latch[1]) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_m = (((counter_type_latch[0] & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_n = ((((~ counter_type_latch[0]) & (~ counter_type_latch[1])) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		sel_type_vco = (((counter_type_latch[0] & counter_type_latch[1]) & (~ counter_type_latch[2])) & (~ counter_type_latch[3])),
		seq_addr_wire = 8'b00110101,
		seq_sload_value = 6'b110110,
		shift_reg_clear = (read_init_state | read_init_nominal_state),
		shift_reg_load_enable = ((idle_state & write_param) & (~ ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0]))),
		shift_reg_load_nominal_enable = ((idle_state & write_param) & ((((((~ counter_type[3]) & (~ counter_type[2])) & (~ counter_type[1])) & counter_param[2]) & counter_param[1]) & counter_param[0])),
		shift_reg_serial_in = scan_cache_out,
		shift_reg_serial_out = ((((((((shift_reg17[0:0] & shift_reg_width_select[0]) | (shift_reg17[0:0] & shift_reg_width_select[1])) | (shift_reg17[0:0] & shift_reg_width_select[2])) | (shift_reg17[0:0] & shift_reg_width_select[3])) | (shift_reg17[0:0] & shift_reg_width_select[4])) | (shift_reg17[0:0] & shift_reg_width_select[5])) | (shift_reg17[0:0] & shift_reg_width_select[6])) | (shift_reg17[0:0] & shift_reg_width_select[7])),
		shift_reg_shift_enable = ((read_data_state | read_last_state) | write_data_state),
		shift_reg_shift_nominal_enable = ((read_data_nominal_state | read_last_nominal_state) | write_nominal_state),
		shift_reg_width_select = width_decoder_select,
		w1565w = 1'b0,
		w1592w = 1'b0,
		w64w = 1'b0,
		width_counter_done = (((((~ wire_cntr4_q[0]) & (~ wire_cntr4_q[1])) & (~ wire_cntr4_q[2])) & (~ wire_cntr4_q[3])) & (~ wire_cntr4_q[4])),
		width_counter_enable = ((((read_first_state | read_data_state) | write_data_state) | read_data_nominal_state) | write_nominal_state),
		width_counter_sload = (((read_init_state | write_init_state) | read_init_nominal_state) | write_init_nominal_state),
		width_counter_sload_value = width_decoder_out,
		width_decoder_out = ((((({5{1'b0}} | {width_decoder_select[2], {3{1'b0}}, width_decoder_select[2]}) | {{4{1'b0}}, width_decoder_select[3]}) | {{2{1'b0}}, {3{width_decoder_select[5]}}}) | {{3{1'b0}}, width_decoder_select[6], 1'b0}) | {{2{1'b0}}, width_decoder_select[7], {2{1'b0}}}),
		width_decoder_select = {((sel_type_cplf & sel_param_low_r) | (sel_type_cplf & sel_param_odd_CP_unused)), (sel_type_cplf & sel_param_high_i_postscale), ((((((((((((((sel_type_n & sel_param_high_i_postscale) | (sel_type_n & sel_param_low_r)) | (sel_type_m & sel_param_high_i_postscale)) | (sel_type_m & sel_param_low_r)) | (sel_type_c0 & sel_param_high_i_postscale)) | (sel_type_c0 & sel_param_low_r)) | (sel_type_c1 & sel_param_high_i_postscale)) | (sel_type_c1 & sel_param_low_r)) | (sel_type_c2 & sel_param_high_i_postscale)) | (sel_type_c2 & sel_param_low_r)) | (sel_type_c3 & sel_param_high_i_postscale)) | (sel_type_c3 & sel_param_low_r)) | (sel_type_c4 & sel_param_high_i_postscale)) | (sel_type_c4 & sel_param_low_r)), w1592w, ((sel_type_cplf & sel_param_bypass_LF_unused) | (sel_type_cplf & sel_param_c)), ((sel_type_n & sel_param_nominal_count) | (sel_type_m & sel_param_nominal_count)), w1565w, (((((((((((((((sel_type_vco & sel_param_high_i_postscale) | (sel_type_n & sel_param_bypass_LF_unused)) | (sel_type_n & sel_param_odd_CP_unused)) | (sel_type_m & sel_param_bypass_LF_unused)) | (sel_type_m & sel_param_odd_CP_unused)) | (sel_type_c0 & sel_param_bypass_LF_unused)) | (sel_type_c0 & sel_param_odd_CP_unused)) | (sel_type_c1 & sel_param_bypass_LF_unused)) | (sel_type_c1 & sel_param_odd_CP_unused)) | (sel_type_c2 & sel_param_bypass_LF_unused)) | (sel_type_c2 & sel_param_odd_CP_unused)) | (sel_type_c3 & sel_param_bypass_LF_unused)) | (sel_type_c3 & sel_param_odd_CP_unused)) | (sel_type_c4 & sel_param_bypass_LF_unused)) | (sel_type_c4 & sel_param_odd_CP_unused))},
		write_rom_ena = ((rom_first_state | rom_second_state) | (rom_data_state & (~ rom_width_counter_done)));
endmodule //finalProject_i2s_mclk_reconfig_pllrcfg_5601

//synthesis_resources = lut 84 M9K 1 reg 158 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  finalProject_i2s_mclk_reconfig
	( 
	busy,
	clock,
	counter_param,
	counter_type,
	data_in,
	data_out,
	pll_areset,
	pll_areset_in,
	pll_configupdate,
	pll_scanclk,
	pll_scanclkena,
	pll_scandata,
	pll_scandataout,
	pll_scandone,
	read_param,
	reconfig,
	reset,
	reset_rom_address,
	rom_address_out,
	rom_data_in,
	write_from_rom,
	write_param,
	write_rom_ena) /* synthesis synthesis_clearbox=1 */;
	output   busy;
	input   clock;
	input   [2:0]  counter_param;
	input   [3:0]  counter_type;
	input   [8:0]  data_in;
	output   [8:0]  data_out;
	output   pll_areset;
	input   pll_areset_in;
	output   pll_configupdate;
	output   pll_scanclk;
	output   pll_scanclkena;
	output   pll_scandata;
	input   pll_scandataout;
	input   pll_scandone;
	input   read_param;
	input   reconfig;
	input   reset;
	input   reset_rom_address;
	output   [7:0]  rom_address_out;
	input   rom_data_in;
	input   write_from_rom;
	input   write_param;
	output   write_rom_ena;

	wire  wire_pllrcfg1_busy;
	wire  [8:0]   wire_pllrcfg1_data_out;
	wire  wire_pllrcfg1_pll_areset;
	wire  wire_pllrcfg1_pll_configupdate;
	wire  wire_pllrcfg1_pll_scanclk;
	wire  wire_pllrcfg1_pll_scanclkena;
	wire  wire_pllrcfg1_pll_scandata;
	wire  [7:0]   wire_pllrcfg1_rom_address_out;
	wire  wire_pllrcfg1_write_rom_ena;

	finalProject_i2s_mclk_reconfig_pllrcfg_5601   pllrcfg1
	( 
	.busy(wire_pllrcfg1_busy),
	.clock(clock),
	.counter_param(counter_param),
	.counter_type(counter_type),
	.data_in(data_in),
	.data_out(wire_pllrcfg1_data_out),
	.pll_areset(wire_pllrcfg1_pll_areset),
	.pll_areset_in(pll_areset_in),
	.pll_configupdate(wire_pllrcfg1_pll_configupdate),
	.pll_scanclk(wire_pllrcfg1_pll_scanclk),
	.pll_scanclkena(wire_pllrcfg1_pll_scanclkena),
	.pll_scandata(wire_pllrcfg1_pll_scandata),
	.pll_scandataout(pll_scandataout),
	.pll_scandone(pll_scandone),
	.read_param(read_param),
	.reconfig(reconfig),
	.reset(reset),
	.rom_address_out(wire_pllrcfg1_rom_address_out),
	.write_from_rom(1'b0),
	.write_param(write_param),
	.write_rom_ena(wire_pllrcfg1_write_rom_ena));
	assign
		busy = wire_pllrcfg1_busy,
		data_out = wire_pllrcfg1_data_out,
		pll_areset = wire_pllrcfg1_pll_areset,
		pll_configupdate = wire_pllrcfg1_pll_configupdate,
		pll_scanclk = wire_pllrcfg1_pll_scanclk,
		pll_scanclkena = wire_pllrcfg1_pll_scanclkena,
		pll_scandata = wire_pllrcfg1_pll_scandata,
		rom_address_out = wire_pllrcfg1_rom_address_out,
		write_rom_ena = wire_pllrcfg1_write_rom_ena;
endmodule //finalProject_i2s_mclk_reconfig
//VALID FILE
