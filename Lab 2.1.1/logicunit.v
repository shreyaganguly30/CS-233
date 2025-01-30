module mux4v(out, A, B, C, D, control);
    output      out;
    input       A, B, C, D;
    input [1:0] control;

    wire  wA, wB, wC, wD;

    assign wA = A & (control == 2'b00);
    assign wB = B & (control == 2'b01);
    assign wC = C & (control == 2'b10);
    assign wD = D & (control == 2'b11);

    or  o1(out, wA, wB, wC, wD);

endmodule // mux4v

// Design a logicunit that implements the specified truth table

// Truth Table:
// control = 00: A and B
// control = 01: A or B
// control = 10: A nor B
// control = 11: A xor B

module logicunit(out, A, B, control);
    output      out;
    input       A, B;
    input [1:0] control;
    wire A_and_B, A_or_B, A_nor_B, A_xor_B;

    // Similar to GA 3.6
    and   a1(A_and_B, A, B); // 00
    or    o1(A_or_B, A, B);  // 01
    nor   n1(A_nor_B, A, B); // 10
    xor   x1(A_xor_B, A, B); // 11

    // mux4v info: A corresponds with 00, B with 01, C with 10, D with 11
    mux4v f1(out, A_and_B, A_or_B, A_nor_B, A_xor_B, control);
   
endmodule // Logic Unit to Verilog