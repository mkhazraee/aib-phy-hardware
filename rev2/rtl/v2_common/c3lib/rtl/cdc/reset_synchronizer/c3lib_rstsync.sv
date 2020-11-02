// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
// ****************************************************************************
// ****************************************************************************
// Copyright © 2016 Altera Corporation.                                          
// ****************************************************************************
//  Module Name :  c3lib_rstsync                                  
//  Date        :  Mon Mar 21 14:25:46 2016                                 
//  Description :                                                    
// ****************************************************************************

module  c3lib_rstsync #(

  parameter	RESET_VAL         = 0,		// Reset value is LOW if set to 0, otherwise HIGH
  parameter	DST_CLK_FREQ_MHZ  = 500	// Clock frequency for destination domain in MHz

) (

  input  logic		scan_mode_n,	// Scan mode control
  input  logic		clk,		// Clock to synchronize rst_n to
  input  logic		rst_n,		// Asynchronous reset
  input  logic		rst_n_bypass,	// PLD reset input in scan mode
  output logic		rst_n_sync	// Synchronized rst_n

); 



// ****************************************************************************
//  V A R I A B L E S
// ****************************************************************************

logic	 rst_n_int;
logic	 rst_n_sync_int;



// ****************************************************************************
//  F U N C T I O N
// ****************************************************************************

assign rst_n_int = (scan_mode_n == 1'b0) ? rst_n_bypass : rst_n;

c3lib_sync2_lvt_bitsync #(

  .DWIDTH	( 1 ),
  .RESET_VAL	( 0 )

) rstsync_synchronizer ( 

  .clk		( clk            ),
  .rst_n	( rst_n_int      ),
  .data_in	( 1'b1           ),
  .data_out	( rst_n_sync_int )

); 

assign rst_n_sync = (scan_mode_n == 1'b0) ? rst_n_bypass : rst_n_sync_int;

endmodule 

