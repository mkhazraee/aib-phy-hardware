// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// Library - aibcr3_lib, Cell - aibcr3_dcc_dlyline64, View - schematic
// LAST TIME SAVED: Aug  5 00:38:48 2016
// NETLIST TIME: Aug 17 15:46:58 2016
// `timescale 1ps/1ps

module aibcr3_dcc_dlyline64 ( a63, dlyout, b63, bk, dlyin
     );

output  a63, dlyout;

input  b63, dlyin;

input [63:0]  bk;

wire [62:0]  a;
wire [62:0]  b;

aibcr3_dlycell_dcc UD00 [63:0] (
.in_p       ( {a[62:0],dlyin}    ),
.bk         ( bk[63:0]           ),
.ci_p       ( {b63,b[62:0]}      ),
.out_p      ( {b[62:0], dlyout}  ),
.co_p       ( {a63,a[62:0]}      )
);

endmodule
