\*************************************************
\ TM1638 8-Digit 8-Segment Display w/ 8 Buttons and 8 LEDs
\*************************************************
-tm1638.init
marker -tm1638.init

9 constant strobe
: tm1638.setup spiclk- strobe output strobe set ;
tm1638.setup

\*************************************************
\ ASCII Grid Segment Character Definitions
\*************************************************
-tm1638.ascii
marker -tm1638.ascii
\       __1__
\     6|     |2
\      |__7__|
\     5|     |3
\      |__4__|  .8
\
\  87654321          word
  %00111111 constant ascii.0
  %00000110 constant ascii.1
  %01011011 constant ascii.2
  %01001111 constant ascii.3
  %01100110 constant ascii.4
  %01101101 constant ascii.5
  %01111101 constant ascii.6
  %00000111 constant ascii.7
  %01111111 constant ascii.8
  %01100111 constant ascii.9
  %01110111 constant ascii.a
  %01111100 constant ascii.b
  %01011000 constant ascii.c
  %01011110 constant ascii.d
  %01111001 constant ascii.e
  %01110001 constant ascii.f
  %00111110 constant ascii.u

\*************************************************
\ TM1638 Dictionary of `words`
\*************************************************
-tm1638.dict
marker -tm1638.dict

: disp.addr.grid ( 1..8 -- addr ) 1 - 2 * ;
: disp.addr.led ( 1..8 -- addr ) 2 * 1 - ;
: home ( -- addr ) 1 disp.addr.grid ;
: uart.do ( -- ) strobe clear 1 leds ;
: uart.end ( -- ) 0 leds strobe set ;
: uart.init ( -- ) uart.end ;
: shift_out ( char -- ) spix drop blink ;
: shift_out.cmd ( cmd -- ) uart.init uart.do shift_out uart.end ; \ Send a single byte command
: data.mode.fixed ( -- ) $44 shift_out.cmd ;
: data.mode.auto ( -- ) $40 shift_out.cmd ;
: disp.on ( -- ) $8f shift_out.cmd ;
: disp.off ( -- ) $80 shift_out.cmd ;
: disp.addr ( disp.addr.grid/led -- addr) $0c + ;
: init.fixed ( -- ) disp.off data.mode.fixed ;
: disp.fixed_write ( addr char -- ) init.fixed disp.addr.set disp.on ;
: init.auto ( -- ) disp.off data.mode.auto ; \ Command 1
: disp.fill ( char -- ) 16 for dup shift_out next ;
: disp.zero_out ( -- ) write.auto ascii.0 disp.fill ;
: write.grid.auto ( -- ) write.auto disp.zero_out ;
