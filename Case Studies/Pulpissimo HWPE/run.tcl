

#OPTIONS
set_read_hdl_option -golden -verilog_version sv2012 -verilog_include_path { \
    rtl/includes \
    ip/register_interface/include \
    ip/cluster_interconnect/rtl/low_latency_interco \
    ip/cluster_interconnect/rtl/peripheral_interco \
    ip/common_cells/include \
    ip/axi/include \
    ip/pulp_soc/rtl/include \
    ip/udma_qspi/rtl \
    ip/udma_i2c/rtl \
    ip/ibex/rtl \
    ip/ibex/vendor/lowrisc_ip/ip/prim/rtl \
    ip/hwpe-mac-engine/rtl \
    ip/cv32e40p/rtl/include \
    ip/cv32e40p/bhv \
    ip/apb_adv_timer/rtl \
    ip/adv_dbg_if/rtl \
    ip/hwpe-ctrl/rtl \
    ip/hwpe-ctrl/rtl \
    ip/udma_core/rtl \
    } \
  -verilog_define { \
    TARGET_RTL TARGET_SIMULATION TARGET_VSIM SYNTHESIS \
    }
    #TARGET_TEST

#TOP LEVEL RTL
read_verilog -golden  -version sv2012 {
  rtl/pulpissimo/jtag_tap_top.sv \
  rtl/pulpissimo/pad_control.sv \
  rtl/pulpissimo/pad_frame.sv \
  rtl/pulpissimo/pulpissimo.sv \
  rtl/pulpissimo/rtc_clock.sv \
  rtl/pulpissimo/rtc_date.sv \
  rtl/pulpissimo/safe_domain_reg_if.sv \
  rtl/pulpissimo/safe_domain.sv \
  rtl/pulpissimo/soc_domain.sv \
}

#TOP MITER
read_verilog -golden  -version sv2012 {
soc_top.sv \
}



#PULP SOC      ip/pulp_soc/rtl/components/tb_fs_handler.sv 
read_verilog -version sv2012 { \
  ip/pulp_soc/rtl/components/freq_meter.sv \
  ip/pulp_soc/rtl/components/glitch_free_clk_mux.sv \
  ip/pulp_soc/rtl/components/apb_dummy.sv \
  ip/pulp_soc/rtl/components/apb_clkdiv.sv \
  ip/pulp_soc/rtl/components/apb_soc_ctrl.sv \
  ip/pulp_soc/rtl/components/memory_models.sv \
  ip/pulp_soc/rtl/components/pulp_interfaces.sv \
  ip/pulp_soc/rtl/components/glitch_free_clk_mux.sv \
  ip/pulp_soc/rtl/components/scm_2048x32.sv \
  ip/pulp_soc/rtl/components/scm_512x32.sv \
  ip/pulp_soc/rtl/components/tcdm_arbiter_2x1.sv \
  ip/pulp_soc/rtl/components/obi_pulp_adapter.sv \
  ip/pulp_soc/rtl/fc/fc_demux.sv \
  ip/pulp_soc/rtl/fc/fc_subsystem.sv \
  ip/pulp_soc/rtl/fc/fc_hwpe.sv \
  ip/pulp_soc/rtl/fc/cv32e40p_fp_wrapper.sv \
  ip/pulp_soc/rtl/udma_subsystem/udma_subsystem.sv \
  ip/pulp_soc/rtl/pulp_soc/pkg_soc_interconnect.sv \
  ip/pulp_soc/rtl/pulp_soc/axi64_2_lint32_wrap.sv \
  ip/pulp_soc/rtl/pulp_soc/lint_2_axi_wrap.sv \
  ip/pulp_soc/rtl/pulp_soc/contiguous_crossbar.sv \
  ip/pulp_soc/rtl/pulp_soc/interleaved_crossbar.sv \
  ip/pulp_soc/rtl/pulp_soc/tcdm_demux.sv \
  ip/pulp_soc/rtl/pulp_soc/boot_rom.sv \
  ip/pulp_soc/rtl/pulp_soc/l2_ram_multi_bank.sv \
  ip/pulp_soc/rtl/pulp_soc/lint_jtag_wrap.sv \
  ip/pulp_soc/rtl/pulp_soc/periph_bus_wrap.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_clk_rst_gen.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_event_arbiter.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_event_generator.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_event_queue.sv \
  ip/pulp_soc/rtl/pulp_soc/tcdm_error_slave.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_interconnect.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_interconnect_wrap.sv \
  ip/pulp_soc/rtl/pulp_soc/soc_peripherals.sv \
  ip/pulp_soc/rtl/pulp_soc/pulp_soc.sv \
}

