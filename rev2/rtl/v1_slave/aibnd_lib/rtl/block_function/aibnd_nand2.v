// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// Verilog HDL and netlist files of
// "aibnd_lib aibnd_nand2 schematic"

// Netlisted models

// Library - aibnd_lib, Cell - aibnd_nand2, View - schematic
// LAST TIME SAVED: May  4 08:41:42 2015
// NETLIST TIME: May 11 08:41:16 2015
// `timescale 1ps/1ps

module aibnd_nand2 ( clkout, clk, en, vccl_aibnd, vssl_aibnd );

output  clkout;

input  clk, en, vccl_aibnd, vssl_aibnd;

// List of primary aliased buses

/*
specify 
    specparam CDS_LIBNAME  = "aibnd_lib";
    specparam CDS_CELLNAME = "aibnd_nand2";
    specparam CDS_VIEWNAME = "schematic";
endspecify
*/

assign clkout = ~(clk & en) ; 



endmodule


// End HDL models

