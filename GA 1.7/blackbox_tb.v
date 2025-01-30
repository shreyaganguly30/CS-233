module blackbox_test;
    reg a,b,c;
    wire z;
    blackbox ex1(z, a, b, c);
    initial begin               // initial = run at beginning of simulation
                // begin/end = associate block with initial

        $dumpfile("ex.vcd");    // name of dump file to create (used for waveform viewer)
        $dumpvars(0,blackbox_test);   // record all signals of module "ex_test" and sub-modules
        a = 0; b = 0; c = 0; # 10;     // set initial values and wait 10 time units
        a = 1; b = 0; c = 0; # 10; 
        a = 1; b = 1; c = 0; # 10;
        a = 0; b = 1; c = 0; # 10; 
        a = 0; b = 1; c = 1; # 10;
        a = 1; b = 0; c = 1; # 10;
        a = 0; b = 0; c = 1; # 10; 
        a = 1; b = 1; c = 1; # 10; 

        $finish;                // end the simulation
    end                 

    initial
        $monitor("At time %2t, a = %d b = %d c = %d z = %d",
                 $time, a,b,c,z);

endmodule // blackbox_test
