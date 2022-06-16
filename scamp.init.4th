\*************************************************
\ A personal inititialzation script for the Scamp3 FORTH environment
\ Requires: prompt.pretty, colors
\*************************************************
-scamp.init
marker -scamp.init

: starline  ( n -- ) for 43 emit next ; \ 50 '*' line break
: scamp.motd ( -- ) about starline ;
: scamp.pp ( -- ) ' prompt.pretty is prompt ;
: scamp.init ( -- ) cls scamp.motd scamp.pp ;
