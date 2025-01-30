module blackbox(z, x, b, d);
    output z;
    input  x, b, d;
    wire   w02, w13, w16, w18, w31, w33, w34, w37, w39, w49, w55, w62, w69, w82, w84, w91, w95, w97, w99;
    and a59(z, w34, w39);
    or  o25(w34, w49, w18);
    not n57(w18, w49);
    or  o98(w39, w69, w99);
    and a6(w99, w55, w91);
    not n28(w55, w91);
    or  o66(w49, w16, w62);
    and a11(w16, w02, w84);
    not n5(w02, b);
    not n48(w84, d);
    and a14(w62, b, w37, d);
    not n42(w37, x);
    and a78(w91, b, w13);
    or  o21(w13, x, w33);
    and a46(w33, d, w82);
    not n12(w82, x);
    and a87(w69, w97, w95);
    not n96(w97, b);
    or  o15(w95, x, w31);
    not n1(w31, d);
endmodule // blackbox