`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 25_07_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.3 
// Module Name   : latch.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : Latch with Positive Gate and Clear Signal		   
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - No - Basic Module
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------
  module latch
  (
//------------------------------------------------------------------------------
// INPUT DECLARATION
//------------------------------------------------------------------------------ 
    input     data_in 	        	, // Data input port declaration 
    input     gate_in			, // Gate input port declaration
    input     clr_in			, // Clear input declaration 
//------------------------------------------------------------------------------
// OUTPUT DECLARATION
//------------------------------------------------------------------------------
    output    data_out		  	  // Data out port declaration  
  ); 
//------------------------------------------------------------------------------
// REGISTER DECLARATION
//------------------------------------------------------------------------------
  reg	    data_out  	=  1'b0	    	; // Register Data out port declaration  
//------------------------------------------------------------------------------
// PROCEDURAL ALWAYS BLOCK - Latch with Gate and Clear
//------------------------------------------------------------------------------     
  always@(*)
    begin
      if(clr_in == 1'b1)
         data_out <= 1'b0              	;
      else if(gate_in == 1'b1)
         data_out <= data_in     	;  
    end
    
endmodule




