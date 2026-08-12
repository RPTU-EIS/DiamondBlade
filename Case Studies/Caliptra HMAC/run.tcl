read_verilog -golden  -pragma_ignore {}  -version sv2012 {RTL/caliptra_macros.svh RTL/caliptra_prim_assert_dummy_macros.svh RTL/caliptra_prim_assert_standard_macros.svh RTL/caliptra_prim_assert_yosys_macros.svh RTL/caliptra_sva.svh RTL/hmac_core.v RTL/hmac_ctrl.sv RTL/hmac_lfsr.sv RTL/hmac_param_pkg.sv RTL/hmac_reg_pkg.sv RTL/hmac_reg.sv RTL/hmac.sv RTL/kv_defines_pkg.sv RTL/kv_fsm.sv RTL/kv_macros.svh RTL/kv_read_client.sv RTL/kv_write_client.sv RTL/sha512_h_constants.v RTL/sha512_k_constants.v RTL/sha512_masked_core.sv RTL/sha512_masked_defines_pkg.sv RTL/sha512_masked_w_mem.sv }
read_verilog -golden  -pragma_ignore {}  -version sv2012 {RTL/miter.sv } 

set_elaborate_option -golden -call_threshold 100 -loop_iter_threshold 300 -x_optimism -verilog_parameter {} -verilog_library_search_order {} -no_verilog_library_resolution_ieee_compliance -no_verilog_config_support -vhdl_generic {} -vhdl_assertion_report_prefix {onespin} -black_box {} -black_box_empty_modules -no_black_box_missing_modules -black_box_library {} -black_box_component {} -top {Verilog!work.miter}

elaborate -golden

set_mode mv

if {[get_mode] != "mv"} {
  puts "This script needs to be called in MV mode."
        puts "You can switch to MV mode after you have elaborated and compiled the design."
  puts "Then, switch to MV mode and call this script again."
        return
}
puts "The tool will now be set up so that only IPC checks are performed."
set_check_option -default
set_check_option -verbose -approver1_steps 1 -approver2_steps 0 -approver3_steps 0 -approver4_steps 0 -disprover1_steps 0 -prover1_steps 0 -prover2_steps 0 
puts "(Done.)"

read_sva -version {sv2012} {Properties/DiamondBlade_backward_cycle1.sva Properties/DiamondBlade_forward_cycle1.sva}