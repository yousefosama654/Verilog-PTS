module Dflipflop(d,rst,clk,q);

input d,rst,clk;
output reg q;

always @(posedge clk) begin
if(rst)
q<=0;
else
q<=d;
end
endmodule

module Dflipflop_tb();

reg d,rst,clk;
wire q;
Dflipflop adel(d,rst,clk,q);
always begin

#100 clk=~clk;
#200 d=~d;
end

initial begin
d=0;
clk=0;
rst=0;
end
endmodule
