" Vim filetype plugin file
" Language: doc (asciidoc and textfiles)
" Maintainer:	Marian Kelc
" Last Change:	

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl modeline< tw< fo<"

setlocal tw=90
setlocal fo+=taqwn
setlocal fo-=c
setlocal formatlistpat=^\s*\d\+[\]:.)}]\s* 
setlocal fileencoding=utf-8
setlocal syntax=asciidoc
setlocal spell
setlocal spelllang=de
map <buffer> <F2> gqap

