read_verilog -golden  -pragma_ignore {}  -version sv2012 {RTL/aes_core.v RTL/aes_decipher_block.v RTL/aes_encipher_block.v RTL/aes_inv_sbox.v RTL/aes_key_mem.v RTL/aes_sbox.v} 
read_verilog -golden  -pragma_ignore {}  -version sv2012 {RTL/miter.sv}

set_elaborate_option -golden -call_threshold 100 -loop_iter_threshold 300 -x_optimism -verilog_parameter {} -verilog_library_search_order {} -no_verilog_library_resolution_ieee_compliance -no_verilog_config_support -vhdl_generic {} -vhdl_assertion_report_prefix {onespin} -black_box {} -black_box_empty_modules -no_black_box_missing_modules -black_box_library {} -black_box_component {} -top {Verilog!work.miter}

elaborate -golden

compile -golden

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
