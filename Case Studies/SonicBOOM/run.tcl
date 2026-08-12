read_verilog -golden  -pragma_ignore {}  -version sv2012 {RTL/chipyard.TestHarness.MediumBoomConfig.top.v RTL/chipyard.TestHarness.MediumBoomConfig.top.mems.v RTL/miter.sv RTL/tilelink_mem.v RTL/param.v }

set_elaborate_option -golden -call_threshold 100 -loop_iter_threshold 300 -x_optimism -verilog_parameter {} -verilog_library_search_order {} -noverilog_library_resolution_ieee_compliance -vhdl_generic {} -vhdl_assertion_report_prefix {onespin} -black_box {} -black_box_empty_modules -black_box_missing_modules -black_box_library {} -black_box_component {} -top {Verilog!work.miter}

elaborate -golden

set_compile_option -golden -black_box_instances {  } -black_box { {Verilog!work.TLMonitor_42} {Verilog!work.TLMonitor_43} {Verilog!work.rob_debug_inst_mem} {Verilog!work.split_array_0_0_ext} {Verilog!work.FetchBuffer} {Verilog!work.FetchTargetQueue} {Verilog!work.l2_tlb_ram} {Verilog!work.dataArrayWay_0} {Verilog!work.tag_array_0} {Verilog!work.ComposedBranchPredictorBank}} -cut_signal  {} -top {} -dontcare_handling sim -macro_iterations 4 -undriven_value sim -time_step macro -feedback_loop_latch {} -clock {} -no_clock {} -signal_domains {}

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

#read_sva -version {sv2012} {Properties/IFT_step.sva}