autocmd VimLeavePre * silent mksession! ~/.vim/sessions/lastSession.vim
if exists('g:highlightTrailingSpace')
    autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
endif

augroup filetypes
    autocmd!
    autocmd FileType python set ts=4 sw=4 nowrap
    autocmd FileType html set ts=2 sw=2
    autocmd FileType php set ts=2 sw=2
augroup END

