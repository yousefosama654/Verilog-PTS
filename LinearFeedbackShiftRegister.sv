module LinearFeedbackShiftRegister (clk, rst, enable, load,DataIn,seed,DataOut);

input clk,enable,rst,load,DataIn ;
input [14:0]seed;
output reg DataOut;

reg XOR;
reg [14:0]data;
initial data=15'b101010001110110;
always @(posedge clk or posedge rst )begin
if(rst)
data<=0;
else if(load)
data<=seed;
else begin
XOR=data[13]^data[14];
data={ data[13:0],XOR };
DataOut=XOR ^ DataIn;
end

end

endmodule


module tb();
reg clk,rst,enable,load;
reg DataIn;
reg [14:0]Seed;
wire  DataOut;
LinearFeedbackShiftRegister obj (clk, rst, enable, load,DataIn,Seed,DataOut);

always begin
clk=~clk; #5;
end

initial begin
clk=0;rst=0;enable=1;load=0;DataIn=0;Seed=4;
#10 DataIn=1;
#10 DataIn=0;
#10 DataIn=1;
#10 DataIn=0;


end
endmodule

/************************************************************************/
