
`timescale 1 ns / 1 ps

	module Alarm_Clock_v2_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        input i_Clk_100MHz,
        input i_Reset,
        input i_Change_Alarm,
        input i_Encoder_Enable,
        input i_Encoder_Change_Mode,
        input i_Encoder_A,
        input i_Encoder_B,
        input i_Alarm_Enable,
        input i_Alarm_Game_Enable,
        input [9:0] i_Alarm_Game_Switches,
        output [6:0] o_Segments,
        output [7:0] o_Anodes,
        output o_Alarm_Enabled,
        output o_Alarm_On,
        output [9:0] o_Alarm_Game_LEDs,
        output o_AUD_SD,
        output o_AUD_PWM,
        output o_PM,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	Alarm_Clock_v2_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) Alarm_Clock_v2_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		
		.i_Clk_100MHz           (i_Clk_100MHz),
        .i_Reset                (i_Reset),
        .i_Change_Alarm         (i_Change_Alarm),
        .i_Encoder_Enable       (i_Encoder_Enable),
        .i_Encoder_Change_Mode  (i_Encoder_Change_Mode),
        .i_Encoder_A            (i_Encoder_A),
        .i_Encoder_B            (i_Encoder_B),
        .i_Alarm_Enable         (i_Alarm_Enable),
        .i_Alarm_Game_Enable    (i_Alarm_Game_Enable),
        .i_Alarm_Game_Switches  (i_Alarm_Game_Switches),
        .o_Segments             (o_Segments),
        .o_Anodes               (o_Anodes),
        .o_Alarm_Enabled        (o_Alarm_Enabled),
        .o_Alarm_On             (o_Alarm_On),
        .o_Alarm_Game_LEDs      (o_Alarm_Game_LEDs),
        .o_AUD_SD               (o_AUD_SD),
        .o_AUD_PWM              (o_AUD_PWM),
        .o_PM                   (o_PM)
	);

	// Add user logic here

	// User logic ends

	endmodule
