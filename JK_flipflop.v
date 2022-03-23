module jkflipflop ( jk,clk,q);
input [1:0]jk,clk;
output reg q;
always @(posedge clk)
begin
case (jk)
2'b00: q=q;
2'b01 : q=0;
2'b10: q=1;
2'b11: q=~q;
endcase
end
endmodule

module jkflipflop_tb();

reg [1:0]jk;
reg clk;
wire q;
jkflipflop obj(jk,clk,q);
always begin
#100 clk=~clk;
#200 jk[0]=~jk[0];
#200 jk[1]=~jk[1];
end
initial begin
clk=1;
jk[0]=0;
jk[1]=1;
$finish;
end
endmodule



