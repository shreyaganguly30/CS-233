module comparator1_test;

   reg pin = 0;
   reg qin = 0;
   reg a = 0;
   reg b = 0;
   
   initial begin
     $dumpfile("commparator1_test.vcd");
     $dumpvars(0, comparator1_test);
    
     #1 pin = 0; qin = 0; a = 0; b = 0;
     #1 pin = 0; qin = 0; a = 0; b = 1;
     #1 pin = 0; qin = 0; a = 1; b = 0;
     #1 pin = 0; qin = 0; a = 1; b = 1;

     #1 pin = 0; qin = 1; a = 0; b = 0;
     #1 pin = 0; qin = 1; a = 0; b = 1;
     #1 pin = 0; qin = 1; a = 1; b = 0;
     #1 pin = 0; qin = 1; a = 1; b = 1;

     #1 pin = 1; qin = 0; a = 0; b = 0;
     #1 pin = 1; qin = 0; a = 0; b = 1;
     #1 pin = 1; qin = 0; a = 1; b = 0;
     #1 pin = 1; qin = 0; a = 1; b = 1;

     #1 pin = 1; qin = 1; a = 0; b = 0;
     #1 pin = 1; qin = 1; a = 0; b = 1;
     #1 pin = 1; qin = 1; a = 1; b = 0;
     #1 pin = 1; qin = 1; a = 1; b = 1;

     $finish;
   end

   wire pout, qout;
   comparator1 c1(pout, qout, a, b, pin, qin);    

   initial
       $monitor("pin,qin = %b%b ab = %b%b pout,qout = %b%b", pin, qin, a, b, pout, qout);
 
   
endmodule // alu1_test
