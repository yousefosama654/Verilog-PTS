module SSD(BCD,result);
input [3:0] BCD;
output[6:0]result;
assign result[0]=   ~( BCD[1] | BCD[3] | (BCD[2] ~^ BCD[0]) ) ;
assign result[1]=  ~(~BCD[2] | ( BCD[1]~^ BCD[0] ) );
assign result[2]=  ~(~BCD[1] | BCD[2] | BCD[0]);
assign result[3]= ~( BCD[3] | (BCD[1]&~BCD[0] ) | (BCD[2]&~BCD[1]&BCD[0]) | (~BCD[2]&( BCD[1]|~BCD[0] )) );
assign result[4]= ~(~BCD[0] & ( BCD[1] |~BCD[2] ) );
assign result[5]= ~( BCD[3] | ( BCD[2]& ( ~BCD[1] | ~BCD[0] ) ) |(~BCD[1]&~BCD[0]) )  ;
assign result[6]= ~(( BCD[2]  ^ BCD[1] ) | BCD[3] | (BCD[2] & ~BCD[0]) );

endmodule

module SSD_tb();

reg [3:0] BCD;
wire[6:0]result;

SSD  obj (BCD,result);

initial begin
BCD=6; #100;
BCD=7; #100;
BCD=6; #100;
BCD=5; #100;
end
endmodule