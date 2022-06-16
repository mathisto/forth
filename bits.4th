\ Source code for bits.htm
\ Bit-array is a defining word that will create a bit array.
\ l is the number of bytes
create masks 128 c, 64 c, 32 c, 16 c, 8 c, 4 c, 2 c, 1 c,
: bit-array ( l -- ) ( i -- m a) create allot
  does> swap 8 /mod masks + c@ -rot + ;

\ We also need words to store and fetch bits. The words .@ and .!
\ Will fetch and store, respectively, a Boolean flag on the stack to
\ a bit array. (Do not confuse .! with cset or .@ with creset.)

: .! ( f m a -- ) rot if cset else creset then ;
: .@ ( m a -- f ) c@ and 0<> ;

\ Example
 3 bit-array thflag  \ Create a bit array for 24 bit-flags
11 thflag ctoggle    \ Toggle the 11th bit
10 thFLAG .@ ( -- f) \ Extract the 10th bit and leave as well-formed Boolean flag

The following words are made available for convenience:

: bit ( w n -- f ) 1 swap lshift and ;

: set ( w n -- w ) 1 swap lshift or ;

: clear ( w n -- w ) 1 swap lshift invert and ;

: toggle ( w n -- w ) 1 swap lshift xor ;

: byte0 ( w -- c ) 0xff and ;

: byte1 ( w -- c ) 0xff00 and 0x8 rshift ;
Example use:

binary 10010101 dup dup decimal 2 bit . 3 bit . 4 bit . <cr> 4 0 16 ok
binary 10010101 decimal 2 set 3 set binary . <cr> 10011101  ok
binary 10010101 decimal 2 clear 3 clear binary . <cr> 10010001  ok
binary 10010101 decimal 2 toggle 3 toggle binary . <cr> 10011001  ok
binary 1001010111001011 byte0 . <cr> 11001011  ok
binary 1001010111001011 byte1 . <cr> 10010101  ok
