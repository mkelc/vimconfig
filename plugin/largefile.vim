if !exists("loaded_largefile")
        let loaded_largefile = 1
        " Large files are > 10M
        " Set options:
        "     eventignore+=FileType (no syntax highlighting etc
        "            assumes FileType always on)
        "       noswapfile (save copy of file)
        "       bufhidden=unload (save memory when other file is viewed)
        "       buftype=nowritefile (is read-only)
        "       undolevels=-1 (no undo possible)
        let g:LargeFile = 1024 * 1024 * 10
        augroup LargeFile
                au!
                autocmd! BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
        augroup END
endif 
