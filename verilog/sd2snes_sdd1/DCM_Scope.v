////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 14.7
//  \   \         Application : xaw2verilog
//  /   /         Filename : DCM_Scope.v
// /___/   /\     Timestamp : 12/02/2018 21:05:41
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -intstyle D:/sd2snes/verilog/sd2snes_sdd1/ipcore_dir/DCM_Scope.xaw -st DCM_Scope.v
//Design Name: DCM_Scope
//Device: xc3s400-4pq208
//
// Module DCM_Scope
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
// Period Jitter (unit interval) for block DCM_INST = 0.07 UI
// Period Jitter (Peak-to-Peak) for block DCM_INST = 0.75 ns
`timescale 1ns / 1ps

module DCM_Scope(CLKIN_IN, 
                 RST_IN, 
                 CLKDV_OUT, 
                 CLKFX_OUT, 
                 CLKIN_IBUFG_OUT, 
                 CLK0_OUT, 
                 LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKDV_OUT;
   output CLKFX_OUT;
   output CLKIN_IBUFG_OUT;
   output CLK0_OUT;
   output LOCKED_OUT;
   
   wire CLKDV_BUF;
   wire CLKFB_IN;
   wire CLKFX_BUF;
   wire CLKIN_IBUFG;
   wire CLK0_BUF;
   wire GND_BIT;
   
   assign GND_BIT = 0;
   assign CLKIN_IBUFG_OUT = CLKIN_IBUFG;
   assign CLK0_OUT = CLKFB_IN;
   BUFG  CLKDV_BUFG_INST (.I(CLKDV_BUF), 
                         .O(CLKDV_OUT));
   BUFG  CLKFX_BUFG_INST (.I(CLKFX_BUF), 
                         .O(CLKFX_OUT));
   IBUFG  CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG  CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   DCM #( .CLK_FEEDBACK("1X"), .CLKDV_DIVIDE(4.0), .CLKFX_DIVIDE(1), 
         .CLKFX_MULTIPLY(4), .CLKIN_DIVIDE_BY_2("FALSE"), 
         .CLKIN_PERIOD(41.667), .CLKOUT_PHASE_SHIFT("NONE"), 
         .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), .DFS_FREQUENCY_MODE("LOW"), 
         .DLL_FREQUENCY_MODE("LOW"), .DUTY_CYCLE_CORRECTION("TRUE"), 
         .FACTORY_JF(16'h8080), .PHASE_SHIFT(0), .STARTUP_WAIT("TRUE") ) 
         DCM_INST (.CLKFB(CLKFB_IN), 
                 .CLKIN(CLKIN_IBUFG), 
                 .DSSEN(GND_BIT), 
                 .PSCLK(GND_BIT), 
                 .PSEN(GND_BIT), 
                 .PSINCDEC(GND_BIT), 
                 .RST(RST_IN), 
                 .CLKDV(CLKDV_BUF), 
                 .CLKFX(CLKFX_BUF), 
                 .CLKFX180(), 
                 .CLK0(CLK0_BUF), 
                 .CLK2X(), 
                 .CLK2X180(), 
                 .CLK90(), 
                 .CLK180(), 
                 .CLK270(), 
                 .LOCKED(LOCKED_OUT), 
                 .PSDONE(), 
                 .STATUS());
endmodule
