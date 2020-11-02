// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// *****************************************************************************
// *****************************************************************************
// Copyright (C) 2016 Altera Corporation.                                       
// *****************************************************************************
//  Module Name :  c3lib_ckg_lvt_8x                                  
//  Date        :  Thu May 12 10:45:17 2016                                 
//  Description :  Posetive edge clock gater (LVT, 8x drive strength)
// *****************************************************************************

module c3lib_ckg_lvt_8x(

  tst_en,
  clk_en,
  clk,
  gated_clk

); 

input  		tst_en;
input  		clk_en;
input  		clk;
output 		gated_clk;
`ifdef BEHAVIORAL
  logic	latch_d;
  logic	latch_q;

  // Formulate control signal
  assign latch_d = clk_en | tst_en;

  // Latch control signal
  always_latch if (~clk) latch_q <= latch_d;

  // Actual clk gating gate
  assign gated_clk = clk & latch_q;
`else
 //replace this section with user technology cell 
 //for the purpose of cell hardening, synthesis don't touch 
 $display("ERROR : %m : replace this section with user technology cell");
 $finish;
`endif
endmodule 


