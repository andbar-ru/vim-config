autocmd VimLeavePre * silent mksession! $VIMRCDIR/sessions/lastSession.vim
if exists('g:highlightTrailingSpace')
    autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
endif

autocmd BufRead * if line('$') < 100 | exec "normal zR" | endif
autocmd BufRead log.txt setlocal autoread

augroup filetypes
    autocmd!
    autocmd FileType python setlocal ts=4 sw=4 cc=100,120
augroup END
