`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 18_04_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.0 
// Module Name   : shift_registers_lut_tb.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : Test bench for Shift Register LUT
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - Top Module (Testbench) - shift_registers_lut_tb.v
// - DUT        	    - shift_registers_lut.v  
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------
  module shift_registers_lut_tb;
// REG DECLARATION
  reg 		w_tb_clock		     		; // Clock Input
  reg       w_tb_clk_en                 ; // Clock Enable
  reg	 	w_tb_serial_in	     		; // Serial Input
// WIRE DECLARATION
  wire 		w_tb_serial_out	      	    ; // Serial Output 
//------------------------------------------------------------------------------
// DUT INSTANTIATION
//------------------------------------------------------------------------------ 
  shift_register_lut dut
  (
	.clk_in		(w_tb_clock),
	.clk_en     (w_tb_clk_en),
	.serial_in		(w_tb_serial_in),
    .serial_out   (w_tb_serial_out)
  );
//------------------------------------------------------------------------------
// TEST BENCH CLOCK GENERATION 
//------------------------------------------------------------------------------     
  initial 
    begin
      w_tb_clk_en = 1'b0;
      w_tb_clock = 1'b1;
    end

  always #5 w_tb_clock = ~w_tb_clock;
//------------------------------------------------------------------------------
// TEST VECTOR GENERATION 
//------------------------------------------------------------------------------
  initial
    begin
      repeat (5)
        begin
   	  #10 w_tb_serial_in = 1'b0;
        end    

      repeat (5)
        begin
   	  #10 w_tb_serial_in = 1'b1;
        end
   
       w_tb_clk_en = 1'b1;
     
      repeat (32)
        begin
   	  #10 w_tb_serial_in = 1'b0;
        end    

      repeat (32)
        begin
   	  #10 w_tb_serial_in = 1'b1;
        end 
 
      repeat (10)
        begin
   	  #10 w_tb_serial_in = 1'b0;
        end

      repeat (32)
        begin
   	  #10 w_tb_serial_in = $urandom;
        end 

  #10000 $stop; 
      	
    end  
//------------------------------------------------------------------------------
// OUTPUT MONITOR 
//------------------------------------------------------------------------------
   initial
     begin
       $monitor($time,"i_clock = %b, i_serial_in = %b,o_serial_out = %d",  
                       w_tb_clock, w_tb_serial_in, w_tb_serial_out);
     end   
endmodule
