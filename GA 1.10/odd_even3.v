module odd_even2(out, A, B);
  output  out;
  input   A, B;
  // out = 1 when an odd number of input bits is 1
  // out = 0 when an even number of input bits is 1 (zero is even)
  // add your code below here
  wire w1, w2, w3, w4;

  xor x0(out, A, B);

  // or e(out, w3, w4);
  // and d(w4, w2, A);
  // and c(w3, w1, B);
  // not a(w1, A);
  // not b(w2, B);

endmodule // odd_even2

module odd_even3(out, A, B, C);
  // out = 1 when an odd number of input bits is 1
  // out = 0 when an even number of input bits is 1 (zero is even)
  // add your code below here
  output out;
  input A, B, C;
  wire w7;
  odd_even2 e2(out, w7, C);
  odd_even2 e1(w7, A, B);


  // DO NOT USE ANY GATES!!! FOLLOW THE SCHEMATIC SHOWN IN THE INSTRUCTIONS EXACTLY
  // USE MULTIPLE INSTANCES OF odd_even2, SEE INSTRUCTIONS FOR HOW TO DO THAT.
  
   
endmodule // odd_even3