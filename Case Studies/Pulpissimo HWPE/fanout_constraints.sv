function automatic t1_cc_fanout();
	t1_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.tcdm_master_r_data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.tcdm_master_r_data_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers;
endfunction

function automatic t2_cc_fanout();
	t2_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.tcdm_binding[0].stream_data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.tcdm_binding[0].stream_data_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_fence.data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_fence.data_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers;
endfunction

function automatic t3_cc_fanout();
	t3_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.realign_gen.i_realign.stream_data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.realign_gen.i_realign.stream_data_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers;
endfunction

function automatic t4_cc_fanout();
	t4_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult;
endfunction

function automatic t5_cc_fanout();
	t5_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_acc ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_acc &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult;
endfunction

function automatic t6_cc_fanout();
	t6_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_latest_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_latest_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_data_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_strb_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_strb_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_data_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_data_q;
endfunction

function automatic t7_cc_fanout();
	t7_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers;
endfunction

function automatic t8_cc_fanout();
	t8_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.cs ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.cs &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.cs ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.cs &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.cs ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.cs &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.cs ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.cs &&
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.pop_pointer_q ==
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.pop_pointer_q;
endfunction

function automatic assume_t1_cc_fanout();
	assume_t1_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.tcdm_master_r_data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.tcdm_master_r_data_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers;
endfunction

function automatic assume_t2_cc_fanout();
	assume_t2_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.tcdm_binding[0].stream_data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.tcdm_binding[0].stream_data_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_fence.data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_fence.data_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_incoming.fifo_registers;
endfunction

function automatic assume_t3_cc_fanout();
	assume_t3_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.fence_gen.i_misaligned_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.realign_gen.i_realign.stream_data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_source.realign_gen.i_realign.stream_data_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers;
endfunction

function automatic assume_t4_cc_fanout();
	assume_t4_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult;
endfunction

function automatic assume_t5_cc_fanout();
	assume_t5_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_acc !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_acc ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_engine.r_mult;
endfunction

function automatic assume_t6_cc_fanout();
	assume_t6_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_latest_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_latest_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_strb_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.stream_data_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_strb_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_strb_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_data_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.realign_gen.i_realign.int_data_q;
endfunction

function automatic assume_t7_cc_fanout();
	assume_t7_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_sink.tcdm_binding[0].tcdm_fifos_gen.i_tcdm_fifo.i_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers;
endfunction

function automatic assume_t8_cc_fanout();
	assume_t8_cc_fanout =
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.fifo_registers ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.cs !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.cs ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_c_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.cs !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.cs ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.pop_pointer_q ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.cs !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_b_tcdm_fifo_load.i_fifo_outgoing.cs ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.cs !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_a_tcdm_fifo_load.i_fifo_outgoing.cs ||
		soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.pop_pointer_q !=
		soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.fc_hwpe_gen.i_fc_hwpe.i_mac_top_wrap.i_mac_top.i_streamer.i_d_tcdm_fifo_store.i_fifo.pop_pointer_q;
endfunction

