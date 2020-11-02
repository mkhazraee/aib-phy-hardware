// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// Library - aibnd_lib, Cell - aibnd_str_preclkbuf, View - schematic
// LAST TIME SAVED: Mar 25 07:54:22 2015
// NETLIST TIME: May 12 17:53:10 2015
// `timescale 1ps/1ps

module aibnd_str_preclkbuf ( clkout, clkin, vcc_aibnd, vss_aibnd );

output  clkout;

input  clkin, vcc_aibnd, vss_aibnd;

wire clkin, clkout; // Conversion Sript Generated


// specify 
//     specparam CDS_LIBNAME  = "aibnd_lib";
//     specparam CDS_CELLNAME = "aibnd_str_preclkbuf";
//     specparam CDS_VIEWNAME = "schematic";
// endspecify

assign clkout = !clkin;

endmodule

