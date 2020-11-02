// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// Library - aibnd_lib, Cell - aibnd_rambit_buf, View - schematic
// LAST TIME SAVED: Apr 19 23:56:59 2015
// NETLIST TIME: May 12 17:53:11 2015
// `timescale 1ps/1ps

module aibnd_rambit_buf ( sig_out, sig_in, vccl_aibnd, vssl_aibnd );

output  sig_out;

input  sig_in, vccl_aibnd, vssl_aibnd;

wire sig_out, sig_in; // Conversion Sript Generated


// specify 
//     specparam CDS_LIBNAME  = "aibnd_lib";
//     specparam CDS_CELLNAME = "aibnd_rambit_buf";
//     specparam CDS_VIEWNAME = "schematic";
// endspecify

assign sig_out = sig_in;

endmodule

