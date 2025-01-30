// Shreya's Code
module keypad(valid, number, a, b, c, d, e, f, g);
   // output boolean that determines whether the input was valid
   output valid;
   // output number that's 4 binary digits
   output [3:0] number;
   // the user inputs a pair of letters
   input a, b, c, d, e, f, g;

   // create wires for the inverse of each letter input
   wire not_a, not_b, not_c, not_d, not_e, not_f, not_g;
   not n1(not_a, a);
   not n2(not_b, b);
   not n3(not_c, c);
   not n4(not_d, d);
   not n5(not_e, e);
   not n6(not_f, f);
   not n7(not_g, g);

   // valid inputs include: ad, ae, af, bd, be, bf, bg, cd, ce, cf
   // check the user inputs to see which pair is clicked
   wire ad, ae, af, bd, be, bf, bg, cd, ce, cf;
   // each statement is "and-ing" yes/no for each input char
   and v1(ad, a, not_b, not_c, d, not_e, not_f, not_g);
   and v2(ae, a, not_b, not_c, not_d, e, not_f, not_g);
   and v3(af, a, not_b, not_c, not_d, not_e, f, not_g);
   and v4(bd, not_a, b, not_c, d, not_e, not_f, not_g);
   and v5(be, not_a, b, not_c, not_d, e, not_f, not_g);
   and v6(bf, not_a, b, not_c, not_d, not_e, f, not_g);
   and v7(bg, not_a, b, not_c, not_d, not_e, not_f, g);
   and v8(cd, not_a, not_b, c, d, not_e, not_f, not_g);
   and v9(ce, not_a, not_b, c, not_d, e, not_f, not_g);
   and v10(cf, not_a, not_b, c, not_d, not_e, f, not_g);
   // the input is valid for any of the above statements
   or valid_inputs(valid, ad, ae, af, bd, be, bf, bg, cd, ce, cf);

   // each pair of inputs corresponds with a number
   // each number is translated to binary
   // number[3] = leftmost (MSB), number[0] = rightmost (LSB)

   // number[3] is 1 for 8 (bf) or 9 (cf)
   or o1(number[3], bf, cf);

   // number[2] is 1 for 4 (ae), 5 (be), 6 (ce), 7 (af)
   or o2(number[2], ae, be, ce, af);

   // number[1] is 1 for 2 (bd), 3 (cd), 6 (ce), 7 (af)
   or o3(number[1], bd, cd, ce, af);

   // number[0] is 1 for 1 (ad), 3 (cd), 5 (be), 7 (af), 9 (cf)
   or o4(number[0], ad, cd, be, af, cf);
endmodule