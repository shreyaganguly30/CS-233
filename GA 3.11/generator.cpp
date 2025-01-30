  
// a code generator for the ALU chain in the 32-bit ALU
// look at example_generator.cpp for inspiration

// 1-bit ALU module definition
// module alu1(out, carryout, A, B, carryin, control);

// make generator
// ./generator

#include <cstdio>
using std::printf;

int main() {
    // print the module header
    printf("module alu1(out, carryout, A, B, carryin, control);\n");
    
    // the first inputs are A[0], B[0], control, control[0] for cin
    printf("    alu1 a0(out[0], carry[0], A[0], B[0], control[0], control);\n");

    // loop thru and print the rest of the module calls
    // the carryin will be the old carry out
    for (int i = 1 ; i < 32 ; i++) {
        printf("    alu1 a%d(out[%d], carryout[%d], A[%d], B[%d], carryout[%d], control);\n", i, i, i, i, i, i-1);
    }

    printf("endmodule\n");
}