`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 25_07_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.3 
// Module Name   : full_adder.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : 1 bit Full Adder		   
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - No - Basic Module
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------  
  module full_adder 
  (
//------------------------------------------------------------------------------
// INPUT DECLARATION
//------------------------------------------------------------------------------ 
    input a,			// input a declaration 
    input b,			// input b declaration
    input cin,			// input cin declaration 
//------------------------------------------------------------------------------
// OUTPUT DECLARATION
//------------------------------------------------------------------------------
    output sum,			// output full adder sum declaration 
    output cout			// output full adder carry out declaration 
  ); 
//------------------------------------------------------------------------------
// FULL ADDER LOGIC
//------------------------------------------------------------------------------
  assign sum  =  a ^ b ^ cin 	;
  assign cout =  cin & (a ^ b) | (a & b)   ;
  
endmodule 
