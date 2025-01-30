/**
* @file
* Contains an implementation of the extractMessage function.
*/
#include <iostream> // might be useful for debugging
#include <assert.h>
#include "extractMessage.h"


using namespace std;


#include <iostream> // might be useful for debugging
#include <assert.h>
#include "extractMessage.h"


using namespace std;


unsigned char *extractMessage(const unsigned char *message_in, int length) {
   // length must be a multiple of 8
   assert((length % 8) == 0);


   // allocate an array for the output
   unsigned char *message_out = new unsigned char[length];


   // initalize all the bytes to be 0 for the correct array
   for (int i = 0; i < length; i++) {
       message_out[i] = 0;
   }

   for(int group = 0; group < length; group += 8) {
       // for each group of 8 letters, go thru each letter
       for(int letter = 0; letter < 8; letter++) {
           // for each of byte, go thuu each of the 8 bits
           for(int bit = 0; bit < 8; bit++) {
               // shift the char as right as you can (do 7-bit so you dont go out of the bounds bc 8 is max)
               // when you do &1, you extract the LSB (rightmost)
               unsigned char leastSignificantBit = (message_in[group + letter] >> bit) & 1;

               // add the current bit to that position (you add by doing 'or')
               message_out[group + bit] |= (leastSignificantBit << letter);
           }
       }
   }

   return message_out;
}


/*  Diagram Explanation:
   - the original letters go from left to right
   - the new letters make the original right the top and the original left the bottom

   ~ top right goes bottom right
*/


/*  Problem Description:
   - a message is encoded and is split up into groups of 8 letters
   - each letter has 1 byte (total of 8 bytes per group)
   - each byte has 8 bits
*/


// 1 char = 1 byte = 8 bits