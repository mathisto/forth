: prompt.sp ( -- ) \ stack pointer
  magenta fg ." <-"
  red fg ." tos"
  magenta fg ." -"
;
: prompt.char ( -- ) bold green fg ." > " plain ;
: prompt.base ( -- )
  blue fg ." .:|base"
  bl emit \ A space char
  yellow fg base @ . \ Current numerical base representation
  blue fg ." |:."
;
: prompt.stack ( -- )
  blue fg ." .:|stack"
  bl emit \ A space char
  yellow fg .s \ Stack
  prompt.sp \ Stack pointer arrow
  blue fg ." |:."
;
: prompt.pretty ( -- )
  green fg cr \ hopefully after 'ok'
  5 ms
  prompt.base 5 ms prompt.stack \ .:|base 10|:..:|stack 1 2 3 4 5 <-tos-|:.
  cr 5 ms prompt.char \ >
;
