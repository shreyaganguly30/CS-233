INSTRUCTIONS FOR TESTING YOUR CIRCUIT

We provide a test bench (odd_even3_tb.v) that exhaustively tests 
your code, you do not need to modify it unless you want to explore. 
You will need to modify odd_even3.v. You can compile your code with 
the provided test bench with the following command:

iverilog -Wall -o odd_even3 odd_even3.v odd_even3_tb.v

which will generate an executable called odd_even3 which can then 
be executed by the following command:

./odd_even3

Running the executable will create a printout to the terminal that 
essentially draws a truth table of what your circuit actually 
implemented