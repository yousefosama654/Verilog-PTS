module BinaryCounter(sync_clr,d,q,clk,rst,load,enable);
input load;
input [3:0]d;
input enable,clk,rst,sync_clr;
output [3:0]q;
reg [3:0] r_reg;
wire [3:0] r_next;
always @(posedge clk or posedge rst)begin
if(rst)
r_reg<=0;
else
r_reg<=r_next;
end
assign r_next=(sync_clr==1) ? 0:
				 (load==1)     ? d:
				 (enable==1)   ? r_reg +1 :
				 r_reg;
assign q=r_reg;
endmodule
/***************************************************************/
module tb();
reg load;
reg [3:0]d;
reg enable,clk,rst,sync_clr;
wire[3:0]q;

BinaryCounter obj (sync_clr,d,q,clk,rst,load,enable);
always begin
clk =~clk; #5;
end
initial begin
clk=0;enable=0;load=0;d=4'b0101;rst=1;sync_clr=0; 
#10 rst=0;
#10 enable =1;
#10 sync_clr =1;
#10 sync_clr =0;
#10 load=1;
#10 load=0;
end
endmodule
/***************************************************************/