#udma_uart
read_verilog -version sv2012 { \
  ip/udma_uart/rtl/udma_uart_reg_if.sv \
  ip/udma_uart/rtl/udma_uart_rx.sv \
  ip/udma_uart/rtl/udma_uart_tx.sv \
  ip/udma_uart/rtl/udma_uart_top.sv \
}
#udma_sdio
read_verilog -version sv2012 { \
  ip/udma_sdio/rtl/sdio_crc16.sv \
  ip/udma_sdio/rtl/sdio_crc7.sv \
  ip/udma_sdio/rtl/udma_sdio_reg_if.sv \
  ip/udma_sdio/rtl/sdio_txrx_cmd.sv \
  ip/udma_sdio/rtl/sdio_txrx_data.sv \
  ip/udma_sdio/rtl/sdio_txrx.sv \
  ip/udma_sdio/rtl/udma_sdio_top.sv \
}
#udma_qspi
read_verilog -version sv2012 { \
  ip/udma_qspi/rtl/udma_spim_ctrl.sv \
  ip/udma_qspi/rtl/udma_spim_reg_if.sv \
  ip/udma_qspi/rtl/udma_spim_txrx.sv \
  ip/udma_qspi/rtl/udma_spim_top.sv \
}
#udma_i2s
read_verilog -version sv2012 { \
  ip/udma_i2s/rtl/cic_comb.sv \
  ip/udma_i2s/rtl/cic_integrator.sv \
  ip/udma_i2s/rtl/i2s_clk_gen.sv \
  ip/udma_i2s/rtl/i2s_rx_channel.sv \
  ip/udma_i2s/rtl/i2s_tx_channel.sv \
  ip/udma_i2s/rtl/i2s_ws_gen.sv \
  ip/udma_i2s/rtl/udma_i2s_reg_if.sv \
  ip/udma_i2s/rtl/cic_top.sv \
  ip/udma_i2s/rtl/i2s_clkws_gen.sv \
  ip/udma_i2s/rtl/pdm_top.sv \
  ip/udma_i2s/rtl/i2s_txrx.sv \
  ip/udma_i2s/rtl/udma_i2s_top.sv \
}
#udma_i2c
read_verilog -version sv2012 { \
  ip/udma_i2c/rtl/udma_i2c_bus_ctrl.sv \
  ip/udma_i2c/rtl/udma_i2c_reg_if.sv \
  ip/udma_i2c/rtl/udma_i2c_control.sv \
  ip/udma_i2c/rtl/udma_i2c_top.sv \
}
#udma_hyper
read_verilog -version sv2012 { \
  ip/udma_hyper/udma-hyperbus/src/cdc_fifo_gray_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/graycode_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/clock_diff_out.sv \
  ip/udma_hyper/udma-hyperbus/src/clk_gen_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/onehot_to_bin_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/ddr_out.sv \
  ip/udma_hyper/udma-hyperbus/src/hyperbus_delay_line.sv \
  ip/udma_hyper/udma-hyperbus/src/read_clk_rwds.sv \
  ip/udma_hyper/udma-hyperbus/src/hyperbus_phy.sv \
  ip/udma_hyper/udma-hyperbus/src/cmd_addr_gen.sv \
  ip/udma_hyper/udma-hyperbus/src/ddr_in.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_reg_if_common.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_reg_if_mulid.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_rxbuffer.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_txbuffer.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_ctrl.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyperbus_mulid.sv \
  ip/udma_hyper/udma-hyperbus/src/hyper_unpack.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_cfg_outbuff.sv \
  ip/udma_hyper/udma-hyperbus/src/hyperbus_mux_generic.sv \
  ip/udma_hyper/udma-hyperbus/src/hyper_twd_trans_spliter.sv \
  ip/udma_hyper/udma-hyperbus/src/hyper_rr_flag_req.sv \
  ip/udma_hyper/udma-hyperbus/src/hyper_arbiter.sv \
  ip/udma_hyper/udma-hyperbus/src/hyper_arb_primitive.sv \
  ip/udma_hyper/udma-hyperbus/src/io_generic_fifo_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_dc_fifo_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/dc_token_ring_fifo_din_hyper.v \
  ip/udma_hyper/udma-hyperbus/src/dc_token_ring_fifo_dout_hyper.v \
  ip/udma_hyper/udma-hyperbus/src/dc_token_ring_hyper.v \
  ip/udma_hyper/udma-hyperbus/src/dc_data_buffer_hyper.sv \
  ip/udma_hyper/udma-hyperbus/src/dc_full_detector_hyper.v \
  ip/udma_hyper/udma-hyperbus/src/dc_synchronizer_hyper.v \
  ip/udma_hyper/udma-hyperbus/src/udma_cmd_queue.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_busy.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_busy_phy.sv \
  ip/udma_hyper/udma-hyperbus/src/udma_hyper_top.sv \
}
#udma_filter
read_verilog -version sv2012 { \
  ip/udma_filter/rtl/udma_filter_au.sv \
  ip/udma_filter/rtl/udma_filter_bincu.sv \
  ip/udma_filter/rtl/udma_filter_reg_if.sv \
  ip/udma_filter/rtl/udma_filter_rx_dataout.sv \
  ip/udma_filter/rtl/udma_filter_tx_datafetch.sv \
  ip/udma_filter/rtl/udma_filter.sv \
}
#udma_external_per
read_verilog -version sv2012 { \
  ip/udma_external_per/rtl/udma_external_per_reg_if.sv \
  ip/udma_external_per/rtl/udma_traffic_gen_rx.sv \
  ip/udma_external_per/rtl/udma_traffic_gen_tx.sv \
  ip/udma_external_per/rtl/udma_external_per_top.sv \
  ip/udma_external_per/rtl/udma_external_per_wrapper.sv \
}
#udma_camera
read_verilog -version sv2012 { \
  ip/udma_camera/rtl/camera_reg_if.sv \
  ip/udma_camera/rtl/camera_if.sv \
}
#timer_unit
read_verilog -version sv2012 { \
  ip/timer_unit/rtl/timer_unit_counter.sv \
  ip/timer_unit/rtl/timer_unit_counter_presc.sv \
  ip/timer_unit/rtl/apb_timer_unit.sv \
  ip/timer_unit/rtl/timer_unit.sv \
}
#scm
#   ip/scm/latch_scm/register_file_1r_1w_test_wrap.sv \
#   ip/scm/latch_scm/register_file_1r_1w_all_test_wrap.sv \
#   ip/scm/latch_scm/register_file_2r_1w_asymm_test_wrap.sv
read_verilog -version sv2012 { \
  ip/scm/latch_scm/register_file_1w_64b_multi_port_read_32b_1row.sv \
  ip/scm/latch_scm/register_file_1w_multi_port_read_1row.sv \
  ip/scm/latch_scm/register_file_1r_1w_all.sv \
  ip/scm/latch_scm/register_file_1r_1w_be.sv \
  ip/scm/latch_scm/register_file_1r_1w.sv \
  ip/scm/latch_scm/register_file_1r_1w_1row.sv \
  ip/scm/latch_scm/register_file_1w_128b_multi_port_read_32b.sv \
  ip/scm/latch_scm/register_file_1w_64b_multi_port_read_32b.sv \
  ip/scm/latch_scm/register_file_1w_64b_1r_32b.sv \
  ip/scm/latch_scm/register_file_1w_multi_port_read_be.sv \
  ip/scm/latch_scm/register_file_1w_multi_port_read.sv \
  ip/scm/latch_scm/register_file_2r_1w_asymm.sv \
  ip/scm/latch_scm/register_file_2r_2w.sv \
  ip/scm/latch_scm/register_file_3r_2w.sv \
  ip/scm/latch_scm/register_file_3r_2w_be.sv \
  ip/scm/latch_scm/register_file_multi_way_1w_64b_multi_port_read_32b.sv \
  ip/scm/latch_scm/register_file_multi_way_1w_multi_port_read.sv \
}
#riscv-dbg (kanskje og  ip/riscv-dbg/src/dmi_test.sv \)   #ip/riscv-dbg/tb/jtag_dmi/tb_jtag_dmi.sv    ip/riscv-dbg/tb/jtag_dmi/jtag_intf.sv   ip/riscv-dbg/tb/jtag_dmi/jtag_test.sv 
read_verilog -version sv2012 { \
  ip/riscv-dbg/src/dm_pkg.sv \
  ip/riscv-dbg/src/dmi_intf.sv \
  ip/riscv-dbg/src/dm_sba.sv \
  ip/riscv-dbg/src/dm_top.sv \
  ip/riscv-dbg/src/dmi_jtag.sv \
  ip/riscv-dbg/src/dm_obi_top.sv \
  ip/riscv-dbg/src/dmi_jtag_tap.sv \
  ip/riscv-dbg/debug_rom/debug_rom.sv \
  ip/riscv-dbg/debug_rom/debug_rom_one_scratch.sv \
  ip/riscv-dbg/src/dm_csrs.sv \
  ip/riscv-dbg/src/dm_mem.sv \
  ip/riscv-dbg/src/dmi_cdc.sv \
}
#register_interface
#  ip/register_interface/src/reg_test.sv
read_verilog -version sv2012 { \
  ip/register_interface/src/reg_intf.sv \
  ip/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv \
  ip/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv \
  ip/register_interface/src/apb_to_reg.sv \
  ip/register_interface/src/axi_to_reg.sv \
  ip/register_interface/src/periph_to_reg.sv \
  ip/register_interface/src/reg_cdc.sv \
  ip/register_interface/src/reg_demux.sv \
  ip/register_interface/src/reg_mux.sv \
  ip/register_interface/src/reg_to_mem.sv \
  ip/register_interface/src/reg_uniform.sv \
  ip/register_interface/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv \
  ip/register_interface/vendor/lowrisc_opentitan/src/prim_subreg.sv \
  ip/register_interface/src/axi_lite_to_reg.sv \
}
#l2_tcdm_hybrid_interco
read_verilog -version sv2012 { \
  ip/l2_tcdm_hybrid_interco/RTL/l2_tcdm_demux.sv \
  ip/l2_tcdm_hybrid_interco/RTL/lint_2_apb.sv \
  ip/l2_tcdm_hybrid_interco/RTL/lint_2_axi.sv \
  ip/l2_tcdm_hybrid_interco/RTL/axi_2_lint/axi64_2_lint32.sv \
  ip/l2_tcdm_hybrid_interco/RTL/axi_2_lint/axi_read_ctrl.sv \
  ip/l2_tcdm_hybrid_interco/RTL/axi_2_lint/axi_write_ctrl.sv \
  ip/l2_tcdm_hybrid_interco/RTL/axi_2_lint/lint64_to_32.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/AddressDecoder_Req_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/AddressDecoder_Resp_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/ArbitrationTree_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/FanInPrimitive_Req_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/FanInPrimitive_Resp_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/MUX2_REQ_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/RequestBlock_L2_1CH.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/RequestBlock_L2_2CH.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/ResponseBlock_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/ResponseTree_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/RR_Flag_Req_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_L2/XBAR_L2.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/AddressDecoder_Req_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/AddressDecoder_Resp_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ArbitrationTree_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/FanInPrimitive_Req_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/FanInPrimitive_Resp_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/MUX2_REQ_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RequestBlock1CH_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RequestBlock2CH_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ResponseBlock_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/ResponseTree_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/RR_Flag_Req_BRIDGE.sv \
  ip/l2_tcdm_hybrid_interco/RTL/XBAR_BRIDGE/XBAR_BRIDGE.sv \
}
#jtag_pulp
read_verilog -version sv2012 { \
  ip/jtag_pulp/src/bscell.sv \
  ip/jtag_pulp/src/jtag_axi_wrap.sv \
  ip/jtag_pulp/src/jtag_enable.sv \
  ip/jtag_pulp/src/jtag_enable_synch.sv \
  ip/jtag_pulp/src/jtagreg.sv \
  ip/jtag_pulp/src/jtag_rst_synch.sv \
  ip/jtag_pulp/src/jtag_sync.sv \
  ip/jtag_pulp/src/tap_top.v \
}
#ibex
#  ip/ibex/rtl/ibex_register_file_fpga.sv 
read_verilog -version sv2012 { \
  ip/ibex/rtl/ibex_pkg.sv \
  ip/ibex/rtl/ibex_register_file_ff.sv \
  ip/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv \
  ip/ibex/rtl/ibex_alu.sv \
  ip/ibex/rtl/ibex_compressed_decoder.sv \
  ip/ibex/rtl/ibex_controller.sv \
  ip/ibex/rtl/ibex_counter.sv \
  ip/ibex/rtl/ibex_csr.sv \
  ip/ibex/rtl/ibex_decoder.sv \
  ip/ibex/rtl/ibex_fetch_fifo.sv \
  ip/ibex/rtl/ibex_load_store_unit.sv \
  ip/ibex/rtl/ibex_multdiv_fast.sv \
  ip/ibex/rtl/ibex_multdiv_slow.sv \
  ip/ibex/rtl/ibex_pmp.sv \
  ip/ibex/rtl/ibex_tracer_pkg.sv \
  ip/ibex/rtl/ibex_wb_stage.sv \
  ip/ibex/rtl/ibex_cs_registers.sv \
  ip/ibex/rtl/ibex_ex_block.sv \
  ip/ibex/rtl/ibex_id_stage.sv \
  ip/ibex/rtl/ibex_prefetch_buffer.sv \
  ip/ibex/rtl/ibex_tracer.sv \
  ip/ibex/rtl/ibex_if_stage.sv \
  ip/ibex/rtl/ibex_core.sv \
  ip/ibex/rtl/ibex_core_tracing.sv \
  ip/ibex/rtl/ibex_register_file_latch.sv \
  ip/ibex/rtl/ibex_register_file_ff.sv \
}
#hwpe-mac-engine
read_verilog -version sv2012 { \
  ip/hwpe-mac-engine/rtl/mac_package.sv \
  ip/hwpe-mac-engine/rtl/mac_engine.sv \
  ip/hwpe-mac-engine/rtl/mac_fsm.sv \
  ip/hwpe-mac-engine/rtl/mac_streamer.sv \
  ip/hwpe-mac-engine/rtl/mac_ctrl.sv \
  ip/hwpe-mac-engine/rtl/mac_top.sv \
  ip/hwpe-mac-engine/wrap/mac_top_wrap.sv \
}
#generic_fll
read_vhdl -version 2008 { \
  ip/generic_fll/fe/rtl/FLLPkg.vhd \
  ip/generic_fll/fe/rtl/FLL_clk_divider.vhd \
  ip/generic_fll/fe/rtl/FLL_clk_period_quantizer.vhd \
  ip/generic_fll/fe/rtl/FLL_clock_gated.rtl.vhd \
  ip/generic_fll/fe/rtl/FLL_digital.vhd \
  ip/generic_fll/fe/rtl/FLL_dither_pattern_gen.vhd \
  ip/generic_fll/fe/rtl/FLL_glitchfree_clkdiv.vhd \
  ip/generic_fll/fe/rtl/FLL_glitchfree_clkmux.vhd \
  ip/generic_fll/fe/rtl/FLL_mux.rtl.vhd \
  ip/generic_fll/fe/rtl/FLL_loop_filter.vhd \
  ip/generic_fll/fe/rtl/FLL_reg.vhd \
  ip/generic_fll/fe/rtl/FLL_settling_monitor.vhd \
  ip/generic_fll/fe/rtl/FLL_synchroedge.vhd \
  ip/generic_fll/fe/rtl/FLL_zerodelta.vhd \
}
#ip/generic_fll/fe/model/gf22_DCO_model.tc.vhd \
  ip/generic_fll/fe/model/gf22_FLL_model.vhd \
}
#cv32e40p
read_verilog -version sv2012 { \
  ip/cv32e40p/bhv/include/cv32e40p_tracer_pkg.sv \
  ip/cv32e40p/bhv/cv32e40p_wrapper.sv \
  ip/cv32e40p/bhv/cv32e40p_sim_clock_gate.sv \
  ip/cv32e40p/rtl/cv32e40p_register_file_latch.sv \
  ip/cv32e40p/rtl/include/cv32e40p_apu_core_pkg.sv \
  ip/cv32e40p/rtl/include/cv32e40p_fpu_pkg.sv \
  ip/cv32e40p/rtl/include/cv32e40p_pkg.sv \
  ip/cv32e40p/rtl/cv32e40p_alu.sv \
  ip/cv32e40p/rtl/cv32e40p_alu_div.sv \
  ip/cv32e40p/rtl/cv32e40p_aligner.sv \
  ip/cv32e40p/rtl/cv32e40p_compressed_decoder.sv \
  ip/cv32e40p/rtl/cv32e40p_controller.sv \
  ip/cv32e40p/rtl/cv32e40p_cs_registers.sv \
  ip/cv32e40p/rtl/cv32e40p_decoder.sv \
  ip/cv32e40p/rtl/cv32e40p_int_controller.sv \
  ip/cv32e40p/rtl/cv32e40p_ex_stage.sv \
  ip/cv32e40p/rtl/cv32e40p_fifo.sv \
  ip/cv32e40p/rtl/cv32e40p_hwloop_regs.sv \
  ip/cv32e40p/rtl/cv32e40p_id_stage.sv \
  ip/cv32e40p/rtl/cv32e40p_if_stage.sv \
  ip/cv32e40p/rtl/cv32e40p_load_store_unit.sv \
  ip/cv32e40p/rtl/cv32e40p_mult.sv \
  ip/cv32e40p/rtl/cv32e40p_prefetch_buffer.sv \
  ip/cv32e40p/rtl/cv32e40p_prefetch_controller.sv \
  ip/cv32e40p/rtl/cv32e40p_obi_interface.sv \
  ip/cv32e40p/rtl/cv32e40p_core.sv \
  ip/cv32e40p/rtl/cv32e40p_apu_disp.sv \
  ip/cv32e40p/rtl/cv32e40p_popcnt.sv \
  ip/cv32e40p/rtl/cv32e40p_ff_one.sv \
  ip/cv32e40p/rtl/cv32e40p_sleep_unit.sv \
}
#cluster_interconnect
read_verilog -version sv2012 { \
  ip/cluster_interconnect/rtl/tcdm_interconnect/tcdm_interconnect_pkg.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/addr_dec_resp_mux.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/amo_shim.sv \
  ip/cluster_interconnect/rtl/variable_latency_interconnect/addr_decoder.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/xbar.sv \
  ip/cluster_interconnect/rtl/variable_latency_interconnect/simplex_xbar.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/clos_net.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/bfly_net.sv \
  ip/cluster_interconnect/rtl/variable_latency_interconnect/full_duplex_xbar.sv \
  ip/cluster_interconnect/rtl/tcdm_interconnect/tcdm_interconnect.sv \
  ip/cluster_interconnect/rtl/variable_latency_interconnect/variable_latency_bfly_net.sv \
  ip/cluster_interconnect/rtl/variable_latency_interconnect/variable_latency_interconnect.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Req.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/ArbitrationTree.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/MUX2_REQ.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Resp.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/TestAndSet.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/RequestBlock2CH.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/RequestBlock1CH.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/FanInPrimitive_Resp.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/ResponseTree.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/ResponseBlock.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/AddressDecoder_Req.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/XBAR_TCDM_WRAPPER.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_REQ.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/TCDM_PIPE_RESP.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/grant_mask.sv \
  ip/cluster_interconnect/rtl/low_latency_interco/priority_Flag_Req.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_PE_Req.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/AddressDecoder_Resp_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/ArbitrationTree_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_Req_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/RR_Flag_Req_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/MUX2_REQ_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/FanInPrimitive_PE_Resp.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/RequestBlock1CH_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/RequestBlock2CH_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/ResponseBlock_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/ResponseTree_PE.sv \
  ip/cluster_interconnect/rtl/peripheral_interco/XBAR_PE.sv \
}
#axi_slice
read_verilog -version sv2012 { \
  ip/axi_slice/src/axi_single_slice.sv \
  ip/axi_slice/src/axi_ar_buffer.sv \
  ip/axi_slice/src/axi_aw_buffer.sv \
  ip/axi_slice/src/axi_b_buffer.sv \
  ip/axi_slice/src/axi_r_buffer.sv \
  ip/axi_slice/src/axi_slice.sv \
  ip/axi_slice/src/axi_w_buffer.sv \
  ip/axi_slice/src/axi_slice_wrap.sv \
}
#apb_node
read_verilog -version sv2012 { \
  ip/apb_node/src/apb_node.sv \
  ip/apb_node/src/apb_node_wrap.sv \
}
#apb_interrupt_cntrl
read_verilog -version sv2012 { \
  ip/apb_interrupt_cntrl/apb_interrupt_cntrl.sv \
}
#apb_gpio
read_verilog -version sv2012 { \
  ip/apb_gpio/rtl/apb_gpio.sv \
}
#apb_fll_if
#  ip/apb_fll_if/test/apb_fll_tb.sv 
read_verilog -version sv2012 { \
  ip/apb_fll_if/src/fll_intf.sv \
  ip/apb_fll_if/src/apb_fll_if.sv \
  ip/apb_fll_if/src/apb_to_fll.sv \
}
#apb_adv_timer
read_verilog -version sv2012 { \
  ip/apb_adv_timer/rtl/adv_timer_apb_if.sv \
  ip/apb_adv_timer/rtl/comparator.sv \
  ip/apb_adv_timer/rtl/input_stage.sv \
  ip/apb_adv_timer/rtl/lut_4x4.sv \
  ip/apb_adv_timer/rtl/out_filter.sv \
  ip/apb_adv_timer/rtl/prescaler.sv \
  ip/apb_adv_timer/rtl/timer_cntrl.sv \
  ip/apb_adv_timer/rtl/up_down_counter.sv \
  ip/apb_adv_timer/rtl/timer_module.sv \
  ip/apb_adv_timer/rtl/apb_adv_timer.sv \
}
#apb2per
read_verilog -version sv2012 { \
  ip/apb2per/apb2per.sv \
}
#adv_dbg_if
read_verilog -version sv2012 { \
  ip/adv_dbg_if/rtl/adbg_axi_module.sv \
  ip/adv_dbg_if/rtl/adbg_lint_biu.sv \
  ip/adv_dbg_if/rtl/adbg_lint_module.sv \
  ip/adv_dbg_if/rtl/adbg_crc32.v \
  ip/adv_dbg_if/rtl/adbg_or1k_biu.sv \
  ip/adv_dbg_if/rtl/adbg_or1k_module.sv \
  ip/adv_dbg_if/rtl/adbg_or1k_status_reg.sv \
  ip/adv_dbg_if/rtl/adbg_top.sv \
  ip/adv_dbg_if/rtl/bytefifo.v \
  ip/adv_dbg_if/rtl/syncflop.v \
  ip/adv_dbg_if/rtl/syncreg.v \
  ip/adv_dbg_if/rtl/adbg_tap_top.v \
  ip/adv_dbg_if/rtl/adv_dbg_if.sv \
  ip/adv_dbg_if/rtl/adbg_axionly_top.sv \
  ip/adv_dbg_if/rtl/adbg_lintonly_top.sv \
}
#udma_core
read_verilog -version sv2012 { \
  ip/udma_core/rtl/common/io_clk_gen.sv \
  ip/udma_core/rtl/common/io_event_counter.sv \
  ip/udma_core/rtl/common/io_generic_fifo.sv \
  ip/udma_core/rtl/common/io_shiftreg.sv \
  ip/udma_core/rtl/common/udma_apb_if.sv \
  ip/udma_core/rtl/common/udma_clk_div_cnt.sv \
  ip/udma_core/rtl/common/udma_ctrl.sv \
  ip/udma_core/rtl/common/udma_dc_fifo.sv \
  ip/udma_core/rtl/core/udma_arbiter.sv \
  ip/udma_core/rtl/core/udma_ch_addrgen.sv \
  ip/udma_core/rtl/common/io_tx_fifo.sv \
  ip/udma_core/rtl/common/io_tx_fifo_dc.sv \
  ip/udma_core/rtl/common/io_tx_fifo_mark.sv \
  ip/udma_core/rtl/common/udma_clkgen.sv \
  ip/udma_core/rtl/core/udma_tx_channels.sv \
  ip/udma_core/rtl/core/udma_stream_unit.sv \
  ip/udma_core/rtl/core/udma_rx_channels.sv \
  ip/udma_core/rtl/core/udma_core.sv \
}
#hwpe-stream
#  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_scm_test_wrap.sv 
read_verilog -version sv2012 { \
  ip/hwpe-stream/rtl/hwpe_stream_interfaces.sv \
  ip/hwpe-stream/rtl/hwpe_stream_package.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_assign.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_buffer.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_demux_static.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_deserialize.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_fence.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_merge.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_mux_static.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_serialize.sv \
  ip/hwpe-stream/rtl/basic/hwpe_stream_split.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_ctrl.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_scm.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_addressgen.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_addressgen_v2.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_addressgen_v3.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_sink_realign.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_source_realign.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_strbgen.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_streamer_queue.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_assign.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_mux.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_mux_static.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_reorder.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_reorder_static.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_earlystall.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_earlystall_sidech.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo_sidech.sv \
  ip/hwpe-stream/rtl/fifo/hwpe_stream_fifo.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_load_sidech.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_source.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_load.sv \
  ip/hwpe-stream/rtl/tcdm/hwpe_stream_tcdm_fifo_store.sv \
  ip/hwpe-stream/rtl/streamer/hwpe_stream_sink.sv \
}
#hwpe-ctrl
#  ip/hwpe-ctrl/rtl/hwpe_ctrl_regfile_latch_test_wrap.sv
read_verilog -version sv2012 { \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_interfaces.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_package.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_regfile_latch.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_seq_mult.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_uloop.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_regfile.sv \
  ip/hwpe-ctrl/rtl/hwpe_ctrl_slave.sv \
}
#fpnew
read_verilog -version sv2012 { \
  ip/fpnew/src/fpnew_pkg.sv \
  ip/fpnew/src/fpnew_cast_multi.sv \
  ip/fpnew/src/fpnew_classifier.sv \
  ip/fpnew/src/fpnew_divsqrt_multi.sv \
  ip/fpnew/src/fpnew_fma.sv \
  ip/fpnew/src/fpnew_fma_multi.sv \
  ip/fpnew/src/fpnew_noncomp.sv \
  ip/fpnew/src/fpnew_opgroup_block.sv \
  ip/fpnew/src/fpnew_opgroup_fmt_slice.sv \
  ip/fpnew/src/fpnew_opgroup_multifmt_slice.sv \
  ip/fpnew/src/fpnew_rounding.sv \
  ip/fpnew/src/fpnew_top.sv \
}
#axi
#  ip/axi/test/tb_axi_dw_pkg.sv \
#  ip/axi/test/tb_axi_xbar_pkg.sv \
#  ip/axi/test/tb_axi_addr_test.sv \
#  ip/axi/test/tb_axi_atop_filter.sv \
#  ip/axi/test/tb_axi_cdc.sv \
#  ip/axi/test/tb_axi_delayer.sv \
#  ip/axi/test/tb_axi_dw_downsizer.sv \
#  ip/axi/test/tb_axi_dw_upsizer.sv \
#  ip/axi/test/tb_axi_isolate.sv \
#  ip/axi/test/tb_axi_lite_mailbox.sv \
#  ip/axi/test/tb_axi_lite_regs.sv \
#  ip/axi/test/tb_axi_lite_to_apb.sv \
#  ip/axi/test/tb_axi_lite_to_axi.sv \
#  ip/axi/test/tb_axi_lite_xbar.sv \
#  ip/axi/test/tb_axi_modify_address.sv \
#  ip/axi/test/tb_axi_serializer.sv \
#  ip/axi/test/tb_axi_sim_mem.sv \
#  ip/axi/test/tb_axi_to_axi_lite.sv \
#  ip/axi/test/tb_axi_xbar.sv \
#  ip/axi/src/axi_test.sv 
read_verilog -version sv2012 { \
  ip/axi/src/axi_sim_mem.sv \
  ip/axi/src/axi_pkg.sv \
  ip/axi/src/axi_intf.sv \
  ip/axi/src/axi_atop_filter.sv \
  ip/axi/src/axi_burst_splitter.sv \
  ip/axi/src/axi_cdc_dst.sv \
  ip/axi/src/axi_cdc_src.sv \
  ip/axi/src/axi_cut.sv \
  ip/axi/src/axi_delayer.sv \
  ip/axi/src/axi_demux.sv \
  ip/axi/src/axi_dw_downsizer.sv \
  ip/axi/src/axi_dw_upsizer.sv \
  ip/axi/src/axi_id_prepend.sv \
  ip/axi/src/axi_isolate.sv \
  ip/axi/src/axi_join.sv \
  ip/axi/src/axi_lite_demux.sv \
  ip/axi/src/axi_lite_join.sv \
  ip/axi/src/axi_lite_mailbox.sv \
  ip/axi/src/axi_lite_mux.sv \
  ip/axi/src/axi_lite_regs.sv \
  ip/axi/src/axi_lite_to_apb.sv \
  ip/axi/src/axi_lite_to_axi.sv \
  ip/axi/src/axi_modify_address.sv \
  ip/axi/src/axi_mux.sv \
  ip/axi/src/axi_serializer.sv \
  ip/axi/src/axi_cdc.sv \
  ip/axi/src/axi_err_slv.sv \
  ip/axi/src/axi_dw_converter.sv \
  ip/axi/src/axi_multicut.sv \
  ip/axi/src/axi_to_axi_lite.sv \
  ip/axi/src/axi_lite_xbar.sv \
  ip/axi/src/axi_xbar.sv \
}
#apb_intf
read_verilog -version sv2012 { \
  ip/apb/src/apb_intf.sv \
}
#fpu_div_sqrt_mvp
read_verilog -version sv2012 { \
  ip/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/control_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv \
  ip/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv \
}
#common_cells
#   ip/common_cells/test/addr_decode_tb.sv \
#   ip/common_cells/test/cb_filter_tb.sv \
#   ip/common_cells/test/cdc_2phase_tb.sv \
#   ip/common_cells/test/cdc_2phase_clearable_tb.sv \
#   ip/common_cells/test/cdc_fifo_tb.sv \
#   ip/common_cells/test/cdc_fifo_clearable_tb.sv \
#   ip/common_cells/test/fifo_tb.sv \
#   ip/common_cells/test/graycode_tb.sv \
#   ip/common_cells/test/id_queue_tb.sv \
#   ip/common_cells/test/popcount_tb.sv \
#   ip/common_cells/test/rr_arb_tree_tb.sv \
#   ip/common_cells/test/stream_test.sv \
#   ip/common_cells/test/stream_register_tb.sv \
#   ip/common_cells/test/stream_to_mem_tb.sv \
#   ip/common_cells/test/sub_per_hash_tb.sv \
#   ip/common_cells/test/isochronous_crossing_tb.sv \
#   ip/common_cells/test/stream_omega_net_tb.sv \
#   ip/common_cells/test/stream_xbar_tb.sv \
#   ip/common_cells/test/clk_int_div_tb.sv 
read_verilog -version sv2012 { \
  ip/common_cells/src/deprecated/clock_divider_counter.sv \
  ip/common_cells/src/deprecated/clk_div.sv \
  ip/common_cells/src/deprecated/find_first_one.sv \
  ip/common_cells/src/deprecated/generic_LFSR_8bit.sv \
  ip/common_cells/src/deprecated/generic_fifo.sv \
  ip/common_cells/src/deprecated/prioarbiter.sv \
  ip/common_cells/src/deprecated/pulp_sync.sv \
  ip/common_cells/src/deprecated/pulp_sync_wedge.sv \
  ip/common_cells/src/deprecated/rrarbiter.sv \
  ip/common_cells/src/deprecated/clock_divider.sv \
  ip/common_cells/src/deprecated/fifo_v2.sv \
  ip/common_cells/src/deprecated/fifo_v1.sv \
  ip/common_cells/src/edge_propagator_ack.sv \
  ip/common_cells/src/edge_propagator.sv \
  ip/common_cells/src/edge_propagator_rx.sv \
  ip/common_cells/src/deprecated/sram.sv \
  ip/common_cells/src/binary_to_gray.sv \
  ip/common_cells/src/cb_filter_pkg.sv \
  ip/common_cells/src/cc_onehot.sv \
  ip/common_cells/src/cf_math_pkg.sv \
  ip/common_cells/src/clk_int_div.sv \
  ip/common_cells/src/delta_counter.sv \
  ip/common_cells/src/ecc_pkg.sv \
  ip/common_cells/src/edge_propagator_tx.sv \
  ip/common_cells/src/exp_backoff.sv \
  ip/common_cells/src/fifo_v3.sv \
  ip/common_cells/src/gray_to_binary.sv \
  ip/common_cells/src/isochronous_4phase_handshake.sv \
  ip/common_cells/src/isochronous_spill_register.sv \
  ip/common_cells/src/lfsr.sv \
  ip/common_cells/src/lfsr_16bit.sv \
  ip/common_cells/src/lfsr_8bit.sv \
  ip/common_cells/src/mv_filter.sv \
  ip/common_cells/src/onehot_to_bin.sv \
  ip/common_cells/src/plru_tree.sv \
  ip/common_cells/src/popcount.sv \
  ip/common_cells/src/rr_arb_tree.sv \
  ip/common_cells/src/rstgen_bypass.sv \
  ip/common_cells/src/serial_deglitch.sv \
  ip/common_cells/src/shift_reg.sv \
  ip/common_cells/src/spill_register_flushable.sv \
  ip/common_cells/src/stream_demux.sv \
  ip/common_cells/src/stream_filter.sv \
  ip/common_cells/src/stream_fork.sv \
  ip/common_cells/src/stream_intf.sv \
  ip/common_cells/src/stream_join.sv \
  ip/common_cells/src/stream_mux.sv \
  ip/common_cells/src/sub_per_hash.sv \
  ip/common_cells/src/sync.sv \
  ip/common_cells/src/sync_wedge.sv \
  ip/common_cells/src/unread.sv \
  ip/common_cells/src/cdc_reset_ctrlr_pkg.sv \
  ip/common_cells/src/cdc_2phase.sv \
  ip/common_cells/src/cdc_4phase.sv \
  ip/common_cells/src/addr_decode.sv \
  ip/common_cells/src/cb_filter.sv \
  ip/common_cells/src/cdc_fifo_2phase.sv \
  ip/common_cells/src/counter.sv \
  ip/common_cells/src/ecc_decode.sv \
  ip/common_cells/src/ecc_encode.sv \
  ip/common_cells/src/edge_detect.sv \
  ip/common_cells/src/lzc.sv \
  ip/common_cells/src/max_counter.sv \
  ip/common_cells/src/rstgen.sv \
  ip/common_cells/src/spill_register.sv \
  ip/common_cells/src/stream_delay.sv \
  ip/common_cells/src/stream_fifo.sv \
  ip/common_cells/src/stream_fork_dynamic.sv \
  ip/common_cells/src/cdc_reset_ctrlr.sv \
  ip/common_cells/src/cdc_fifo_gray.sv \
  ip/common_cells/src/fall_through_register.sv \
  ip/common_cells/src/id_queue.sv \
  ip/common_cells/src/stream_to_mem.sv \
  ip/common_cells/src/stream_arbiter_flushable.sv \
  ip/common_cells/src/stream_register.sv \
  ip/common_cells/src/stream_xbar.sv \
  ip/common_cells/src/cdc_fifo_gray_clearable.sv \
  ip/common_cells/src/cdc_2phase_clearable.sv \
  ip/common_cells/src/stream_arbiter.sv \
  ip/common_cells/src/stream_omega_net.sv \
}
#tech_cells_generic   ip/tech_cells_generic/test/tb_tc_sram.sv 
read_verilog -version sv2012 { \
  ip/tech_cells_generic/src/deprecated/pulp_clock_gating_async.sv \
  ip/tech_cells_generic/src/deprecated/cluster_clk_cells.sv \
  ip/tech_cells_generic/src/deprecated/pulp_clk_cells.sv \
  ip/tech_cells_generic/src/tc_pwr.sv \
  ip/tech_cells_generic/src/deprecated/cluster_pwr_cells.sv \
  ip/tech_cells_generic/src/deprecated/generic_memory.sv \
  ip/tech_cells_generic/src/deprecated/generic_rom.sv \
  ip/tech_cells_generic/src/deprecated/pad_functional.sv \
  ip/tech_cells_generic/src/deprecated/pulp_buffer.sv \
  ip/tech_cells_generic/src/deprecated/pulp_pwr_cells.sv \
  ip/tech_cells_generic/src/rtl/tc_clk.sv \
  ip/tech_cells_generic/src/rtl/tc_sram.sv \
}
set_elaborate_option -golden -call_threshold 100 -loop_iter_threshold 1025 -x_optimism -verilog_parameter {} -verilog_library_search_order {} -no_verilog_library_resolution_ieee_compliance -no_verilog_config_support -vhdl_generic {} -vhdl_assertion_report_prefix {onespin} -black_box {{tc_sram} {generic_rom} {soc_peripherals} {dm_top} {ibex_core}} -black_box_empty_modules -no_black_box_missing_modules -black_box_library {} -black_box_component {} -top {Verilog!work.soc_top}
elaborate -golden
compile -golden
set_reset_sequence {reset=1}
set_clock_spec -period 2 [get_bits -unit -filter clock!=none&&direction==input]
set_mode mv

read_sva {property_DB_pulpissimo.sv}

check -stop_on_first_fail -approver1_steps 0 -approver2_steps 0 -approver3_steps 0 -approver4_steps 0 -disprover1_steps 10 -prover1_steps 0 -prover2_steps 0 {sva/checker_bind/ops/DB_forward_assertion};
