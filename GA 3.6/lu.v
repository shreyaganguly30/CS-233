// Logic Unit Specification 
// control = 00: NOT A
// control = 01: A NAND B
// control = 10: A OR B
// control = 11: A AND B
// Debug this module
module logicunit(out, A, B, control);
    input [1:0] control;
    input A, B;
    output out;
    wire not_A, A_and_B, A_nand_B, A_or_B, out_1, out_2;

    not    not1(not_A, A);
    nand   nand1(A_nand_B, A, B);
    or     or1(A_or_B, A, B);
    and    and1(A_and_B, A, B);

    mux2v m1(out_1, not_A, A_nand_B, control[0]);
    mux2v m2(out_2, A_or_B, A_and_B, control[0]);

    mux2v m3(out, out_1, out_2, control[1]);

endmodule // logicunit



// Correct implementation of mux2v, do not edit
module mux2v(out, A, B, control);   // a 2-input multiplexer
   output      out;
   input       A, B;
   input       control;
   wire        wA, wB, not_control;
        
   not   n1(not_control, control);
   and   a1(wA, A, not_control);
   and   a2(wB, B, control);
   or    o1(out, wA, wB);

endmodule // mux2

