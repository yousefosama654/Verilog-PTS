module BCDEncoder (in,out);
input [3:0]in;
output reg [3:0]out;
always @(in)
begin
if (in[3:0]>=4'b0101&& in[3:0] <=4'b1100)
out[3:0]=in[3:0]+4'b0011;
else 
out[3:0]=in[3:0];
 


end

endmodule

module Binarytobcd(bin,hunderds,tens,ones);

input  [7:0] bin;
output [3:0] hunderds;
output [3:0] tens;
output [3:0] ones;
wire [3:0] in1,in2,in3,in4,in5,in6,in7;
wire [3:0]out1,out2,out3,out4,out5,out6,out7;
BCDEncoder ob1 (in1,out1);
BCDEncoder ob2 (in2,out2);
BCDEncoder ob3 (in3,out3);
BCDEncoder ob4 (in4,out4);
BCDEncoder ob5 (in5,out5);
BCDEncoder ob6 (in6,out6);
BCDEncoder ob7 (in7,out7);


assign in1[3]=0;
assign in1[2]=bin[7];
assign in1[1]=bin[6];
assign in1[0]=bin[5];

assign in2[3]=out1[2];
assign in2[2]=out1[1];
assign in2[1]=out1[0];
assign in2[0]=bin[4];

assign in3[3]=out2[2];
assign in3[2]=out2[1];
assign in3[1]=out2[0];
assign in3[0]=bin[3];


assign in4[3]=0;
assign in4[2]=out1[3];
assign in4[1]=out2[3];
assign in4[0]=out3[3];


assign in5[3]=out3[2];
assign in5[2]=out3[1];
assign in5[1]=out3[0];
assign in5[0]=bin [2];


assign in6[3]=out4[2];
assign in6[2]=out4[1];
assign in6[1]=out4[0];
assign in6[0]=out5[3];

assign in7[3]=out5[2];
assign in7[2]=out5[1];
assign in7[1]=out5[0];
assign in7[0]=bin[1];


assign hunderds [3]=0;
assign hunderds[2]=0;
assign hunderds [1]=out4[3];
assign hunderds[0]=out6[3];

assign tens[3]=out6[2];
assign tens[2]=out6[1];
assign tens[1]=out6[0];
assign tens[0]=out7[3];


assign ones[3]=out7[2];
assign ones[2]=out7[1];
assign ones[1]=out7[0];
assign ones[0]=bin[0];
endmodule



module tb;
reg [7:0] bin;
wire [3:0] hunderds;
wire [3:0] tens;
wire [3:0] ones;

Binarytobcd ob(bin,hunderds,tens,ones);

initial begin
bin=8'b00000000;

#100

bin=8'b00001111;

#100
bin=8'b00011111;
#100
bin=8'b11111111;
#100
bin=8'b01010101;


end
endmodule