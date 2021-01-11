`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/11/30 23:29:53
// Design Name:
// Module Name: PDM_decoder_8ch
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module PDM_decoder_8ch(PDM_in_1,
                       PDM_in_2,
                       PDM_in_3,
                       PDM_in_4,
                       PDM_in_5,
                       PDM_in_6,
                       PDM_in_7,
                       PDM_in_8,
                       clk_240M,                                              
                       PDM_clk,
                       rstn,
                       data1,
                       data2,
                       data3,
                       data4,
                       data5,
                       data6,
                       data7,
                       data8,
                       PDMintc_irpt
                            );     
    
    input PDM_in_1;
    input PDM_in_2;
    input PDM_in_3;
    input PDM_in_4;
    input PDM_in_5;
    input PDM_in_6;
    input PDM_in_7;
    input PDM_in_8;
    input clk_240M;
    input rstn;
    output PDM_clk;
    
    output reg [31:0]data1;
    output reg [31:0]data2;
    output reg [31:0]data3;
    output reg [31:0]data4;
    output reg [31:0]data5;
    output reg [31:0]data6;
    output reg [31:0]data7;
    output reg [31:0]data8;
    output reg PDMintc_irpt;
    

    
    clk_div50 clk_div50_0(
    .clk_div50(PDM_clk),
    .clk_in(clk_240M),
    .rstn(rstn));
    
    
    wire PDM_m_axis_tvalid_1;
    wire PDM_m_axis_tready_1;
    wire [31 : 0]PDM_m_axis_tdata_1;
    wire PDM_m_axis_tvalid_2;
    wire PDM_m_axis_tready_2;
    wire [31 : 0]PDM_m_axis_tdata_2;
    wire PDM_m_axis_tvalid_3;
    wire PDM_m_axis_tready_3;
    wire [31 : 0]PDM_m_axis_tdata_3;
    wire PDM_m_axis_tvalid_4;
    wire PDM_m_axis_tready_4;
    wire [31 : 0]PDM_m_axis_tdata_4;
    wire PDM_m_axis_tvalid_5;
    wire PDM_m_axis_tready_5;
    wire [31 : 0]PDM_m_axis_tdata_5;
    wire PDM_m_axis_tvalid_6;
    wire PDM_m_axis_tready_6;
    wire [31 : 0]PDM_m_axis_tdata_6;
    wire PDM_m_axis_tvalid_7;
    wire PDM_m_axis_tready_7;
    wire [31 : 0]PDM_m_axis_tdata_7;
    wire PDM_m_axis_tvalid_8;
    wire PDM_m_axis_tready_8;
    wire [31 : 0]PDM_m_axis_tdata_8;
      
 
       always @ (posedge clk_240M or negedge rstn)begin
           if (!rstn)begin
           data1<=0;
           data2<=0;
           data3<=0;
           data4<=0;
           data5<=0;
           data6<=0;
           data7<=0;
           data8<=0;
           PDMintc_irpt <= 0;
           end
           else if(PDM_m_axis_tvalid_1 == 1)begin
                      data1 <= PDM_m_axis_tdata_1;
                      data2 <= PDM_m_axis_tdata_2;
                      data3 <= PDM_m_axis_tdata_3;
                      data4 <= PDM_m_axis_tdata_4;
                      data5 <= PDM_m_axis_tdata_5;
                      data6 <= PDM_m_axis_tdata_6;
                      data7 <= PDM_m_axis_tdata_7;
                      data8 <= PDM_m_axis_tdata_8;
                      PDMintc_irpt <= 1;
            end     
            else  begin
            PDMintc_irpt <= 0;
            end    
       end
     assign PDM_m_axis_tready_1 = 1;
     assign PDM_m_axis_tready_2 = 1;
     assign PDM_m_axis_tready_3 = 1;
     assign PDM_m_axis_tready_4 = 1;
     assign PDM_m_axis_tready_5 = 1;
     assign PDM_m_axis_tready_6 = 1;
     assign PDM_m_axis_tready_7 = 1;
     assign PDM_m_axis_tready_8 = 1;
       
    PDM_decoder PDM_decoder_1(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_1),
    .PDM_m_axis_tready(PDM_m_axis_tready_1), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_1), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_1),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_2(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_2),
    .PDM_m_axis_tready(PDM_m_axis_tready_2), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_2), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_2),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_3(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_3),
    .PDM_m_axis_tready(PDM_m_axis_tready_3), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_3), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_3),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_4(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_4),
    .PDM_m_axis_tready(PDM_m_axis_tready_4), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_4), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_4),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_5(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_5),
    .PDM_m_axis_tready(PDM_m_axis_tready_5), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_5), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_5),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_6(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_6),
    .PDM_m_axis_tready(PDM_m_axis_tready_6), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_6), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_6),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_7(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_7),
    .PDM_m_axis_tready(PDM_m_axis_tready_7), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_7), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_7),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    PDM_decoder PDM_decoder_8(
    .PDM_m_axis_tvalid(PDM_m_axis_tvalid_8),
    .PDM_m_axis_tready(PDM_m_axis_tready_8), // input wire m_axis_tready
    .PDM_m_axis_tdata(PDM_m_axis_tdata_8), // output wire [31 : 0] m_axis_tdata
    .PDM_in(PDM_in_8),
    .PDM_clk(PDM_clk),
    .clk_240M(clk_240M),
    .rstn(rstn)
    );
    
  
 
 endmodule           
    