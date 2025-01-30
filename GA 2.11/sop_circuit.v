// Circuit implements the Boolean expression
// f(a,b,c,d) = a'b'c'd' + a'b'cd' + abcd' + abcd

module sop_circuit(out, a, b, c, d);

  // Port and wire declarations
  output  out;                               // output port
  input   a, b, c, d;                        // input ports
  wire    not_a, not_b, not_c, not_d;        // not gate outputs

  // NOT gates to create complements for product terms
  not     na(not_b, a);
  not     nb(not_b, b);
  not     nc(not_b, c);
  not     nd(not_b, d);

  // AND gates to create product terms
  and     a1(out_a1, not_a, b, not_c, not_d)
  and     a2(out_a2, not_a, not_b, not_c, not_d)
  and     a3(out_a3, a, b, c, d);
  and     a4(out_a4, a, b, c, d)

  // OR gate to combine outputs of AND gates
  or      o1(out, out_a1, out_a2, out_a3, out_a4;
endmodule