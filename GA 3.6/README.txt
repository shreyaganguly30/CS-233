INSTRUCTIONS FOR TESTING YOUR CIRCUIT

We provide a test bench that exhaustively tests your code.  
You can compile your code with the provided test bench with 
the following command:

    iverilog -Wall -o lu lu.v lu_tb.v

which will generate an executable called 'lu' which can then 
be executed by the following command:

    ./lu

Running the executable will create a printout to the terminal 
that essentially draws a truth table of what your circuit 
actually implemented