


function! HexToDec(hex)
   let n=str2nr("0x" . a:hex, 16)
   return n
endfunction

function! InsertHexToDec() 
   let n= HexToDec(expand("<cword>"))
   exec "normal T\<Space>ct\<Space>" . n . "\<ESC>"
endfunction

command! HexToDec :call InsertHexToDec()

