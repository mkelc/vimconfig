"generate a table with characters in certain encodings
function! Foo()
  let e=&enc
  execute "normal iDec | Hex | cp1252 | cp850 | latin-1\n\<ESC>" 
  for i in range(32,255)
    let c= printf("%x",i) 
    let a= "normal i" 
    let a.= printf("%3d | %2x ",i,i) 
    let a.= "     " . eval("iconv(\"\\x".  c . "\",\"cp1252\",\"" . e . "\")")
    let a.= "       " . eval("iconv(\"\\x".  c . "\",\"cp850\",\"" . e . "\")")
    let a.= "       " . eval("iconv(\"\\x".  c . "\",\"latin1\",\"" . e . "\")")
    let a.= "\n\<ESC>"
    execute a
  endfor
endfunction
