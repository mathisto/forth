: prompt.pretty ( -- ) \ 1 2 3 4 5 <-tos-
  green fg .st
  magenta fg ." <-"
  red fg ." tos"
  magenta fg ." -"
  plain cr is prompt
;
