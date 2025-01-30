// Circuit implements the Boolean expression
// f(a,b,c,d) = a'b'c'd' + a'bc'd' + a'bcd' + ab'c'd

module sop_circuit(out, a, b, c, d);

  // Port and wire declarations
  output  out;                               // output port
  input   a, b, c, d;                        // input ports
  wire    not_a, not_b, not_c, not_d, out_a1, out_a2, out_a3, out_a4;        // not gate outputs

  // NOT gates to create complements for product terms
  not     na(not_a, a);
  not     nb(not_b, b);
  not     nc(not_c, c);
  not     nd(not_d, d);

  // AND gates to create product terms
  and     a1(out_a1, not_a, not_b, not_c, not_d);
  and     a2(out_a2, not_a, b, not_c, not_d);
  and     a3(out_a3, not_a, b, c, not_d);
  and     a4(out_a4, a, not_b, not_c, d);

  // OR gate to combine outputs of AND gates
  or      o1(out, out_a1, out_a2, out_a3, out_a4);
endmodule