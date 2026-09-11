property lFC_CORE_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.alert_major_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.alert_major_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.alert_minor_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.alert_minor_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.core_sleep_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.core_sleep_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_addr_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_addr_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_be_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_be_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_req_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_req_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_wdata_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_wdata_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_we_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.data_we_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_addr_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_addr_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_req_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_req_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.irq_x_ack_id_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.irq_x_ack_id_o &&
	soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.irq_x_ack_o == 
	soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.irq_x_ack_o;
endproperty

lFC_CORE_blackboxing: assume property ( @(posedge soc_top.clock) lFC_CORE_bb_constraint);


property i_dm_top_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.debug_req_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.debug_req_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.dmactive_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.dmactive_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.dmi_req_ready_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.dmi_req_ready_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.dmi_resp_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.dmi_resp_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.dmi_resp_valid_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.dmi_resp_valid_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.master_add_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.master_add_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.master_be_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.master_be_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.master_req_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.master_req_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.master_wdata_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.master_wdata_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.master_we_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.master_we_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.ndmreset_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.ndmreset_o &&
	soc_top.soc_domain_1.pulp_soc_i.i_dm_top.slave_rdata_o == 
	soc_top.soc_domain_2.pulp_soc_i.i_dm_top.slave_rdata_o;
endproperty

i_dm_top_blackboxing: assume property ( @(posedge soc_top.clock) i_dm_top_bb_constraint);

property apb_debug_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_debug_master.paddr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_debug_master.paddr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_debug_master.penable == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_debug_master.penable &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_debug_master.psel == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_debug_master.psel &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_debug_master.pwdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_debug_master.pwdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_debug_master.pwrite == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_debug_master.pwrite;
endproperty

apb_debug_master_blackboxing: assume property ( @(posedge soc_top.clock) apb_debug_master_bb_constraint);


property apb_eu_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_eu_master.paddr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_eu_master.paddr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_eu_master.penable == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_eu_master.penable &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_eu_master.psel == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_eu_master.psel &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_eu_master.pwdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_eu_master.pwdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_eu_master.pwrite == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_eu_master.pwrite;
endproperty

apb_eu_master_blackboxing: assume property ( @(posedge soc_top.clock) apb_eu_master_bb_constraint);


property apb_hwpe_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.paddr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.paddr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.penable == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.penable &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.psel == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.psel &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.pwdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.pwdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.pwrite == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_hwpe_master.pwrite;
endproperty

apb_hwpe_master_blackboxing: assume property ( @(posedge soc_top.clock) apb_hwpe_master_bb_constraint);


property apb_slave_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_slave.prdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_slave.prdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_slave.pready == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_slave.pready &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.apb_slave.pslverr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.apb_slave.pslverr;
endproperty

apb_slave_blackboxing: assume property ( @(posedge soc_top.clock) apb_slave_bb_constraint);


property soc_peripherals_i_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cl_event_data_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cl_event_data_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cl_event_valid_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cl_event_valid_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_boot_addr_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_boot_addr_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_byp_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_byp_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_fetch_enable_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_fetch_enable_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_irq_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_irq_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_pow_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_pow_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_rstn_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_rstn_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.fc_bootaddr_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.fc_bootaddr_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.fc_event_data_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.fc_event_data_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.fc_event_valid_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.fc_event_valid_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.fc_events_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.fc_events_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.fc_fetchen_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.fc_fetchen_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.gpio_dir == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.gpio_dir &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.gpio_out == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.gpio_out &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.gpio_padcfg == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.gpio_padcfg &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_ck_no == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_ck_no &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_ck_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_ck_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_cs_no == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_cs_no &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_dq_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_dq_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_dq_oe_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_dq_oe_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_reset_no == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_reset_no &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_rwds_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_rwds_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.hyper_rwds_oe_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.hyper_rwds_oe_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2c_scl_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2c_scl_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2c_scl_oe_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2c_scl_oe_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2c_sda_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2c_sda_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2c_sda_oe_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2c_sda_oe_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2s_slave_sck_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2s_slave_sck_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2s_slave_sck_oe == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2s_slave_sck_oe &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2s_slave_ws_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2s_slave_ws_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.i2s_slave_ws_oe == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.i2s_slave_ws_oe &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.pad_cfg_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.pad_cfg_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.pad_mux_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.pad_mux_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.sdclk_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.sdclk_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.sdcmd_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.sdcmd_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.sdcmd_oen_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.sdcmd_oen_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.sddata_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.sddata_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.sddata_oen_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.sddata_oen_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.soc_jtag_reg_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.soc_jtag_reg_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.spi_clk_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.spi_clk_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.spi_csn_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.spi_csn_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.spi_oen_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.spi_oen_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.spi_sdo_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.spi_sdo_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.timer_ch0_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.timer_ch0_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.timer_ch1_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.timer_ch1_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.timer_ch2_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.timer_ch2_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.timer_ch3_o == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.timer_ch3_o &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.uart_tx == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.uart_tx;
endproperty

soc_peripherals_i_blackboxing: assume property ( @(posedge soc_top.clock) soc_peripherals_i_bb_constraint);


property cluster_fll_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_fll_master.addr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_fll_master.addr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_fll_master.req == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_fll_master.req &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_fll_master.wdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_fll_master.wdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.cluster_fll_master.wrn == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.cluster_fll_master.wrn;
endproperty

cluster_fll_master_blackboxing: assume property ( @(posedge soc_top.clock) cluster_fll_master_bb_constraint);


property l2_rx_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_rx_master.add == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_rx_master.add &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_rx_master.be == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_rx_master.be &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_rx_master.req == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_rx_master.req &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_rx_master.wdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_rx_master.wdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_rx_master.wen == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_rx_master.wen;
endproperty

l2_rx_master_blackboxing: assume property ( @(posedge soc_top.clock) l2_rx_master_bb_constraint);


property l2_tx_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_tx_master.add == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_tx_master.add &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_tx_master.be == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_tx_master.be &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_tx_master.req == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_tx_master.req &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_tx_master.wdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_tx_master.wdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.l2_tx_master.wen == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.l2_tx_master.wen;
endproperty

l2_tx_master_blackboxing: assume property ( @(posedge soc_top.clock) l2_tx_master_bb_constraint);


property per_fll_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.per_fll_master.addr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.per_fll_master.addr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.per_fll_master.req == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.per_fll_master.req &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.per_fll_master.wdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.per_fll_master.wdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.per_fll_master.wrn == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.per_fll_master.wrn;
endproperty

per_fll_master_blackboxing: assume property ( @(posedge soc_top.clock) per_fll_master_bb_constraint);


property soc_fll_master_bb_constraint;
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.soc_fll_master.addr == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.soc_fll_master.addr &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.soc_fll_master.req == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.soc_fll_master.req &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.soc_fll_master.wdata == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.soc_fll_master.wdata &&
	soc_top.soc_domain_1.pulp_soc_i.soc_peripherals_i.soc_fll_master.wrn == 
	soc_top.soc_domain_2.pulp_soc_i.soc_peripherals_i.soc_fll_master.wrn;
endproperty

soc_fll_master_blackboxing: assume property ( @(posedge soc_top.clock) soc_fll_master_bb_constraint);


