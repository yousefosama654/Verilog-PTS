/***************************************************************/
module RegisterFile #(parameter AW=2,parameter DW=16 )(rst,clk,W_Enable,W_Data,W_Address,R_Data,R_Address);

localparam N= 2**AW;
input rst,clk,W_Enable;
input[DW:0]W_Data;
input[AW:0]W_Address,R_Address; //all address are input
output [DW:0]R_Data;
reg [DW:0]Array_Data[N:0]; // number of registers are 00 01 10 11 like states
integer i;
always @(posedge clk or posedge rst) begin
if(rst)
for(i=0;i<N;i=i+1)
Array_Data[i]=0;
else if(W_Enable)
Array_Data[W_Address]=W_Data;
end
assign R_Data=Array_Data[R_Address];
endmodule
/***************************************************************/