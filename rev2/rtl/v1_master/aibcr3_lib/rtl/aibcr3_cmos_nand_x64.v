// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// Library - aibcr3_lib, Cell - aibcr3_cmos_nand_x64, View - schematic
// LAST TIME SAVED: Aug 19 00:17:00 2016
// NETLIST TIME: Aug 31 08:45:53 2016
// `timescale 1ps/1ps

module aibcr3_cmos_nand_x64 ( out_p, so, code_valid,
     dll_reset_n, in_p, scan_rst_n, sck_in, se_n, si, sm_grey,
     sm_igray, sm_n );

output  out_p, so;

input  code_valid, dll_reset_n, in_p, scan_rst_n, sck_in, se_n, si,
     sm_n;

input [6:0]  sm_grey;
input [2:0]  sm_igray;

// Buses in the design

wire  [63:0]  bk;

wire  [6:0]  grey;

wire  [2:0]  i_gray;

wire         so_g2th;
wire         net110;
wire         clk_prebuf;


assign tie_HI   = 1'b1;
assign tie_LO   = 1'b0;
assign nrst     = net110;
assign clk_buf0 = clk_prebuf;
assign SE       = ! se_n;
assign sm_n_buf = sm_n;
assign ck       = clk_buf0;
assign clk_prebuf = sm_n_buf? out_p : sck_in;
assign net110     = sm_n_buf? dll_reset_n : scan_rst_n;

aibcr3_dll_8ph_intp x4 ( so, out_p, ck, nrst, net104,
     i_gray[2:0], SE, so_g2th);

aibcr3_dll_gry2thm64 x1 ( bk[63:0], tie_LO, 
     grey[6:0], tie_LO);

aibcr3_dll_ibkmux x17 ( so_sync, grey[6:0], i_gray[2:0], 
     ck, nrst, SE, code_valid, si, sm_grey[6:0], sm_igray[2:0]);

aibcr3_dlycell_dll_c I7 ( .co_p(net108), .out_p(net109), .bk(tie_LO), .ci_p(tie_HI),
     .in_p(net106));

aibcr3_dll_dlyline64 x0 ( .a63(net106), .dlyout(net104), .b63(net109),
     .bk(bk[63:0]), .dlyin(in_p), .CLKIN(ck), .iSE(SE), .RSTb(nrst), .iSI(so_sync), .SOOUT(so_g2th));

endmodule
