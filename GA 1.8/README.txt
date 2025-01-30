INSTRUCTIONS FOR TESTING YOUR CIRCUIT

You can compile your code with the provided black box file with the following 
command:

iverilog -Wall -o blackbox blackbox.v blackbox_tb.v

which will generate an executable called blackbox which can then be executed by 
the following command:

./blackbox

Running the executable will create a printout to the terminal that essentially
draws a truth table of what your blackbox circuit actually does.