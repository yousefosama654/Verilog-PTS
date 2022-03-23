module secmux(I,s,y);
input [3:0] I;
input [1:0] s;
output y;
assign y= ((~s[1]&~s[0]&I[0]) | (~s[1]&s[0]&I[1]) |(s[1]&~s[0]&I[2]) |(s[1]&s[0]&I[3]));
endmodule


module secmux_tb();

reg [3:0] I;
reg [1:0] s;
wire y;
 secmux obj(I,s,y);
initial begin

I[0]=0;I[1]=1;I[2]=1;I[3]=0;s[1]=1;s[0]=0; #100;
end

endmodule
