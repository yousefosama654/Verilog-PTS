module adder(a,b,sel,res);

input [3:0]a,b;
input sel;
output [3:0]res;
assign res= sel  ? a+b :a-b ;

endmodule
module adder_tb();

reg [3:0] a,b;
reg sel;
wire [3:0] res;
 adder obj(a,b,sel,res);
initial begin

a= 4'b1101; b=4'b0010 ;sel=1 ; #1000;
a= 4'b0101; b=4'b0011 ; sel=0 ; #1000;
//contains all the trial
end

endmodule
