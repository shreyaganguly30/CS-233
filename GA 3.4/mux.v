// output = A (when control == 00) or B (when control == 01) or
//          C (when control == 10) or D (when control == 11)
module mux4(out, A, B, C, D, control); // a 4-input multiplexer
   output      out;
   input       A, B, C, D;
   input [1:0] control;  // multiple bit signal (2-bits)
   // use control[0] and  control[1] as inputs to multiplexers
   wire multi_ab, multi_cd;

   // control[0] = 0 for A and B
   mux2 m_ab(multi_ab, A, B, control[0]);
   // control[0] = 1 for C and D
   mux2 m_cd(multi_cd, C, D, control[0]);

   // control[1] for both?
   mux2 m_all(out, multi_ab, multi_cd, control[1]);

endmodule // mux4

// Here is an implementation of a 2-to-1 multiplexer for you to use
// output = A (when control == 0) or B (when control == 1)
module mux2(out, A, B, control);   // a 2-input multiplexer
   output      out;
   input       A, B;
   input       control;
   wire        wA, wB, not_control;
        
   not   n1(not_control, control);
   and   a1(wA, A, not_control);
   and   a2(wB, B, control);
   or    o1(out, wA, wB);
endmodule // mux2