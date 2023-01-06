module csa(
  input [7:0] a,
  input [7:0] b,
  input cin,
  output cout,
  output [7:0] sum
);
  wire [3:0]s2,s3;
  wire sel,c2,c3;
    
  rca inst1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(sel));
  rca inst2(.a(a[7:4]), .b(b[7:4]), .cin(1'b0), .sum(s2), .cout(c2));
  rca inst3(.a(a[7:4]), .b(b[7:4]), .cin(1'b1), .sum(s3), .cout(c3));
    
  assign sum[7:4] = sel ? s3 : s2;
  assign cout = sel ? c3 : c2;

endmodule

module rca (  input [3:0] a,
            input [3:0] b,
                  input cin,
                  output reg cout,
            output reg [3:0] sum);
 
  reg [4:0]temp;
  
  assign temp[4:0] = a + b + cin;   
  assign sum[3:0] = temp[3:0];
  assign cout = temp[4];
 
endmodule