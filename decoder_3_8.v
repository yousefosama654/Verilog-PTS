module decoder_3_8(x,y);
input [2:0]x;
output reg [7:0] y;

always @(x) begin
case(x)
 0: y=2**0;
 1: y=2**1;
 2: y=2**2;
 3: y=2**3;
 4: y=2**4;
 5: y=2**5;
 6: y=2**6;
 7: y=2**7;
endcase
end
endmodule

module decoder_3_8_tb();
reg [2:0]x;
wire [7:0] y;
decoder_3_8 obj(x,y);

initial begin
x=3; #100;
end
endmodule
