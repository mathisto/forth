\*************************************************
\ A "pretty" prompt for Scamp3's FlashForth
\ Requires: colors.4th
\*************************************************
-prompt
marker -prompt

: prompt.sp ( -- ) \ stack pointer
  blue fg ." <-"
  magenta fg ." tos" \ top of stack
  blue fg ." -"
;
: prompt.base ( -- )
  blue fg ." .:|base" space
  yellow fg base @ . \ current numerical base representation
  blue fg ." :" space
;
: prompt.stack ( -- )
  blue fg ." stack" space
  yellow fg .s \ stack
  prompt.sp \ stack pointer arrow
  blue fg ." |:."
;
: prompt.pretty ( -- )
  hide green fg cr \ hopefully after 'ok'
  prompt.base prompt.stack cr \ .:|base 10|:..:|stack 1 2 3 4 5 <-tos-|:.
  plain show
;
