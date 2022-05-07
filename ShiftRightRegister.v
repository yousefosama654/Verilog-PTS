module ShiftRightRegister(d,q,clk,rst);
input clk,d,rst;
output q;
reg [3:0] r_reg;
wire [3:0] r_next;
always @(posedge clk or posedge rst) begin

if(rst)
r_reg<=0;
else
r_reg<=r_next;
end
assign r_next={d,r_reg[3:1]};
assign q=r_reg[0];

endmodule
/***************************************************************/
module TB_2();

reg clk,d,rst;
wire q;
ShiftRightRegister obj(d,q,clk,rst);

always begin
clk=~clk; #5;
end

initial begin 
clk=0; rst=1; d=0;

#10 rst=0;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=0;

end

endmodule
/***************************************************************/