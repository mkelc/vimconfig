" Vim filetype plugin file
" Language: note
" Maintainer:	Marian Kelc
" Last Change:	

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal nomodeline
setlocal tw=72
setlocal fo+=tcql


let b:undo_ftplugin = "setl modeline< tw< fo<"

setlocal nomodeline
setlocal tw=72
setlocal fo+=tcql
setlocal spell
setlocal spelllang=en,de
setlocal fileencoding=latin1

