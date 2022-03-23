module mux_4(x,y,z,w,sel,q);
input [3:0] x;
input [3:0] y;
input [3:0] z;
input [3:0] w;
input [1:0] sel;
output reg [3:0] q;
// because we will  use it in the LHS
always @(x or y or z or w or sel)
// why freezing when we use  always begin block
case(sel)

2'b00: q=x ;
2'b01: q=y ;
2'b10: q=z ;
2'b11: q=w ;
endcase
endmodule

module mux_4_tb();

reg [3:0] x;
reg [3:0] y;
reg [3:0] z;
reg [3:0] w;
reg [1:0] sel;
wire [3:0] q;
 mux_4 obj(x,y,z,w,sel,q);
 always begin
 sel=~sel; #100;
 end
 initial begin
 
 x=3; y=4; z=8; w=2;sel=3; #100;
 end

endmodule

