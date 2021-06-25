
module finalProject (
	clk_clk,
	hex_digits_export,
	i2c_serial_sda_in,
	i2c_serial_scl_in,
	i2c_serial_sda_oe,
	i2c_serial_scl_oe,
	key_external_connection_export,
	keycode_export,
	keycode1_export,
	keycode2_export,
	keycode3_export,
	leds_export,
	oct_external_connection_export,
	phase_incr0_external_connection_export,
	phase_incr10_external_connection_export,
	phase_incr11_external_connection_export,
	phase_incr12_external_connection_export,
	phase_incr13_external_connection_export,
	phase_incr14_external_connection_export,
	phase_incr15_external_connection_export,
	phase_incr16_external_connection_export,
	phase_incr17_external_connection_export,
	phase_incr1_external_connection_export,
	phase_incr2_external_connection_export,
	phase_incr3_external_connection_export,
	phase_incr4_external_connection_export,
	phase_incr5_external_connection_export,
	phase_incr6_external_connection_export,
	phase_incr7_external_connection_export,
	phase_incr8_external_connection_export,
	phase_incr9_external_connection_export,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n,
	usb_gpx_export,
	usb_irq_export,
	usb_rst_export,
	phase_incr18_external_connection_export,
	phase_incr19_external_connection_export,
	phase_incr20_external_connection_export,
	phase_incr21_external_connection_export,
	phase_incr22_external_connection_export,
	phase_incr23_external_connection_export,
	phase_incr24_external_connection_export,
	phase_incr25_external_connection_export,
	phase_incr26_external_connection_export,
	phase_incr27_external_connection_export,
	phase_incr28_external_connection_export,
	phase_incr29_external_connection_export,
	phase_incr30_external_connection_export);	

	input		clk_clk;
	output	[15:0]	hex_digits_export;
	input		i2c_serial_sda_in;
	input		i2c_serial_scl_in;
	output		i2c_serial_sda_oe;
	output		i2c_serial_scl_oe;
	input	[1:0]	key_external_connection_export;
	output	[7:0]	keycode_export;
	output	[7:0]	keycode1_export;
	output	[7:0]	keycode2_export;
	output	[7:0]	keycode3_export;
	output	[13:0]	leds_export;
	output	[7:0]	oct_external_connection_export;
	output	[31:0]	phase_incr0_external_connection_export;
	output	[31:0]	phase_incr10_external_connection_export;
	output	[31:0]	phase_incr11_external_connection_export;
	output	[31:0]	phase_incr12_external_connection_export;
	output	[31:0]	phase_incr13_external_connection_export;
	output	[31:0]	phase_incr14_external_connection_export;
	output	[31:0]	phase_incr15_external_connection_export;
	output	[31:0]	phase_incr16_external_connection_export;
	output	[31:0]	phase_incr17_external_connection_export;
	output	[31:0]	phase_incr1_external_connection_export;
	output	[31:0]	phase_incr2_external_connection_export;
	output	[31:0]	phase_incr3_external_connection_export;
	output	[31:0]	phase_incr4_external_connection_export;
	output	[31:0]	phase_incr5_external_connection_export;
	output	[31:0]	phase_incr6_external_connection_export;
	output	[31:0]	phase_incr7_external_connection_export;
	output	[31:0]	phase_incr8_external_connection_export;
	output	[31:0]	phase_incr9_external_connection_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
	input		usb_gpx_export;
	input		usb_irq_export;
	output		usb_rst_export;
	output	[31:0]	phase_incr18_external_connection_export;
	output	[31:0]	phase_incr19_external_connection_export;
	output	[31:0]	phase_incr20_external_connection_export;
	output	[31:0]	phase_incr21_external_connection_export;
	output	[31:0]	phase_incr22_external_connection_export;
	output	[31:0]	phase_incr23_external_connection_export;
	output	[31:0]	phase_incr24_external_connection_export;
	output	[31:0]	phase_incr25_external_connection_export;
	output	[31:0]	phase_incr26_external_connection_export;
	output	[31:0]	phase_incr27_external_connection_export;
	output	[31:0]	phase_incr28_external_connection_export;
	output	[31:0]	phase_incr29_external_connection_export;
	output	[31:0]	phase_incr30_external_connection_export;
endmodule
