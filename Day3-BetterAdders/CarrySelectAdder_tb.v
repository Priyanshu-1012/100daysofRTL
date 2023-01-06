module tb_csa;
	// 1. Declare testbench variables
  reg [7:0] a;
  reg [7:0] b;
   reg cin;
   reg cout;
  wire [7:0] sum;
   integer i;

	// 2. Instantiate the design and connect to testbench variables
   csa  inst1 ( .a (a),
                  .b (b),
                  .cin (cin),
                  .cout (cout),
                  .sum (sum));

	// 3. Provide stimulus to test the design
   initial begin
      a <= 0;
      b <= 0;
      cin <= 0;
      
      $monitor ("a=0x%0h b=0x%0h c_in=0x%0h c_out=0x%0h sum=0x%0h", a, b, cin, cout, sum);

		// Use a for loop to apply random values to the input
     for (i = 0; i < 10; i = i+1) begin
         #10 a <= $random;
             b <= $random;
           cin <= $random;
      end
   end
  
   initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
     
   end
endmodule
