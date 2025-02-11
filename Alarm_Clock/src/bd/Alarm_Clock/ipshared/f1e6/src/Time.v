`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Time
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module Time
    #(
        parameter START_MINUTES = 0,
        parameter START_HOURS = 0
    ) (
        input i_Clk_5MHz,
        input i_Clk_100Hz_Pulse,
        input i_Reset,
        input i_Enable_Count,
        input i_Seconds_1st_Digit_Inc,
        input i_Seconds_1st_Digit_Dec,
        input i_Seconds_2nd_Digit_Inc,
        input i_Seconds_2nd_Digit_Dec,
        input i_Minutes_1st_Digit_Inc,
        input i_Minutes_1st_Digit_Dec,
        input i_Minutes_2nd_Digit_Inc,
        input i_Minutes_2nd_Digit_Dec,
        input i_Hours_1st_Digit_Inc,
        input i_Hours_1st_Digit_Dec,
        input i_Hours_2nd_Digit_Inc,
        input i_Hours_2nd_Digit_Dec,
        output [31:0] o_Time,
        output o_PM,
        
        output [23:0] o_Time_Stamp
        
//        ,
//        output [16:0] o_Seconds,
//        output [16:0] o_Minutes,
//        output [16:0] o_Hours

//        ,
//        output [3:0] o_Minutes_1st_Digit,
//        output [3:0] o_Minutes_2nd_Digit,
//        output [3:0] o_Hours_1st_Digit,
//        output [3:0] o_Hours_2nd_Digit
    );
    
    wire w_Fraction_Seconds_Inc = i_Enable_Count & i_Clk_100Hz_Pulse;
    
    wire [23:0] w_Fraction_Seconds;
    Time_Counter
    #(
        .BIT_WIDTH              (24),
        .MAX_COUNT              (8640000),
        .START_MINUTES          (START_MINUTES),
        .START_HOURS            (START_HOURS)
    ) U_Time_Counter (
        .i_Clk                  (i_Clk_5MHz),
        .i_Reset                (i_Reset),
        .i_Enable               (1'b1),
        .i_Fraction_Seconds_Inc (w_Fraction_Seconds_Inc),
        .i_Seconds_1st_Digit_Inc(i_Seconds_1st_Digit_Inc),
        .i_Seconds_1st_Digit_Dec(i_Seconds_1st_Digit_Dec),
        .i_Seconds_2nd_Digit_Inc(i_Seconds_2nd_Digit_Inc),
        .i_Seconds_2nd_Digit_Dec(i_Seconds_2nd_Digit_Dec),
        .i_Minutes_1st_Digit_Inc(i_Minutes_1st_Digit_Inc),
        .i_Minutes_1st_Digit_Dec(i_Minutes_1st_Digit_Dec),
        .i_Minutes_2nd_Digit_Inc(i_Minutes_2nd_Digit_Inc),
        .i_Minutes_2nd_Digit_Dec(i_Minutes_2nd_Digit_Dec),
        .i_Hours_1st_Digit_Inc  (i_Hours_1st_Digit_Inc),
        .i_Hours_1st_Digit_Dec  (i_Hours_1st_Digit_Dec),
        .i_Hours_2nd_Digit_Inc  (i_Hours_2nd_Digit_Inc),
        .i_Hours_2nd_Digit_Dec  (i_Hours_2nd_Digit_Dec),
        .o_Count                (w_Fraction_Seconds)
    );
    
    wire [3:0] w_Fraction_Seconds_1st_Digit = (w_Fraction_Seconds / 10) - 10 * (w_Fraction_Seconds / 100);
    wire [3:0] w_Fraction_Seconds_2nd_Digit = w_Fraction_Seconds % 10;
    
    wire [16:0] w_Seconds = w_Fraction_Seconds / 100;
    wire [3:0] w_Seconds_1st_Digit = (w_Seconds / 10) - 6 * (w_Seconds / 60);
    wire [3:0] w_Seconds_2nd_Digit = w_Seconds % 10;

    wire [10:0] w_Minutes = w_Seconds / 60;
    wire [3:0] w_Minutes_1st_Digit = (w_Minutes / 10) - 6 * (w_Minutes / 60);
    wire [3:0] w_Minutes_2nd_Digit = w_Minutes % 10;
    
    wire [4:0] w_Hours = w_Minutes / 60;
    wire [3:0] w_Hours_1st_Digit = w_Hours == 4'd00 ? 4'd01
                                 : w_Hours <= 4'd12 ? w_Hours / 10
                                 : (w_Hours - 12) / 10;
    wire [3:0] w_Hours_2nd_Digit = w_Hours == 4'd00 ? 4'd02
                                 : w_Hours <= 4'd12 ? w_Hours % 10
                                 : (w_Hours - 12) % 10;
    
    wire w_PM = w_Hours >= 8'd12 ? 1'b1 : 1'b0;
    
    assign o_Time = {w_Hours_1st_Digit, w_Hours_2nd_Digit, w_Minutes_1st_Digit, w_Minutes_2nd_Digit,
                     w_Seconds_1st_Digit, w_Seconds_2nd_Digit, w_Fraction_Seconds_1st_Digit, w_Fraction_Seconds_2nd_Digit};
    assign o_PM = w_PM;
    
    assign o_Time_Stamp = w_Fraction_Seconds;
    
//    assign o_Seconds = w_Seconds;
//    assign o_Minutes = w_Minutes;
//    assign o_Hours = w_Hours;
//    assign o_Minutes_1st_Digit = w_Minutes_1st_Digit;
//    assign o_Minutes_2nd_Digit = w_Minutes_2nd_Digit;
//    assign o_Hours_1st_Digit = w_Hours_1st_Digit;
//    assign o_Hours_2nd_Digit = w_Hours_2nd_Digit;
    
endmodule