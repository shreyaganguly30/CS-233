module comparator8_test;

  reg [7:0] A = 0, B = 0; // start by comparing 0 and 0
  
  wire P, Q;
  comparator8 c8(P, Q, A, B);
  
   initial begin
    $dumpfile("commparator8_test.vcd");
    $dumpvars(0, comparator8_test);
 
      // Example test case
      # 4 A=8'h00; B = 8'h00; // compare 2 and 2
      # 4 A=8'h01; B = 8'h02; 
      # 4 A=8'h02; B = 8'h01; 
      # 4 A=8'h02; B = 8'h02; 
      # 4 A=8'h14; B = 8'h0B; 
      # 4 A=8'h0F; B = 8'h26; 
      # 4 A=8'hFF; B = 8'hFE; 

      // ADD MORE OF YOUR OWN TEST CASES TO FULLY DEBUG THE CIRCUIT
      #4;
      $finish;
   end

   initial
     $monitor("A = 0x%x B = 0x%x PQ = %b%b", A, B, P, Q);

endmodule // comparator8_test
