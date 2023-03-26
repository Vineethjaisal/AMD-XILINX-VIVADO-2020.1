`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 25_07_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.3 
// Module Name   : d_ff.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : D FF with Asyn. Reset and Enable		   
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - No - Basic Module
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------
  module d_ff
  (
//------------------------------------------------------------------------------
// INPUT DECLARATION
//------------------------------------------------------------------------------ 
    input     d_in 	        	, // Data input port declaration 
    input     clock			, // Clock input declaration
    input     rst_asyn	        	, // Asys. Reset of Active High type 
//------------------------------------------------------------------------------
// OUTPUT DECLARATION
//------------------------------------------------------------------------------
    output    d_out		  	  // Data out port declaration  
  ); 
//------------------------------------------------------------------------------
// REGISTER DECLARATION
//------------------------------------------------------------------------------
  reg	    d_out  	=  1'b0	    	; // Register Data out port declaration  
//------------------------------------------------------------------------------
// PROCEDURAL ALWAYS BLOCK - DFF with Asyn. Reset
//------------------------------------------------------------------------------     
  always@(posedge clock,posedge rst_asyn)
    begin
      if(rst_asyn == 1'b1)
         d_out <= 1'b0              	;
      else
         d_out <= d_in     	    	;  
    end
    
endmodule
