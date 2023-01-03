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

