`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/07 15:40:25
// Design Name: 
// Module Name: breath_ip_tb
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


module breath_ip_tb();


reg sys_clk;
reg sys_rst_n;
reg sw_ctrl;
reg set_en;
wire led;

initial sys_clk=1'b1;
always #20 sys_clk=~sys_clk;


initial begin
    sys_rst_n=1'b1;
    sw_ctrl=1'b0;
    #27;
    sw_ctrl=1'b1;
    #27;
    set_en=1'b1;

    #50000;
end



breath_led   breath_led_0
(
.sys_clk(sys_clk) , //时钟信号
.sys_rst_n(sys_rst_n) , //复位信号
.sw_ctrl(sw_ctrl) , //呼吸灯开关控制信号1：亮0:灭
.set_en(set_en) , //设置呼吸灯频率设置使能信号
.set_freq_step(10'd600) , //设置呼吸灯频率变化步长
.led(led) //LED
);

endmodule
