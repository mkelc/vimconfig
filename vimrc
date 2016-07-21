" global, platform independent vimrc
" Marian Kelc, 2006-11-08
" $Revision$
" $URL$
" vim:fenc=utf-8

"let myrtp= "D:/home/vim," . &runtimepath
"exec "set runtimepath=" . myrtp
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')

if has("unix") && system("uname") !~ "SunOS"
   " language en_US.UTF-8
   language C
endif

let g:userdir= expand("<sfile>:p:h")
execute "set spellfile=" . g:userdir . "/spell/" . "private.de.utf8.add"

set nocompatible
set nowrap
set laststatus=2
set autoindent
set tabstop=3
set shiftwidth=3
set expandtab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1
set virtualedit=block
set listchars=eol:$,tab:>-,trail:.
set backupdir=$HOME/.bak
set backup
set sessionoptions+=options,localoptions,globals

" recently used files
"if has("win32")
"   let MRU_File=$VIM . "/files.mru"
"else
   let MRU_File=$HOME . "/.files.mru"
"endif

let MRU_Max_Entries = 30

let g:xml_syntax_folding=1

if !isdirectory($HOME . "/.bak")
   call mkdir($HOME . "/.bak")
endif

" map the unused umlaut keys on the german keyboard
" go (:) to mark ('o'): ö
nmap ö `
" go (:) to 'a' target
nmap ä <C-]>
" select (U) a register '"'
nmap ü "
" search for Unicode 0xfffd: unprintable character
nmap  /\%ufffd<CR>
"let mapleader="x"

" map Alt-Left and Alt-Right to switch tab to left / right
" same behavior as in IntelliJIdea
map <M-Left> gT
map <M-Right> gt
map <M-Right> gt

"Let NERD Commenter be quiet
let g:NERDShutUp=1

 " options only applicable to unix/linux
if has("unix")
   runtime! ftplugin/man.vim
endif

" some gui/nongui specific settings
if has("gui") && has("gui_running")
   set guioptions-=t
   colorscheme desert
else
   colorscheme satori
endif

" Calendar Plugin: show week numbers
let g:calendar_weeknm = 4 " KW 1

" options only applicable to win32
if has("win32") && has("gui_running")
   let &guioptions = substitute(&guioptions, "t", "", "g")
   " svn syntax highlighting
   augroup svncommit
      au!
      au BufNewFile,BufRead  svn-commit.* setf svn
   augroup end
   " start gui in full screen
   augroup winenter   
      au!
      au GUIENter * simalt ~x
   augroup end
endif

" font settings
if has("gui") && has("unix")
   set guifont=DejaVu\ Sans\ Mono\ 14
endif

if has("gui") && has("win32")
   set guifont=DejaVu_Sans_Mono:h11:cANSI
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
     au!
     autocmd FileType text setlocal textwidth=72
     " When editing a file, always jump to the last known cursor position.
     " Don't do it when the position is invalid or when inside an event handler
     " (happens when dropping a file on gvim).
     autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal g`\"" |
       \ endif
  augroup end

  " svn syntax highlighting
  augroup svn
     au!
     au BufNewFile,BufRead  svn-commit.* setf svn
  augroup end
  augroup note
     au!
     au BufNewFile,BufRead *.note setf note
  augroup end
endif " has("autocmd")
