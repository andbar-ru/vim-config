augroup vimrc
  autocmd!
  autocmd VimLeavePre * silent mksession! $VIMRCDIR/sessions/lastSession.vim
  if exists('g:highlightTrailingSpace')
      autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
  autocmd BufRead * if line('$') < 100 | exec "normal zR" | endif
  autocmd BufRead log.txt setlocal autoread filetype=logtxt
  autocmd BufRead rules setlocal noexpandtab  " debian/rules
  autocmd FileType python setlocal ts=4 sw=4 cc=100,120 completeopt-=preview
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
endif
