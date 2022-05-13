module Light_System(rst,clk,p1,p2,led1,led2,led3);
input rst,clk,p1,p2;
output reg led1,led2,led3;
reg[1:0] state_reg;
reg[1:0] next_reg;
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
initial led1=0;
initial led2=0;
initial led3=0;
initial state_reg=s0;
//*****************************************************
always @(posedge clk,posedge rst)begin
if(rst)
state_reg<=s0;
else
state_reg<=next_reg;
end
//*****************************************************
always @(state_reg,p1,p2)begin // the logic of next state && output

case(state_reg)
/***************/
s0: begin
if( (p1 &&!p2 ) || (!p1 &&p2 ) ) begin
next_reg<=s1;
led1<=1;
led2<=0;
led3<=0;
end
end
/**************/
s1: begin
if(p1&&!p2)begin
next_reg<=s2;
led1<=0;
led2<=1;
led3<=0;
end
else if(!p1&&p2) begin
next_reg<=s3;
led1<=0;
led2<=0;
led3<=1;
end
end
/**************/
s2: begin
if((p1 &&!p2 ) || (!p1 &&p2 ))begin
next_reg<=s0;
led1<=0;
led2<=0;
led3<=0;
end
end
/**************/
s3: begin
if((p1 &&!p2 ) || (!p1 &&p2 ))begin
next_reg<=s0;
led1<=0;
led2<=0;
led3<=0;
end
end
/**************/
endcase

end
//*****************************************************
endmodule

module tb();
reg rst;
reg clk;
reg p1;
reg p2;
wire led1;
wire led2;
wire led3;
Light_System obj (rst,clk,p1,p2,led1,led2,led3);

always begin
#5 clk=~clk;
end
initial begin
rst=1;
clk=0;
p1=0;
p2=0;
// here is s0
#10
rst =0;
p1=1;
p2=0;
// here is s1
#10
p1=1;
p2=0;
// here is s2
#10
p1=0;
p2=1;
// here is s0 again
end
endmodule