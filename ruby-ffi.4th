\*************************************************
\ Create words that will allow a transmission `tx` and reception `rx`.
\ Ruby will send forth commands via `rubyserial` to a custom
\ Forth word `ruby.rx` which will run the command specified by Ruby.
\ In return, it will and recieve back any additions to the stack.
\ Forth will be able to invoke any Ruby code within a persistent pry session
\ with a custom word `ruby.tx`
\*************************************************

: ruby.tx ( string -- return#to_s ) usb.tx ;
: ruby.rx ( -- ) usb.rx ;
