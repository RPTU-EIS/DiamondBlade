module soc_top #(
parameter CORE_TYPE   = 1,
parameter USE_HWPE    = 1, 
parameter USE_FPU     = 1,
parameter USE_ZFINX   = 1,
parameter SIM_STDOUT  = 0
)(
	input clock,
	input reset,
	input s_mode_select,
	input s_dft_cg_enable,
	input s_test_mode,
	input s_bootsel,
	input s_jtag_tck,
	input s_jtag_trst,
	input s_jtag_tms,
	input s_jtag_tdi,
	input s_gpio_in,
	input s_uart_rx,
	input s_cam_pclk,
	input s_cam_data,
	input s_cam_hsync,
	input s_cam_vsync,
	input s_i2c_scl_in,
	input s_i2c_sda_in,
	input s_i2s_sd0_in,
	input s_i2s_sd1_in,
	input s_i2s_ws_in,
	input s_i2s_sck_in,
	input s_spi_sdi,
	input s_sdio_cmdi,
	input s_sdio_datai,
	input s_cluster_busy,
	input s_dma_pe_evt_valid,
	input s_dma_pe_irq_valid,
	input s_pf_evt_valid,
	input [31:0] 		secret_address,
	input logic [3:0] 	pmp_reg
);

localparam AXI_ADDR_WIDTH             = 32;
localparam AXI_CLUSTER_SOC_DATA_WIDTH = 64;
localparam AXI_SOC_CLUSTER_DATA_WIDTH = 32;
localparam AXI_CLUSTER_SOC_ID_WIDTH   = 6;
localparam AXI_USER_WIDTH             = 6;
localparam AXI_CLUSTER_SOC_STRB_WIDTH = AXI_CLUSTER_SOC_DATA_WIDTH/8;
localparam AXI_SOC_CLUSTER_STRB_WIDTH = AXI_SOC_CLUSTER_DATA_WIDTH/8;
localparam BUFFER_WIDTH               = 8;
localparam EVENT_WIDTH                = 8;
// localparam CVP_ADDR_WIDTH             = 32;
// localparam CVP_DATA_WIDTH             = 32;
localparam int unsigned N_UART = 1;
localparam int unsigned N_SPI = 1;
localparam int unsigned N_I2C = 2;

logic reset_n;
assign reset_n = !reset;

// logic s_mode_select;
// logic s_dft_cg_enable;
// logic s_test_mode;
// logic s_bootsel;
// logic s_jtag_tck;
// logic s_jtag_trst;
// logic s_jtag_tms;
// logic s_jtag_tdi;
// logic s_gpio_in;
// logic s_uart_rx;
// logic s_cam_pclk;
// logic s_cam_data;
// logic s_cam_hsync;
// logic s_cam_vsync;
// logic s_i2c_scl_in;
// logic s_i2c_sda_in;
// logic s_i2s_sd0_in;
// logic s_i2s_sd0_in;
// logic s_i2s_sd1_in;
// logic s_i2s_ws_in;
// logic s_i2s_sck_in;
// logic s_spi_sdi;
// logic s_sdio_cmdi;
// logic s_sdio_datai;
// logic s_cluster_busy;
// logic s_dma_pe_evt_valid;
// logic s_dma_pe_irq_valid;
// logic s_pf_evt_valid;

