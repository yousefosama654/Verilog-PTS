module Money_Machine(

input reset,
input clk,
input enable,
input value,
output reg out,
output reg extra
);
reg [2:0]state_reg;
reg [2:0]state_next;
localparam s1=3'b000;
localparam s2=3'b001;
localparam s3=3'b010;

always @(posedge clk,posedge reset)begin
 
if(reset)begin

state_reg <= s1;
end
else begin
state_reg <= state_next;
end

end
always @(state_reg,enable,value)begin // enter the second input 
case(state_reg)

s1:begin
if(!enable)begin
state_next=s1;
out=1'b0;
extra=1'b0;
end
else if(enable && !value) begin
state_next=s2;
out=1'b0;
extra=1'b0;
end
else if(enable && value) begin
state_next=s3;
out=1'b0;
extra=1'b0;
end
end
s2:begin
if(!enable)begin
state_next=s2;
out=1'b0;
extra=1'b0;
end
else if(enable && !value) begin
state_next=s3;
out=1'b0;
extra=1'b0;
end
else if(enable && value) begin 
state_next=s1;
out=1'b1;
extra=1'b0;
end
end
s3:begin
if(!enable) begin 
state_next=s3;
out=1'b0;
extra=1'b0;
end
else if(enable && !value)begin 
state_next=s1;
out=1'b1;
extra=1'b0;
end
else if(enable && value)begin 
state_next=s1;
out=1'b1;
extra=1'b1;
end
end
default: begin
state_next=s1;
out=1'b0;
extra=1'b0;
end
endcase
end



endmodule 
module Money_Machine_tb();
`timescale 1ns/ 10ps

reg value;
reg clk;
reg reset;
reg enable;

wire out;
wire extra;

Money_Machine obj(
reset,
clk,
enable,
value,
out,
extra
);

always
begin
	#5 clk = ~clk;
end


initial begin
	reset = 1;
	
	clk = 0;
	enable= 0;
	value = 0;
	
	#10 reset = 0;
	
	#5  value = 1;
		 enable = 1;
	
	#15 enable = 0;
		 value = 0;
	#10 
	$finish;
	

end
endmodule

