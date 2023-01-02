module full_add(sum,cout,a,b,cin);
  input a,b,cin;
  output sum,cout;
  
  assign sum=a^ b ^ cin;

  assign cout= (a&b)|(b&cin)|(cin&a);

endmodule