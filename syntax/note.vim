" Vim syntax file
" Language:		Note file
" Maintainer:		Marian Kelc
" Last Change:		

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case ignore
syntax clear
syntax match nTo nextgroup=nValue skipwhite /^To:/
syntax match nSubject nextgroup=nValue skipwhite /^Subject:/
syntax match nCC nextgroup=nValue skipwhite /^CC:/

syntax match nValue contained contains=@NoSpell ".*$"

hi link nTo Type
hi link nSubject Type
hi link nCC Type

let b:current_syntax = "note"
