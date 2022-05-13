// the sequence is 1011 with overlapping
module SequenceDetector(x,clk,rst,y); 
input x,clk,rst;
output reg y; //FSM Technique
parameter s0=3'b000,s1=3'b001,s2=3'b011,s3=3'b010,s4=3'b110; // this is the states
reg [2:0] current_state,next_state;
/******************************************/
always @(posedge clk,posedge rst) begin //at the change of rst or clk
if(rst)
current_state<=s0;
else
current_state<=next_state;
end
/******************************************/
always @(current_state or x) begin //at the change of input or clock
case (current_state)
s0 :
if(x)
next_state<=s1;
else
next_state<=s0;
/******************************************/
s1 :
if(x)
next_state<=s1;
else
next_state<=s2;
/******************************************/
s2 :
if(x)
next_state<=s3;
else
next_state<=s0;
/******************************************/
s3 :
if(x)
next_state<=s4;
else
next_state<=s2;
/******************************************/
s4 :
if(x)
next_state<=s1;
else
next_state<=s2;
/******************************************/
endcase
end
/******************************************/
always @(current_state) begin
case(current_state) 
s0 : y=0;
s1 : y=0;
s2 : y=0;
s3 : y=0;
s4 : y=1;
endcase
end
/******************************************/
endmodule
