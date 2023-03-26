`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 25_07_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.3 
// Module Name   : shift_register_lut.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : 32 - bit Shift Register
//		   Rising edge clock
//                 Active high clock enable	
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - No - Basic Module
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------
  module shift_register_lut
  #(
    parameter WIDTH = 32 
  )
  (
//------------------------------------------------------------------------------
// INPUT DECLARATION
//------------------------------------------------------------------------------
  input 	clk_in		    	 	,  // Clock input
  input 	clk_en		 		,  // Clock Enable Input  
  input		serial_in			,  // Serial Input  
//------------------------------------------------------------------------------
// OUTPUT DECLARATION
//------------------------------------------------------------------------------
  output	serial_out	      	    	   // Serial Output 
  );  
//------------------------------------------------------------------------------
// REGISTER DECLARATION
//------------------------------------------------------------------------------
  reg [WIDTH-1:0] serial_reg  	 		;  // Register
//------------------------------------------------------------------------------
// PROCEDURAL ALWAYS BLOCK - SHIFT REGISTER LOGIC
//------------------------------------------------------------------------------     
   always@(posedge clk_in)
    begin
      if (clk_en)
        serial_reg <= {serial_reg[WIDTH-2:0], serial_in}	 ;            
    end
//------------------------------------------------------------------------------
// DATA FLOW ASSIGNMENT - Serial Out Logic
//------------------------------------------------------------------------------     
   assign serial_out = serial_reg[WIDTH-1]			 ;

endmodule
