module test;

    // cycle through all combinations of A, B, C, D every 16 time units
    reg A = 0;
    reg B = 0;
    reg C = 0;
    reg D = 0;
     
    reg [1:0] control = 0;
     
    wire out;
    mux4 m4(out, A, B, C, D, control);

    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0, test);

        //This is a non-exhaustive test suite, you should build a better one to test your lab
        A = 0; B = 1; C = 1; D = 1; control = 0; #10
        A = 1; B = 0; C = 0; D = 0; control = 0; #10
        A = 1; B = 0; C = 1; D = 1; control = 1; #10
        A = 0; B = 1; C = 0; D = 0; control = 1; #10
        A = 1; B = 1; C = 0; D = 1; control = 2; #10
        A = 0; B = 0; C = 1; D = 0; control = 2; #10
        A = 1; B = 1; C = 1; D = 0; control = 3; #10
        A = 0; B = 0; C = 0; D = 1; control = 3; #10
          
        $finish;        // end the simulation
    end

    initial begin
        $display("A B C D s o");
        $monitor("inputs = %b %b %b %b %d  outputs = %b", A, B, C, D, control, out);
    end

endmodule // mux4_test