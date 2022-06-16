\*************************************************
\ A personal inititialzation script for the Scamp3 FORTH environment
\ Requires: prompt.pretty, colors
\*************************************************
-scamp.init
marker -scamp.init

: scamp.pp ( -- ) ' prompt.pretty is prompt ;
: starline  ( n -- ) 2 spaces for 43 emit next ;
: scamp.motd ( -- ) about 50 starline cr ; \ 50 '*' line break
: scamp.init ( -- ) plain cls scamp.motd scamp.pp ;
