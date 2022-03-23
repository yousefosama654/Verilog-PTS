module lab (x,y,cin,sum,cout);
input [3:0]x;
input [3:0]y;
input cin;
wire[7:0]s;
wire[7:0]c;
wire[2:0]coutf;
output cout;
output[3:0]sum;
// start os assign
//first row of FA
assign {c[0],s[0]}=x[0]+y[0]+0;
assign {c[1],s[1]}=x[1]+y[1]+0;
assign {c[2],s[2]}=x[2]+y[2]+0;
assign {c[3],s[3]}=x[3]+y[3]+0;
//second row of FA
assign {c[4],s[4]}=x[0]+y[0]+1;
assign {c[5],s[5]}=x[1]+y[1]+1;
assign {c[6],s[6]}=x[2]+y[2]+1;
assign {c[7],s[7]}=x[3]+y[3]+1;
// third row to get cout
assign coutf[0]= ~cin ? c[0]:c[4] ;
assign coutf[1]= ~coutf[0] ? c[1]:c[5] ;
assign coutf[2]= ~coutf[1] ? c[2]:c[6] ;
assign cout= ~coutf[2]? c[3]:c[7] ;
//forth row to get sum
assign sum[0]=cin ?s[4] : s[0] ;
assign sum[1]=coutf[0] ?s[5] : s[1] ;
assign sum[2]=coutf[1] ?s[6] : s[2] ;
assign sum[3]=coutf[2] ?s[7] : s[3] ;
endmodule

module lab_tb();

reg [3:0]x;
reg [3:0]y;
reg cin;
wire [3:0]sum;
wire cout;
lab obj(x,y,cin,sum,cout);
initial begin

x=4'b0110; y=4'b0011;cin=1'b0;#100;
x=4'b0011; y=4'b0001;cin=1'b1;#100;
x=4'b0110; y=4'b0111;cin=1'b0;#100;

end
endmodule
