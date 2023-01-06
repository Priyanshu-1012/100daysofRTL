module clad (input [7:0] a, input [7:0] b, input cin,
             output [7:0] sum, output cout);
  
  reg [7:0]cinext;
  
   generate 
        genvar i;
     for (i=0; i<8; i=i+1) begin: cladd
        if(i==0) begin
          fa inst(a[i], b[i], cin, cinext[i],sum[i]);
	    end
        else begin
          fa insta(a[i], b[i], cinext[i-1],cinext[i],sum[i]); 
	    end
        end
     assign cout=cinext[7];
    endgenerate
endmodule


module fa(input a, input b, input cin,
          output cinext, output sum);
  
  reg p,g;
  
  assign p = a ^ b;
  assign g = a & b;
  
  assign sum = a ^ b ^ cin;
  assign cinext = (p&cin)|g;
  
endmodule