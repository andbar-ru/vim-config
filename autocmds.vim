autocmd VimLeavePre * silent mksession! ~/.vim/sessions/lastSession.vim
if exists('g:highlightTrailingSpace')
    autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
endif

augroup filetypes
    autocmd!
    autocmd FileType python setlocal ts=4 sw=4 nowrap
    autocmd FileType html setlocal ts=2 sw=2 ft=htmldjango indentexpr=
    autocmd FileType php setlocal ts=2 sw=2
augroup END