soc_domain #(
	.CORE_TYPE          ( CORE_TYPE                  ),
	.USE_FPU            ( USE_FPU                    ),
	.USE_ZFINX          ( USE_ZFINX                  ),
	.USE_HWPE           ( USE_HWPE                   ),
	.AXI_ADDR_WIDTH     ( AXI_ADDR_WIDTH             ),
	.AXI_DATA_IN_WIDTH  ( AXI_CLUSTER_SOC_DATA_WIDTH ),
	.AXI_DATA_OUT_WIDTH ( AXI_SOC_CLUSTER_DATA_WIDTH ),
	.AXI_ID_IN_WIDTH    ( AXI_CLUSTER_SOC_ID_WIDTH   ),
	.AXI_USER_WIDTH     ( AXI_USER_WIDTH             ),
	.AXI_STRB_WIDTH_IN  ( AXI_CLUSTER_SOC_STRB_WIDTH ),
	.AXI_STRB_WIDTH_OUT ( AXI_SOC_CLUSTER_STRB_WIDTH ),
	.EVNT_WIDTH         ( EVENT_WIDTH                ),
	.CDC_FIFOS_LOG_DEPTH( 3                          ),
	.NB_CL_CORES        ( 0                          ),
	.N_UART             ( N_UART                     ),
	.N_SPI              ( N_SPI                      ),
	.N_I2C              ( N_I2C                      ),
	.SIM_STDOUT         ( SIM_STDOUT                 )
 ) soc_domain_1 (

	  .ref_clk_i                   ( clock          ),
	  .slow_clk_i                  ( clock         ),
	  .test_clk_i                  ( clock         ),

	  .rstn_glob_i                 ( reset_n         ),

	  .mode_select_i               ( s_mode_select      ),
	  .dft_cg_enable_i             ( s_dft_cg_enable    ),
	  .dft_test_mode_i             ( s_test_mode        ),

	  .bootsel_i                   ( s_bootsel          ),

	  // we immediately start bootin g in the default setup
	  .fc_fetch_en_valid_i         ( 1'b1               ),
	  .fc_fetch_en_i               ( 1'b1               ),

	  .jtag_tck_i                  ( s_jtag_tck         ),
	  .jtag_trst_ni                ( s_jtag_trst        ),
	  .jtag_tms_i                  ( s_jtag_tms         ),
	  .jtag_tdi_i                  ( s_jtag_tdi         ),
	  .jtag_tdo_o                  (                    ),

	  .pad_cfg_o                   (                    ),
	  .pad_mux_o                   (                    ),

	  .gpio_in_i                   ( s_gpio_in          ),
	  .gpio_out_o                  (                    ),
	  .gpio_dir_o                  (                    ),
	  .gpio_cfg_o                  (                    ),

	  .uart_tx_o                   (                    ),
	  .uart_rx_i                   ( s_uart_rx          ),

	  .cam_clk_i                   ( s_cam_pclk         ),
	  .cam_data_i                  ( s_cam_data         ),
	  .cam_hsync_i                 ( s_cam_hsync        ),
	  .cam_vsync_i                 ( s_cam_vsync        ),

	  .timer_ch0_o                 (                    ),
	  .timer_ch1_o                 (                    ),
	  .timer_ch2_o                 (                    ),
	  .timer_ch3_o                 (                    ),

	  .i2c_scl_i                   ( s_i2c_scl_in       ),
	  .i2c_scl_o                   (                    ),
	  .i2c_scl_oe_o                (                    ),
	  .i2c_sda_i                   ( s_i2c_sda_in       ),
	  .i2c_sda_o                   (                    ),
	  .i2c_sda_oe_o                (                    ),

	  .i2s_slave_sd0_i             ( s_i2s_sd0_in       ),
	  .i2s_slave_sd1_i             ( s_i2s_sd1_in       ),
	  .i2s_slave_ws_i              ( s_i2s_ws_in        ),
	  .i2s_slave_ws_o              (                    ),
	  .i2s_slave_ws_oe             (                    ),
	  .i2s_slave_sck_i             ( s_i2s_sck_in       ),
	  .i2s_slave_sck_o             (                    ),
	  .i2s_slave_sck_oe            (                    ),

	  .spi_clk_o                   (                    ),
	  .spi_csn_o                   (                    ),
	  .spi_oen_o                   (                    ),
	  .spi_sdo_o                   (                    ),
	  .spi_sdi_i                   ( s_spi_sdi          ),

	  .sdio_clk_o                  (                    ),
	  .sdio_cmd_o                  (                    ),
	  .sdio_cmd_i                  ( s_sdio_cmdi        ),
	  .sdio_cmd_oen_o              (                    ),
	  .sdio_data_o                 (                    ),
	  .sdio_data_i                 ( s_sdio_datai       ),
	  .sdio_data_oen_o             (                    ),

	   // TODO: wire up if needed
	  .hyper_cs_no                 (                    ),
	  .hyper_ck_o                  (                    ),
	  .hyper_ck_no                 (                    ),
	  .hyper_rwds_o                (                    ),
	  .hyper_rwds_i                ( '0                 ),
	  .hyper_rwds_oe_o             (                    ),
	  .hyper_dq_i                  ( '0                 ),
	  .hyper_dq_o                  (                    ),
	  .hyper_dq_oe_o               (                    ),
	  .hyper_reset_no              (                    ),

	  .cluster_busy_i              ( s_cluster_busy     ),
	  .cluster_irq_o               (                    ),

	  .dma_pe_evt_ack_o            (                    ),
	  .dma_pe_evt_valid_i          ( s_dma_pe_evt_valid ),
	  .dma_pe_irq_ack_o            (                    ),
	  .dma_pe_irq_valid_i          ( s_dma_pe_irq_valid ),
	  .pf_evt_ack_o                (                    ),
	  .pf_evt_valid_i              ( s_pf_evt_valid     ),

	  .cluster_pow_o               (                    ),
	  .cluster_byp_o               (                    ),


	  .cluster_clk_o               (                    ),
	  .cluster_rstn_o              (                    ),

	  .cluster_rtc_o               (                    ),
	  .cluster_fetch_enable_o      (                    ),
	  .cluster_boot_addr_o         (                    ),
	  .cluster_test_en_o           (                    ),
	  .cluster_dbg_irq_valid_o     (                    ), // we dont' have a cluster
	  .async_data_slave_aw_rptr_o  (                    ), // we don't have a cluster
	  .async_data_slave_ar_rptr_o  (                    ), // we don't have a cluster
	  .async_data_slave_w_rptr_o   (                    ), // we don't have a cluster
	  .async_data_slave_r_wptr_o   (                    ), // we don't have a cluster
	  .async_data_slave_r_data_o   (                    ), // we don't have a cluster
	  .async_data_slave_b_wptr_o   (                    ), // we don't have a cluster
	  .async_data_slave_b_data_o   (                    ), // we don't have a cluster
	  .async_data_master_aw_wptr_o (                    ), // we don't have a cluster
	  .async_data_master_aw_data_o (                    ), // we don't have a cluster
	  .async_data_master_ar_wptr_o (                    ), // we don't have a cluster
	  .async_data_master_ar_data_o (                    ), // we don't have a cluster
	  .async_data_master_w_wptr_o  (                    ), // we don't have a cluster
	  .async_data_master_w_data_o  (                    ), // we don't have a cluster
	  .async_data_master_r_rptr_o  (                    ), // we don't have a cluster
	  .async_data_master_b_rptr_o  (                    ), // we don't have a cluster
	  .async_cluster_events_wptr_o (                    ), // we don't have a cluster
	  .async_cluster_events_data_o (                    ), // we don't have a cluster
	  .async_data_slave_aw_wptr_i  ( '0                 ), // We don't have a cluster
	  .async_data_slave_aw_data_i  ( '0                 ), // We don't have a cluster
	  .async_data_slave_ar_wptr_i  ( '0                 ), // We don't have a cluster
	  .async_data_slave_ar_data_i  ( '0                 ), // We don't have a cluster
	  .async_data_slave_w_wptr_i   ( '0                 ), // We don't have a cluster
	  .async_data_slave_w_data_i   ( '0                 ), // We don't have a cluster
	  .async_data_slave_r_rptr_i   ( '0                 ), // We don't have a cluster
	  .async_data_slave_b_rptr_i   ( '0                 ), // We don't have a cluster
	  .async_data_master_aw_rptr_i ( '0                 ), // We don't have a cluster
	  .async_data_master_ar_rptr_i ( '0                 ), // We don't have a cluster
	  .async_data_master_w_rptr_i  ( '0                 ), // We don't have a cluster
	  .async_data_master_r_wptr_i  ( '0                 ), // We don't have a cluster
	  .async_data_master_r_data_i  ( '0                 ), // We don't have a cluster
	  .async_data_master_b_wptr_i  ( '0                 ), // We don't have a cluster
	  .async_data_master_b_data_i  ( '0                 ), // We don't have a cluster
	  .async_cluster_events_rptr_i ( '0                 )  // We don't have a cluster
	  );


	  soc_domain #(
		.CORE_TYPE          ( CORE_TYPE                  ),
		.USE_FPU            ( USE_FPU                    ),
		.USE_ZFINX          ( USE_ZFINX                  ),
		.USE_HWPE           ( USE_HWPE                   ),
		.AXI_ADDR_WIDTH     ( AXI_ADDR_WIDTH             ),
		.AXI_DATA_IN_WIDTH  ( AXI_CLUSTER_SOC_DATA_WIDTH ),
		.AXI_DATA_OUT_WIDTH ( AXI_SOC_CLUSTER_DATA_WIDTH ),
		.AXI_ID_IN_WIDTH    ( AXI_CLUSTER_SOC_ID_WIDTH   ),
		.AXI_USER_WIDTH     ( AXI_USER_WIDTH             ),
		.AXI_STRB_WIDTH_IN  ( AXI_CLUSTER_SOC_STRB_WIDTH ),
		.AXI_STRB_WIDTH_OUT ( AXI_SOC_CLUSTER_STRB_WIDTH ),
		.EVNT_WIDTH         ( EVENT_WIDTH                ),
		.CDC_FIFOS_LOG_DEPTH( 3                          ),
		.NB_CL_CORES        ( 0                          ),
		.N_UART             ( N_UART                     ),
		.N_SPI              ( N_SPI                      ),
		.N_I2C              ( N_I2C                      ),
		.SIM_STDOUT         ( SIM_STDOUT                 )
	 ) soc_domain_2 (
	
		  .ref_clk_i                   ( clock          ),
		  .slow_clk_i                  ( clock         ),
		  .test_clk_i                  ( clock         ),
	
		  .rstn_glob_i                 ( reset_n         ),
	
		  .mode_select_i               ( s_mode_select      ),
		  .dft_cg_enable_i             ( s_dft_cg_enable    ),
		  .dft_test_mode_i             ( s_test_mode        ),
	
		  .bootsel_i                   ( s_bootsel          ),
	
		  // we immediately start bootin g in the default setup
		  .fc_fetch_en_valid_i         ( 1'b1               ),
		  .fc_fetch_en_i               ( 1'b1               ),
	
		  .jtag_tck_i                  ( s_jtag_tck         ),
		  .jtag_trst_ni                ( s_jtag_trst        ),
		  .jtag_tms_i                  ( s_jtag_tms         ),
		  .jtag_tdi_i                  ( s_jtag_tdi         ),
		  .jtag_tdo_o                  (                    ),
	
		  .pad_cfg_o                   (                    ),
		  .pad_mux_o                   (                    ),
	
		  .gpio_in_i                   ( s_gpio_in          ),
		  .gpio_out_o                  (                    ),
		  .gpio_dir_o                  (                    ),
		  .gpio_cfg_o                  (                    ),
	
		  .uart_tx_o                   (                    ),
		  .uart_rx_i                   ( s_uart_rx          ),
	
		  .cam_clk_i                   ( s_cam_pclk         ),
		  .cam_data_i                  ( s_cam_data         ),
		  .cam_hsync_i                 ( s_cam_hsync        ),
		  .cam_vsync_i                 ( s_cam_vsync        ),
	
		  .timer_ch0_o                 (                    ),
		  .timer_ch1_o                 (                    ),
		  .timer_ch2_o                 (                    ),
		  .timer_ch3_o                 (                    ),
	
		  .i2c_scl_i                   ( s_i2c_scl_in       ),
		  .i2c_scl_o                   (                    ),
		  .i2c_scl_oe_o                (                    ),
		  .i2c_sda_i                   ( s_i2c_sda_in       ),
		  .i2c_sda_o                   (                    ),
		  .i2c_sda_oe_o                (                    ),
	
		  .i2s_slave_sd0_i             ( s_i2s_sd0_in       ),
		  .i2s_slave_sd1_i             ( s_i2s_sd1_in       ),
		  .i2s_slave_ws_i              ( s_i2s_ws_in        ),
		  .i2s_slave_ws_o              (                    ),
		  .i2s_slave_ws_oe             (                    ),
		  .i2s_slave_sck_i             ( s_i2s_sck_in       ),
		  .i2s_slave_sck_o             (                    ),
		  .i2s_slave_sck_oe            (                    ),
	
		  .spi_clk_o                   (                    ),
		  .spi_csn_o                   (                    ),
		  .spi_oen_o                   (                    ),
		  .spi_sdo_o                   (                    ),
		  .spi_sdi_i                   ( s_spi_sdi          ),
	
		  .sdio_clk_o                  (                    ),
		  .sdio_cmd_o                  (                    ),
		  .sdio_cmd_i                  ( s_sdio_cmdi        ),
		  .sdio_cmd_oen_o              (                    ),
		  .sdio_data_o                 (                    ),
		  .sdio_data_i                 ( s_sdio_datai       ),
		  .sdio_data_oen_o             (                    ),
	
		   // TODO: wire up if needed
		  .hyper_cs_no                 (                    ),
		  .hyper_ck_o                  (                    ),
		  .hyper_ck_no                 (                    ),
		  .hyper_rwds_o                (                    ),
		  .hyper_rwds_i                ( '0                 ),
		  .hyper_rwds_oe_o             (                    ),
		  .hyper_dq_i                  ( '0                 ),
		  .hyper_dq_o                  (                    ),
		  .hyper_dq_oe_o               (                    ),
		  .hyper_reset_no              (                    ),
	
		  .cluster_busy_i              ( s_cluster_busy     ),
		  .cluster_irq_o               (                    ),
	
		  .dma_pe_evt_ack_o            (                    ),
		  .dma_pe_evt_valid_i          ( s_dma_pe_evt_valid ),
		  .dma_pe_irq_ack_o            (                    ),
		  .dma_pe_irq_valid_i          ( s_dma_pe_irq_valid ),
		  .pf_evt_ack_o                (                    ),
		  .pf_evt_valid_i              ( s_pf_evt_valid     ),
	
		  .cluster_pow_o               (                    ),
		  .cluster_byp_o               (                    ),
	
	
		  .cluster_clk_o               (                    ),
		  .cluster_rstn_o              (                    ),
	
		  .cluster_rtc_o               (                    ),
		  .cluster_fetch_enable_o      (                    ),
		  .cluster_boot_addr_o         (                    ),
		  .cluster_test_en_o           (                    ),
		  .cluster_dbg_irq_valid_o     (                    ), // we dont' have a cluster
		  .async_data_slave_aw_rptr_o  (                    ), // we don't have a cluster
		  .async_data_slave_ar_rptr_o  (                    ), // we don't have a cluster
		  .async_data_slave_w_rptr_o   (                    ), // we don't have a cluster
		  .async_data_slave_r_wptr_o   (                    ), // we don't have a cluster
		  .async_data_slave_r_data_o   (                    ), // we don't have a cluster
		  .async_data_slave_b_wptr_o   (                    ), // we don't have a cluster
		  .async_data_slave_b_data_o   (                    ), // we don't have a cluster
		  .async_data_master_aw_wptr_o (                    ), // we don't have a cluster
		  .async_data_master_aw_data_o (                    ), // we don't have a cluster
		  .async_data_master_ar_wptr_o (                    ), // we don't have a cluster
		  .async_data_master_ar_data_o (                    ), // we don't have a cluster
		  .async_data_master_w_wptr_o  (                    ), // we don't have a cluster
		  .async_data_master_w_data_o  (                    ), // we don't have a cluster
		  .async_data_master_r_rptr_o  (                    ), // we don't have a cluster
		  .async_data_master_b_rptr_o  (                    ), // we don't have a cluster
		  .async_cluster_events_wptr_o (                    ), // we don't have a cluster
		  .async_cluster_events_data_o (                    ), // we don't have a cluster
		  .async_data_slave_aw_wptr_i  ( '0                 ), // We don't have a cluster
		  .async_data_slave_aw_data_i  ( '0                 ), // We don't have a cluster
		  .async_data_slave_ar_wptr_i  ( '0                 ), // We don't have a cluster
		  .async_data_slave_ar_data_i  ( '0                 ), // We don't have a cluster
		  .async_data_slave_w_wptr_i   ( '0                 ), // We don't have a cluster
		  .async_data_slave_w_data_i   ( '0                 ), // We don't have a cluster
		  .async_data_slave_r_rptr_i   ( '0                 ), // We don't have a cluster
		  .async_data_slave_b_rptr_i   ( '0                 ), // We don't have a cluster
		  .async_data_master_aw_rptr_i ( '0                 ), // We don't have a cluster
		  .async_data_master_ar_rptr_i ( '0                 ), // We don't have a cluster
		  .async_data_master_w_rptr_i  ( '0                 ), // We don't have a cluster
		  .async_data_master_r_wptr_i  ( '0                 ), // We don't have a cluster
		  .async_data_master_r_data_i  ( '0                 ), // We don't have a cluster
		  .async_data_master_b_wptr_i  ( '0                 ), // We don't have a cluster
		  .async_data_master_b_data_i  ( '0                 ), // We don't have a cluster
		  .async_cluster_events_rptr_i ( '0                 )  // We don't have a cluster
		  );

endmodule // miter_top
