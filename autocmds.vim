augroup vimrc
  autocmd!
  " debian system vimrc
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd VimLeavePre * silent mksession! $VIMRCDIR/sessions/lastSession.vim
  autocmd BufRead * if getfsize(expand('%')) > 1048576 | setlocal syntax=OFF | endif
  if exists('g:highlightTrailingSpace')
    autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
  endif
  autocmd BufRead * if !&diff | exec 'normal zv' | endif
  autocmd BufRead * if line('$') < 100 | exec "normal zR" | endif
  autocmd BufRead * :syntax sync fromstart
  autocmd BufRead log.txt setlocal autoread filetype=logtxt
  autocmd BufRead *.log.txt setlocal autoread filetype=logtxt
  autocmd BufRead rules setlocal noexpandtab  " debian/rules
  autocmd FileType python setlocal ts=4 sw=4 cc=100,120 completeopt-=preview
  autocmd FileType go setlocal ts=4 sw=4 noet
  autocmd FileType java setlocal ts=4 sw=4 et
  autocmd FileType javascript,vue,json setlocal ts=2 sw=2
  autocmd FileType json setlocal foldminlines=0 foldnestmax=99
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
  autocmd VimResized * if &diff | wincmd = | endif
  autocmd FocusGained * :checktime
augroup end
