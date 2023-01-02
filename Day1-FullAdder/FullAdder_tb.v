module tb();
  reg a,b,cin;
  wire sum,cout;
  full_add inst1 (sum,cout,a,b,cin);
  
  initial begin 
    a=0;b=0;cin=0;
  end
  
  initial begin
    #5 a=1;b=0;cin=0;
    #5 a=1;b=1;cin=0;
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=1;b=1;cin=1;
   
  end
    
 //Dump waves (only required here)
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end  
  
 initial begin
   $monitor($time,"a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
 #30 $finish;
   
 end
endmodule

 
