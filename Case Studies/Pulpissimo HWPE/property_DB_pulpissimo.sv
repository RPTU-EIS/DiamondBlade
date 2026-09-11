module property_checker(
    input reset,
    input clock

);

`include "tidal.sv" 

`include "state_constraints.sv"

`include "fanout_constraints.sv"

`include "blackboxing_constraints.sv"

`begin_tda(ops)


function automatic no_pending_secret_access();
    no_pending_secret_access = (
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o && //changed from Q to rdata_o
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o ) ;
endfunction


function automatic p_alerts_blocking_clause();
    p_alerts_blocking_clause = (
        soc_top.soc_domain_1.pulp_soc_i.i_lint_jtag.dbg_module_i.i_dbg_lint.lint_biu_i.data_out_reg ==
        soc_top.soc_domain_2.pulp_soc_i.i_lint_jtag.dbg_module_i.i_dbg_lint.lint_biu_i.data_out_reg &&
        soc_top.soc_domain_1.pulp_soc_i.i_soc_interconnect_wrap.i_axi64_to_lint32.axi64_2_lint32_i.parallel_lint_write.data_r_rdata_q ==
        soc_top.soc_domain_2.pulp_soc_i.i_soc_interconnect_wrap.i_axi64_to_lint32.axi64_2_lint32_i.parallel_lint_write.data_r_rdata_q &&
        soc_top.soc_domain_1.pulp_soc_i.i_soc_interconnect_wrap.i_axi64_to_lint32.axi64_2_lint32_i.parallel_lint_read.data_r_rdata_q ==
        soc_top.soc_domain_2.pulp_soc_i.i_soc_interconnect_wrap.i_axi64_to_lint32.axi64_2_lint32_i.parallel_lint_read.data_r_rdata_q
    );
endfunction


function automatic write_to_unprotected();
    write_to_unprotected =
        soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.wdata_i &&
        soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.wdata_i &&
        soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.wdata_i &&
        soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.wdata_i &&
        soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.wdata_i &&
        soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.wdata_i == soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.wdata_i;
endfunction

function automatic no_secret();
    no_secret =
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o &&
        soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o;
endfunction


// address map:
// TCDM: 			32'h1C01_0000 to 32'h1C09_0000
// private bank 0:  32'h1C00_0000 to 32'h1C00_8000
// private bank 1:  32'h1C00_8000 to 32'h1C01_0000
// boot rom:		32'h1A00_0000 to 32'h1A04_0000
// AXI plug:		32'h1000_0000 to 32'h1040_0000
// peripherals:		32'h1A10_0000 to 32'h1A40_0000


property symbolic_secret_address; //address ranges:    pri1: 32'h1C00_8000 to 32'h1C01_0000    bank0: 32'h1C01_0000 to 32'h1C08_2000  static secret: 32'h1c00_80c0
    ( $past(soc_top.secret_address) == soc_top.secret_address) &&
    ( $past(soc_top.pmp_reg) == soc_top.pmp_reg) &&
    soc_top.pmp_reg <= 4'b1111 && soc_top.pmp_reg >= 0 &&
    (soc_top.secret_address == 32'h1C00_80C0 || soc_top.secret_address == 32'h1C01_0300);
    // ( ( ( soc_top.secret_address >= 32'h1C00_8000 ) && ( soc_top.secret_address <  32'h1C08_2000 ) ) );
endproperty


property mem_data_array_blackboxing_constraint;
    // ( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o ) &&
    // ( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o ) &&
    // ( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o ) &&
    // ( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o ) &&
    ( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.rdata_o ) &&
//	( soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.Q == soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.Q ) &&
    // ( soc_top.soc_domain_1.pulp_soc_i.boot_rom_i.mem_slave.r_rdata == soc_top.soc_domain_2.pulp_soc_i.boot_rom_i.mem_slave.r_rdata ) && //changed from rom_mem.Q to mem_slave.r_rdata ?
    soc_top.soc_domain_1.pulp_soc_i.boot_rom_i.rom_mem_i.Q == soc_top.soc_domain_2.pulp_soc_i.boot_rom_i.rom_mem_i.Q &&
    //	( ($past(soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.A) == 15'h0030) || ((soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.Q) == (soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.Q)) ) &&
    
    
    ( ( ( soc_top.secret_address >= 32'h1C01_0000 ) && ( soc_top.secret_address <  32'h1C08_2000 ) && (soc_top.secret_address[3:2] == 2'b00) )?( ($past(soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.addr_i) == (soc_top.secret_address[18:4] - 16'h1000)) || ((soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o) == (soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o)) ):( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[0].bank_i.rdata_o ) ) &&

    ( ( ( soc_top.secret_address >= 32'h1C01_0000 ) && ( soc_top.secret_address <  32'h1C08_2000 ) && (soc_top.secret_address[3:2] == 2'b01) )?( ($past(soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.addr_i) == (soc_top.secret_address[18:4] - 16'h1000)) || ((soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o) == (soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o)) ):( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[1].bank_i.rdata_o ) ) &&

    ( ( ( soc_top.secret_address >= 32'h1C01_0000 ) && ( soc_top.secret_address <  32'h1C08_2000 ) && (soc_top.secret_address[3:2] == 2'b10) )?( ($past(soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.addr_i) == (soc_top.secret_address[18:4] - 16'h1000)) || ((soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o) == (soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o)) ):( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[2].bank_i.rdata_o ) ) &&

    ( ( ( soc_top.secret_address >= 32'h1C01_0000 ) && ( soc_top.secret_address <  32'h1C08_2000 ) && (soc_top.secret_address[3:2] == 2'b11) )?( ($past(soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.addr_i) == (soc_top.secret_address[18:4] - 16'h1000)) || ((soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o) == (soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o)) ):( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.CUTS[3].bank_i.rdata_o ) ) &&



//	( ($past(soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.A) == 13'h0030) || ((soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.Q) == (soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.Q)) );
//	( ( ( soc_top.secret_address >= 32'h1C00_8000 ) && ( soc_top.secret_address <  32'h1C01_0000 ) )?( ($past(soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.A) == soc_top.secret_address[14:2]) || ((soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.Q) == (soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.Q)) ):( soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.Q == soc_top.soc_domain_i.pulp_soc_i.l2_ram_i.bank_sram_pri0_i.Q ) ) &&

    ( ( ( soc_top.secret_address >= 32'h1C00_8000 ) && ( soc_top.secret_address <  32'h1C01_0000 ) )?( ($past(soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.addr_i) == soc_top.secret_address[14:2]) || ((soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o) == (soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o)) ):( soc_top.soc_domain_1.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o == soc_top.soc_domain_2.pulp_soc_i.l2_ram_i.bank_sram_pri1_i.rdata_o ) );
endproperty


property instruction_input_equal;
    soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_gnt_i ==
    soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_gnt_i &&
    soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_rvalid_i ==
    soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_rvalid_i &&
    soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_rdata_i ==
    soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_rdata_i &&
    soc_top.soc_domain_1.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_err_i ==
    soc_top.soc_domain_2.pulp_soc_i.fc_subsystem_i.FC_CORE.lFC_CORE.instr_err_i;
endproperty

instr_constraint: assume property ( @(posedge soc_top.clock) instruction_input_equal);

mem_constraint: assume property ( @(posedge soc_top.clock) mem_data_array_blackboxing_constraint);

symbolic_address_constraint: assume property ( @(posedge soc_top.clock) symbolic_secret_address);

property DB_forward;
    t ## 0 state_equivalence()         and
    during_o(t,2, t,9, no_secret())    and
    t ## 2 p_alerts_blocking_clause()  and
    t ## 2 assume_t1_cc_fanout()       and
    t ## 3 assume_t2_cc_fanout()       and
    t ## 4 assume_t3_cc_fanout()       and
    t ## 5 assume_t4_cc_fanout()       and
    t ## 6 assume_t5_cc_fanout()       and
    t ## 7 assume_t6_cc_fanout()       and
    t ## 8 assume_t7_cc_fanout()
implies
    t ## 9 write_to_unprotected();
endproperty


DB_forward_assertion: assert property ( @(posedge soc_top.clock) disable iff(reset) DB_forward);

`end_tda

endmodule

bind soc_top property_checker checker_bind(
    .reset(reset),
    .clock(clock));