	component finalProject is
		port (
			clk_clk                                      : in    std_logic                     := 'X';             -- clk
			hex_digits_export                            : out   std_logic_vector(15 downto 0);                    -- export
			i2c_serial_sda_in                            : in    std_logic                     := 'X';             -- sda_in
			i2c_serial_scl_in                            : in    std_logic                     := 'X';             -- scl_in
			i2c_serial_sda_oe                            : out   std_logic;                                        -- sda_oe
			i2c_serial_scl_oe                            : out   std_logic;                                        -- scl_oe
			key_external_connection_export               : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			keycode_export                               : out   std_logic_vector(7 downto 0);                     -- export
			keycode1_export                              : out   std_logic_vector(7 downto 0);                     -- export
			keycode2_export                              : out   std_logic_vector(7 downto 0);                     -- export
			keycode3_export                              : out   std_logic_vector(7 downto 0);                     -- export
			leds_export                                  : out   std_logic_vector(13 downto 0);                    -- export
			oct_external_connection_export               : out   std_logic_vector(7 downto 0);                     -- export
			phase_incr0_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr10_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr11_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr12_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr13_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr14_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr15_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr16_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr17_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr18_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr19_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr1_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr20_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr21_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr22_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr23_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr24_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr25_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr26_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr27_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr28_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr29_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr2_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr30_external_connection_export      : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr3_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr4_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr5_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr6_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr7_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr8_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			phase_incr9_external_connection_export       : out   std_logic_vector(31 downto 0);                    -- export
			reset_reset_n                                : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk                                : out   std_logic;                                        -- clk
			sdram_wire_addr                              : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                                : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                             : out   std_logic;                                        -- cas_n
			sdram_wire_cke                               : out   std_logic;                                        -- cke
			sdram_wire_cs_n                              : out   std_logic;                                        -- cs_n
			sdram_wire_dq                                : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                               : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                             : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                              : out   std_logic;                                        -- we_n
			spi0_MISO                                    : in    std_logic                     := 'X';             -- MISO
			spi0_MOSI                                    : out   std_logic;                                        -- MOSI
			spi0_SCLK                                    : out   std_logic;                                        -- SCLK
			spi0_SS_n                                    : out   std_logic;                                        -- SS_n
			tablecoef0_external_connection_export_export : out   std_logic_vector(15 downto 0);                    -- export
			tablecoef1_external_connection_export_export : out   std_logic_vector(15 downto 0);                    -- export
			tablecoef2_external_connection_export_export : out   std_logic_vector(15 downto 0);                    -- export
			tablecoef3_external_connection_export_export : out   std_logic_vector(15 downto 0);                    -- export
			usb_gpx_export                               : in    std_logic                     := 'X';             -- export
			usb_irq_export                               : in    std_logic                     := 'X';             -- export
			usb_rst_export                               : out   std_logic                                         -- export
		);
	end component finalProject;

	u0 : component finalProject
		port map (
			clk_clk                                      => CONNECTED_TO_clk_clk,                                      --                                   clk.clk
			hex_digits_export                            => CONNECTED_TO_hex_digits_export,                            --                            hex_digits.export
			i2c_serial_sda_in                            => CONNECTED_TO_i2c_serial_sda_in,                            --                            i2c_serial.sda_in
			i2c_serial_scl_in                            => CONNECTED_TO_i2c_serial_scl_in,                            --                                      .scl_in
			i2c_serial_sda_oe                            => CONNECTED_TO_i2c_serial_sda_oe,                            --                                      .sda_oe
			i2c_serial_scl_oe                            => CONNECTED_TO_i2c_serial_scl_oe,                            --                                      .scl_oe
			key_external_connection_export               => CONNECTED_TO_key_external_connection_export,               --               key_external_connection.export
			keycode_export                               => CONNECTED_TO_keycode_export,                               --                               keycode.export
			keycode1_export                              => CONNECTED_TO_keycode1_export,                              --                              keycode1.export
			keycode2_export                              => CONNECTED_TO_keycode2_export,                              --                              keycode2.export
			keycode3_export                              => CONNECTED_TO_keycode3_export,                              --                              keycode3.export
			leds_export                                  => CONNECTED_TO_leds_export,                                  --                                  leds.export
			oct_external_connection_export               => CONNECTED_TO_oct_external_connection_export,               --               oct_external_connection.export
			phase_incr0_external_connection_export       => CONNECTED_TO_phase_incr0_external_connection_export,       --       phase_incr0_external_connection.export
			phase_incr10_external_connection_export      => CONNECTED_TO_phase_incr10_external_connection_export,      --      phase_incr10_external_connection.export
			phase_incr11_external_connection_export      => CONNECTED_TO_phase_incr11_external_connection_export,      --      phase_incr11_external_connection.export
			phase_incr12_external_connection_export      => CONNECTED_TO_phase_incr12_external_connection_export,      --      phase_incr12_external_connection.export
			phase_incr13_external_connection_export      => CONNECTED_TO_phase_incr13_external_connection_export,      --      phase_incr13_external_connection.export
			phase_incr14_external_connection_export      => CONNECTED_TO_phase_incr14_external_connection_export,      --      phase_incr14_external_connection.export
			phase_incr15_external_connection_export      => CONNECTED_TO_phase_incr15_external_connection_export,      --      phase_incr15_external_connection.export
			phase_incr16_external_connection_export      => CONNECTED_TO_phase_incr16_external_connection_export,      --      phase_incr16_external_connection.export
			phase_incr17_external_connection_export      => CONNECTED_TO_phase_incr17_external_connection_export,      --      phase_incr17_external_connection.export
			phase_incr18_external_connection_export      => CONNECTED_TO_phase_incr18_external_connection_export,      --      phase_incr18_external_connection.export
			phase_incr19_external_connection_export      => CONNECTED_TO_phase_incr19_external_connection_export,      --      phase_incr19_external_connection.export
			phase_incr1_external_connection_export       => CONNECTED_TO_phase_incr1_external_connection_export,       --       phase_incr1_external_connection.export
			phase_incr20_external_connection_export      => CONNECTED_TO_phase_incr20_external_connection_export,      --      phase_incr20_external_connection.export
			phase_incr21_external_connection_export      => CONNECTED_TO_phase_incr21_external_connection_export,      --      phase_incr21_external_connection.export
			phase_incr22_external_connection_export      => CONNECTED_TO_phase_incr22_external_connection_export,      --      phase_incr22_external_connection.export
			phase_incr23_external_connection_export      => CONNECTED_TO_phase_incr23_external_connection_export,      --      phase_incr23_external_connection.export
			phase_incr24_external_connection_export      => CONNECTED_TO_phase_incr24_external_connection_export,      --      phase_incr24_external_connection.export
			phase_incr25_external_connection_export      => CONNECTED_TO_phase_incr25_external_connection_export,      --      phase_incr25_external_connection.export
			phase_incr26_external_connection_export      => CONNECTED_TO_phase_incr26_external_connection_export,      --      phase_incr26_external_connection.export
			phase_incr27_external_connection_export      => CONNECTED_TO_phase_incr27_external_connection_export,      --      phase_incr27_external_connection.export
			phase_incr28_external_connection_export      => CONNECTED_TO_phase_incr28_external_connection_export,      --      phase_incr28_external_connection.export
			phase_incr29_external_connection_export      => CONNECTED_TO_phase_incr29_external_connection_export,      --      phase_incr29_external_connection.export
			phase_incr2_external_connection_export       => CONNECTED_TO_phase_incr2_external_connection_export,       --       phase_incr2_external_connection.export
			phase_incr30_external_connection_export      => CONNECTED_TO_phase_incr30_external_connection_export,      --      phase_incr30_external_connection.export
			phase_incr3_external_connection_export       => CONNECTED_TO_phase_incr3_external_connection_export,       --       phase_incr3_external_connection.export
			phase_incr4_external_connection_export       => CONNECTED_TO_phase_incr4_external_connection_export,       --       phase_incr4_external_connection.export
			phase_incr5_external_connection_export       => CONNECTED_TO_phase_incr5_external_connection_export,       --       phase_incr5_external_connection.export
			phase_incr6_external_connection_export       => CONNECTED_TO_phase_incr6_external_connection_export,       --       phase_incr6_external_connection.export
			phase_incr7_external_connection_export       => CONNECTED_TO_phase_incr7_external_connection_export,       --       phase_incr7_external_connection.export
			phase_incr8_external_connection_export       => CONNECTED_TO_phase_incr8_external_connection_export,       --       phase_incr8_external_connection.export
			phase_incr9_external_connection_export       => CONNECTED_TO_phase_incr9_external_connection_export,       --       phase_incr9_external_connection.export
			reset_reset_n                                => CONNECTED_TO_reset_reset_n,                                --                                 reset.reset_n
			sdram_clk_clk                                => CONNECTED_TO_sdram_clk_clk,                                --                             sdram_clk.clk
			sdram_wire_addr                              => CONNECTED_TO_sdram_wire_addr,                              --                            sdram_wire.addr
			sdram_wire_ba                                => CONNECTED_TO_sdram_wire_ba,                                --                                      .ba
			sdram_wire_cas_n                             => CONNECTED_TO_sdram_wire_cas_n,                             --                                      .cas_n
			sdram_wire_cke                               => CONNECTED_TO_sdram_wire_cke,                               --                                      .cke
			sdram_wire_cs_n                              => CONNECTED_TO_sdram_wire_cs_n,                              --                                      .cs_n
			sdram_wire_dq                                => CONNECTED_TO_sdram_wire_dq,                                --                                      .dq
			sdram_wire_dqm                               => CONNECTED_TO_sdram_wire_dqm,                               --                                      .dqm
			sdram_wire_ras_n                             => CONNECTED_TO_sdram_wire_ras_n,                             --                                      .ras_n
			sdram_wire_we_n                              => CONNECTED_TO_sdram_wire_we_n,                              --                                      .we_n
			spi0_MISO                                    => CONNECTED_TO_spi0_MISO,                                    --                                  spi0.MISO
			spi0_MOSI                                    => CONNECTED_TO_spi0_MOSI,                                    --                                      .MOSI
			spi0_SCLK                                    => CONNECTED_TO_spi0_SCLK,                                    --                                      .SCLK
			spi0_SS_n                                    => CONNECTED_TO_spi0_SS_n,                                    --                                      .SS_n
			tablecoef0_external_connection_export_export => CONNECTED_TO_tablecoef0_external_connection_export_export, -- tablecoef0_external_connection_export.export
			tablecoef1_external_connection_export_export => CONNECTED_TO_tablecoef1_external_connection_export_export, -- tablecoef1_external_connection_export.export
			tablecoef2_external_connection_export_export => CONNECTED_TO_tablecoef2_external_connection_export_export, -- tablecoef2_external_connection_export.export
			tablecoef3_external_connection_export_export => CONNECTED_TO_tablecoef3_external_connection_export_export, -- tablecoef3_external_connection_export.export
			usb_gpx_export                               => CONNECTED_TO_usb_gpx_export,                               --                               usb_gpx.export
			usb_irq_export                               => CONNECTED_TO_usb_irq_export,                               --                               usb_irq.export
			usb_rst_export                               => CONNECTED_TO_usb_rst_export                                --                               usb_rst.export
		);

