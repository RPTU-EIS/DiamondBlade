module IFT_miter (
  input clock,
  input reset,
  input auto_hartid_in_1,
  input auto_int_local_in_0_0_1,
  input auto_int_local_in_1_0_1,
  input auto_int_local_in_1_1_1,
  input auto_int_local_in_2_0_1,
  input auto_int_local_in_3_0_1,
  input auto_tl_other_masters_out_a_ready_1,
  input [31:0] auto_tl_other_masters_out_b_bits_address_1,
  input auto_tl_other_masters_out_b_bits_corrupt_1,
  input [7:0] auto_tl_other_masters_out_b_bits_mask_1,
  input [2:0] auto_tl_other_masters_out_b_bits_opcode_1,
  input [1:0] auto_tl_other_masters_out_b_bits_param_1,
  input [3:0] auto_tl_other_masters_out_b_bits_size_1,
  input [2.0] auto_tl_other_masters_out_b_bits_source_1,
  input auto_tl_other_masters_out_b_valid_1,
  input auto_tl_other_masters_out_c_ready_1,
  input auto_tl_other_masters_out_d_bits_corrupt_1,
  input [63:0] auto_tl_other_masters_out_d_bits_data_1,
  input auto_tl_other_masters_out_d_bits_denied_1,
  input [2:0] auto_tl_other_masters_out_d_bits_opcode_1,
  input [1:0] auto_tl_other_masters_out_d_bits_param_1,
  input [2:0] auto_tl_other_masters_out_d_bits_sink_1,
  input [3:0] auto_tl_other_masters_out_d_bits_size_1,
  input [2:0] auto_tl_other_masters_out_d_bits_source_1,
  input auto_tl_other_masters_out_d_valid_1,
  input auto_tl_other_masters_out_e_ready_1,
  input [2:0] pmp_reg_index,
  input [31:0] SECRET_ADDR
  );

  wire [19:0] SECRET_TAG;
  assign SECRET_TAG = SECRET_ADDR[31:12];

  //Instantiation of SoC1
  BoomTile soc1(
    .clock(clock),
    .reset(reset),
    .auto_hartid_in(auto_hartid_in_1),
    .auto_int_local_in_0_0(auto_int_local_in_0_0_1),
    .auto_int_local_in_1_0(auto_int_local_in_1_0_1),
    .auto_int_local_in_1_1(auto_int_local_in_1_1_1),
    .auto_int_local_in_2_0(auto_int_local_in_2_0_1),
    .auto_int_local_in_3_0(auto_int_local_in_3_0_1),
    .auto_tl_other_masters_out_a_ready(auto_tl_other_masters_out_a_ready_1),
    .auto_tl_other_masters_out_b_bits_address(auto_tl_other_masters_out_b_bits_address_1),
    .auto_tl_other_masters_out_b_bits_corrupt(auto_tl_other_masters_out_b_bits_corrupt_1),
    .auto_tl_other_masters_out_b_bits_mask(auto_tl_other_masters_out_b_bits_mask_1),
    .auto_tl_other_masters_out_b_bits_opcode(auto_tl_other_masters_out_b_bits_opcode_1),
    .auto_tl_other_masters_out_b_bits_param(auto_tl_other_masters_out_b_bits_param_1),
    .auto_tl_other_masters_out_b_bits_size(auto_tl_other_masters_out_b_bits_size_1),
    .auto_tl_other_masters_out_b_bits_source(auto_tl_other_masters_out_b_bits_source_1),
    .auto_tl_other_masters_out_b_valid(auto_tl_other_masters_out_b_valid_1),
    .auto_tl_other_masters_out_c_ready(auto_tl_other_masters_out_c_ready_1),
    .auto_tl_other_masters_out_d_bits_corrupt(auto_tl_other_masters_out_d_bits_corrupt_1),
    .auto_tl_other_masters_out_d_bits_data(auto_tl_other_masters_out_d_bits_data_1),
    .auto_tl_other_masters_out_d_bits_denied(auto_tl_other_masters_out_d_bits_denied_1),
    .auto_tl_other_masters_out_d_bits_opcode(auto_tl_other_masters_out_d_bits_opcode_1),
    .auto_tl_other_masters_out_d_bits_param(auto_tl_other_masters_out_d_bits_param_1),
    .auto_tl_other_masters_out_d_bits_sink(auto_tl_other_masters_out_d_bits_sink_1),
    .auto_tl_other_masters_out_d_bits_size(auto_tl_other_masters_out_d_bits_size_1),
    .auto_tl_other_masters_out_d_bits_source(auto_tl_other_masters_out_d_bits_source_1),
    .auto_tl_other_masters_out_d_valid(auto_tl_other_masters_out_d_valid_1),
    .auto_tl_other_masters_out_e_ready(auto_tl_other_masters_out_e_ready_1)
  );

  //Instantiation of SoC2
  BoomTile soc2(
    .clock(clock),
    .reset(reset),
    .auto_hartid_in(auto_hartid_in_1),
    .auto_int_local_in_0_0(auto_int_local_in_0_0_1),
    .auto_int_local_in_1_0(auto_int_local_in_1_0_1),
    .auto_int_local_in_1_1(auto_int_local_in_1_1_1),
    .auto_int_local_in_2_0(auto_int_local_in_2_0_1),
    .auto_int_local_in_3_0(auto_int_local_in_3_0_1),
    .auto_tl_other_masters_out_a_ready(auto_tl_other_masters_out_a_ready_1),
    .auto_tl_other_masters_out_b_bits_address(auto_tl_other_masters_out_b_bits_address_1),
    .auto_tl_other_masters_out_b_bits_corrupt(auto_tl_other_masters_out_b_bits_corrupt_1),
    .auto_tl_other_masters_out_b_bits_mask(auto_tl_other_masters_out_b_bits_mask_1),
    .auto_tl_other_masters_out_b_bits_opcode(auto_tl_other_masters_out_b_bits_opcode_1),
    .auto_tl_other_masters_out_b_bits_param(auto_tl_other_masters_out_b_bits_param_1),
    .auto_tl_other_masters_out_b_bits_size(auto_tl_other_masters_out_b_bits_size_1),
    .auto_tl_other_masters_out_b_bits_source(auto_tl_other_masters_out_b_bits_source_1),
    .auto_tl_other_masters_out_b_valid(auto_tl_other_masters_out_b_valid_1),
    .auto_tl_other_masters_out_c_ready(auto_tl_other_masters_out_c_ready_1),
    .auto_tl_other_masters_out_d_bits_corrupt(auto_tl_other_masters_out_d_bits_corrupt_1),
    .auto_tl_other_masters_out_d_bits_data(auto_tl_other_masters_out_d_bits_data_1),
    .auto_tl_other_masters_out_d_bits_denied(auto_tl_other_masters_out_d_bits_denied_1),
    .auto_tl_other_masters_out_d_bits_opcode(auto_tl_other_masters_out_d_bits_opcode_1),
    .auto_tl_other_masters_out_d_bits_param(auto_tl_other_masters_out_d_bits_param_1),
    .auto_tl_other_masters_out_d_bits_sink(auto_tl_other_masters_out_d_bits_sink_1),
    .auto_tl_other_masters_out_d_bits_size(auto_tl_other_masters_out_d_bits_size_1),
    .auto_tl_other_masters_out_d_bits_source(auto_tl_other_masters_out_d_bits_source_1),
    .auto_tl_other_masters_out_d_valid(auto_tl_other_masters_out_d_valid_1),
    .auto_tl_other_masters_out_e_ready(auto_tl_other_masters_out_e_ready_1)
  );

	//helper arrays
	wire [7:0] pmp_cfg_1 [7:0];
	assign pmp_cfg_1[0] = {soc1.core.csr.reg_pmp_0_cfg_l, 2'b0, soc1.core.csr.reg_pmp_0_cfg_a, soc1.core.csr.reg_pmp_0_cfg_x, soc1.core.csr.reg_pmp_0_cfg_w, soc1.core.csr.reg_pmp_0_cfg_r};
	assign pmp_cfg_1[1] = {soc1.core.csr.reg_pmp_1_cfg_l, 2'b0, soc1.core.csr.reg_pmp_1_cfg_a, soc1.core.csr.reg_pmp_1_cfg_x, soc1.core.csr.reg_pmp_1_cfg_w, soc1.core.csr.reg_pmp_1_cfg_r};
	assign pmp_cfg_1[2] = {soc1.core.csr.reg_pmp_2_cfg_l, 2'b0, soc1.core.csr.reg_pmp_2_cfg_a, soc1.core.csr.reg_pmp_2_cfg_x, soc1.core.csr.reg_pmp_2_cfg_w, soc1.core.csr.reg_pmp_2_cfg_r};
	assign pmp_cfg_1[3] = {soc1.core.csr.reg_pmp_3_cfg_l, 2'b0, soc1.core.csr.reg_pmp_3_cfg_a, soc1.core.csr.reg_pmp_3_cfg_x, soc1.core.csr.reg_pmp_3_cfg_w, soc1.core.csr.reg_pmp_3_cfg_r};
	assign pmp_cfg_1[4] = {soc1.core.csr.reg_pmp_4_cfg_l, 2'b0, soc1.core.csr.reg_pmp_4_cfg_a, soc1.core.csr.reg_pmp_4_cfg_x, soc1.core.csr.reg_pmp_4_cfg_w, soc1.core.csr.reg_pmp_4_cfg_r};
	assign pmp_cfg_1[5] = {soc1.core.csr.reg_pmp_5_cfg_l, 2'b0, soc1.core.csr.reg_pmp_5_cfg_a, soc1.core.csr.reg_pmp_5_cfg_x, soc1.core.csr.reg_pmp_5_cfg_w, soc1.core.csr.reg_pmp_5_cfg_r};
	assign pmp_cfg_1[6] = {soc1.core.csr.reg_pmp_6_cfg_l, 2'b0, soc1.core.csr.reg_pmp_6_cfg_a, soc1.core.csr.reg_pmp_6_cfg_x, soc1.core.csr.reg_pmp_6_cfg_w, soc1.core.csr.reg_pmp_6_cfg_r};
	assign pmp_cfg_1[7] = {soc1.core.csr.reg_pmp_7_cfg_l, 2'b0, soc1.core.csr.reg_pmp_7_cfg_a, soc1.core.csr.reg_pmp_7_cfg_x, soc1.core.csr.reg_pmp_7_cfg_w, soc1.core.csr.reg_pmp_7_cfg_r};

	wire [31:0] pmp_addr_1 [7:0];
	assign pmp_addr_1[0] = {soc1.core.csr.reg_pmp_0_addr, 2'b0};
	assign pmp_addr_1[1] = {soc1.core.csr.reg_pmp_1_addr, 2'b0};
	assign pmp_addr_1[2] = {soc1.core.csr.reg_pmp_2_addr, 2'b0};
	assign pmp_addr_1[3] = {soc1.core.csr.reg_pmp_3_addr, 2'b0};
	assign pmp_addr_1[4] = {soc1.core.csr.reg_pmp_4_addr, 2'b0};
	assign pmp_addr_1[5] = {soc1.core.csr.reg_pmp_5_addr, 2'b0};
	assign pmp_addr_1[6] = {soc1.core.csr.reg_pmp_6_addr, 2'b0};
	assign pmp_addr_1[7] = {soc1.core.csr.reg_pmp_7_addr, 2'b0};

	wire stq_addr_is_virtual_1 [15:0];
	assign stq_addr_is_virtual_1[0] = soc1.lsu.stq_0_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[1] = soc1.lsu.stq_1_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[2] = soc1.lsu.stq_2_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[3] = soc1.lsu.stq_3_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[4] = soc1.lsu.stq_4_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[5] = soc1.lsu.stq_5_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[6] = soc1.lsu.stq_6_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[7] = soc1.lsu.stq_7_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[8] = soc1.lsu.stq_8_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[9] = soc1.lsu.stq_9_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[10] = soc1.lsu.stq_10_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[11] = soc1.lsu.stq_11_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[12] = soc1.lsu.stq_12_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[13] = soc1.lsu.stq_13_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[14] = soc1.lsu.stq_14_bits_addr_is_virtual;
	assign stq_addr_is_virtual_1[15] = soc1.lsu.stq_15_bits_addr_is_virtual;

	wire stq_addr_is_virtual_2 [15:0];
	assign stq_addr_is_virtual_2[0] = soc2.lsu.stq_0_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[1] = soc2.lsu.stq_1_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[2] = soc2.lsu.stq_2_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[3] = soc2.lsu.stq_3_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[4] = soc2.lsu.stq_4_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[5] = soc2.lsu.stq_5_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[6] = soc2.lsu.stq_6_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[7] = soc2.lsu.stq_7_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[8] = soc2.lsu.stq_8_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[9] = soc2.lsu.stq_9_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[10] = soc2.lsu.stq_10_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[11] = soc2.lsu.stq_11_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[12] = soc2.lsu.stq_12_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[13] = soc2.lsu.stq_13_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[14] = soc2.lsu.stq_14_bits_addr_is_virtual;
	assign stq_addr_is_virtual_2[15] = soc2.lsu.stq_15_bits_addr_is_virtual;

endmodule
