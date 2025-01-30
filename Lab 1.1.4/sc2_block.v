module sc_block(s, c, a, b);
  output  s, c;
  input   a, b;
  wire    w1, w2, not_a, not_b;
  // the "c" output is just the AND of the two inputs
  and a1(c, a, b);
  // the "s" output is 1 only when exactly one of the inputs is 1
  not n1(not_a, a);
  not n2(not_b, b);
  and a2(w1, a, not_b);
  and a3(w2, b, not_a);
  or  o1(s, w1, w2);
endmodule // sc_block

// Implement sc2_block in Verilog as shown in the specification
// Use multiple instances of sc_block in sc_block2
module sc2_block(S, Cout, A, B, Cin);
  output  S, Cout;
  input   A, B, Cin;
  wire sum, carry, s1, c1;

  // Call function sc_block to get the first S and C
  sc_block scb1(s1, c1, A, B);

  // Call function sc_block using the S output from the previous and Cin
  // output to S and store the carry
  sc_block scb2(S, carry, s1, Cin);

  // perform or with both carry variables
  or o1(Cout, carry, c1);

endmodule // sc2_block
