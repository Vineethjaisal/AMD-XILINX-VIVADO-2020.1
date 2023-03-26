`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Release Date  : 18_04_2022
// Design Name   : FPGA CLB Resources
// Release       : 0.0 
// Module Name   : sp_dist_ram_asyn_rd_tb.v
// Target Devices: Xilinx 7 series FPGA
// Tool versions : VIVADO 2020.1
// Description   : Test bench for Single Port Distributed RAM
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// DESIGN HIERARCHY 
// - Top Module (Testbench) - sp_dist_ram_asyn_rd_tb.v
// - DUT        	    - sp_dist_ram_asyn_rd.v  
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// MODULE DECLARATION 
//------------------------------------------------------------------------------
  module sp_dist_ram_asyn_rd_tb;
// REG DECLARATION
  reg 		w_tb_clock		     		; // Clock Input
  reg	 	w_tb_write_en	     			; // Write Enable Logic
  reg	[7:0]   w_tb_address_in				; // 8 bit Address Bus
  reg 	[7:0]	w_tb_data_in				; // 8 bit Input Data Bus 	
// WIRE DECLARATION
  wire  [7:0]	w_tb_dataout		          	; // 8 bit Output Data Bus  
//------------------------------------------------------------------------------
// DUT INSTANTIATION
//------------------------------------------------------------------------------ 
  sp_dist_ram_256x8 dut
  (
	.clk_in  		(w_tb_clock),
	.write_en		(w_tb_write_en),
    	.address_in 		(w_tb_address_in),
    	.data_in		(w_tb_data_in),
	.data_out		(w_tb_dataout)
  );
//------------------------------------------------------------------------------
// TEST BENCH CLOCK GENERATION 
//------------------------------------------------------------------------------     
  initial 
    begin
      w_tb_clock = 1'b0;
    end

  always #5 w_tb_clock = ~w_tb_clock;
//------------------------------------------------------------------------------
// TEST VECTOR GENERATION 
//------------------------------------------------------------------------------
  initial
    begin
      // Test with write enable and random data
      w_tb_write_en = 1'b0;
      w_tb_address_in = 8'd0;
      w_tb_data_in = 8'd0;
      
  #50 w_tb_write_en = 1'b1;    
      
      repeat (100)
        begin
   	  #10 w_tb_address_in = w_tb_address_in + 1'b1;
              w_tb_data_in = $urandom;
        end    

  #200 $stop; 
      	
    end  
//------------------------------------------------------------------------------
// OUTPUT MONITOR 
//------------------------------------------------------------------------------
   initial
     begin
       $monitor($time,"i_clock = %b, i_write_en = %b,i_address_in = %d,i_data_in = %d,o_data_out = %d",  
                       w_tb_clock, w_tb_write_en, w_tb_address_in, w_tb_data_in,w_tb_dataout) ;
     end   
endmodule
