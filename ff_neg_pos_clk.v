module ff_neg_pos_clk(inp1,inp2,out1,out2,clk);
input[3:0]inp1 ;
input[3:0]inp2 ;
input clk;
output reg [3:0]out1;
output reg[3:0]out2;

always@ ( clk) begin

if(clk)
out1<=inp1;
else
out2<=inp2;

end
endmodule
/**********************************************************/
module tb();
reg[3:0] x1;
reg[3:0] x2;
reg clk;
wire [3:0] y1;
wire [3:0] y2;
ff_neg_pos_clk obj(x1,x2,y1,y2,clk);
initial begin
x1=3; x2=4;clk=1;#50 ;
x1=5;x2=8;   #50;
x1=12;x2=13; #10;
end

always begin

clk=~clk; #5;
end
endmodule


/***************************************************************/