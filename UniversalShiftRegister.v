module UniversalShiftRegister(q,ctrl,d,clk,rst);
input[3:0] d;
input clk,rst;
input [1:0]ctrl;
output [3:0] q;
reg [3:0] r_reg;
wire [3:0] r_next;

always @(posedge clk or posedge rst )begin
if(rst)
r_reg<=0;
else
r_reg<=r_next;
end
//always @(ctrl) begin
//case(ctrl)
//
// 2'b00 : assign r_next=r_reg;
//
// 2'b01 : assign r_next={r_reg[2:0],d[0]};
//
// 2'b10 : assign r_next={d[3],r_reg[3:1]};
//
// 2'b11 :  assign r_next=d;
//
//endcase
//end
/* i can't assign in always block*/
assign r_next=(ctrl==2'b00)? r_reg :
				  (ctrl==2'b01)? {r_reg[2:0],d[0]} :
				  (ctrl==2'b10)? {d[3],r_reg[3:1]} :
				    d;
assign q=r_reg;

endmodule
/***************************************************************/
/***************************************************************/
module tb_4();

reg[3:0] d;
reg clk,rst;
reg [1:0]ctrl;
wire [3:0] q;

UniversalShiftRegister obj (q,ctrl,d,clk,rst);
always begin
clk=~clk; #5;
end
initial begin
clk=0;rst=1;ctrl=0;d=0;
// zero at begining
#10 rst=0;
#10 ctrl=3;d=4'b1010;
#10 ctrl=1;
#10 ctrl=2;
#10 ctrl=0;
#10 ctrl=3; d=4'b0010;
end
endmodule

/***************************************************************/