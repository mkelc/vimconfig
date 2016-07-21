" creates the directory of the current file
command CreateDir :call mkdir(expand("%:p:h"),"p")
" insert the current date and time
command InsertDate :exec "normal i" . strftime("%Y-%m-%d") . "\<ESC>"
" surrounds a visual mode selection with a string
function! Surround(s1, s2) range
    exe "normal vgvmboma\<ESC>"
    normal `a
    let lineA = line(".")
    let columnA = col(".")

    normal `b
    let lineB = line(".")
    let columnB = col(".")

    " exchange marks
    if lineA > lineB || lineA <= lineB && columnA > columnB
        " save b in c
        normal mc
        " store a in b
        normal `amb
        " set a to old b
        normal `cma
    endif

    exe "normal `ba" . a:s2 . "\<ESC>`ai" . a:s1 . "\<ESC>"
endfun
"create some handy mappings 
vnoremap _" :call Surround('"', '"')<CR>
vnoremap _( :call Surround('(', ')')<CR>
vnoremap _[ :call Surround('[', ']')<CR>
vnoremap _{ :call Surround('{', '}')<CR>

function! Braces()
   inoremap {<CR> {<CR>}<Esc>O
   inoremap {<Space> {}<Left>
   inoremap ( ()<LEFT>
   inoremap [ []<LEFT>
   inoremap " ""<LEFT>
   inoremap ' ''<LEFT>
   imap <C-f> <Esc>k$JJi<BS>
endfunction

function! NoBraces()
   iunmap {
   iunmap (
   iunmap [
   iunmap "
   iunmap '
   iunmap <C-f>
endfunction
