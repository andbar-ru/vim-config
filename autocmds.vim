" Here are only general autocommands. Plugin-specific autocommands elsewhere.
augroup general
  autocmd!
  " Customized autocmd from defaults.vim
  autocmd BufReadPost *
    \ if !&diff && &ft !~# 'commit' && line("'\"") >= 1 && line("'\"") <= line("$")
    \ |   exe "normal! g`\""
    \ | endif
  autocmd VimLeavePre * silent mksession! $VIMRCDIR/sessions/lastSession.vim
  autocmd BufRead * if getfsize(expand('%')) > 1048576 | setlocal syntax=OFF | endif
  if exists('g:highlightTrailingSpace')
    autocmd BufNew,BufRead * call HiTrail(g:highlightTrailingSpace)
  endif
  autocmd BufRead * if !&diff | exec 'normal zv' | endif
  autocmd BufRead * :syntax sync fromstart
  autocmd BufRead log.txt setlocal autoread filetype=logtxt
  autocmd BufRead *.log.txt setlocal autoread filetype=logtxt
  autocmd BufRead rules setlocal noexpandtab  " debian/rules
  autocmd BufRead .xbindkeysrc setlocal ft=conf
  autocmd FileType python setlocal ts=4 sw=4 cc=100,120 completeopt-=preview
  autocmd FileType go setlocal ts=4 sw=4 noet
  autocmd FileType java setlocal ts=4 sw=4 et
  autocmd FileType vue setlocal iskeyword+=45
  autocmd FileType json setlocal foldminlines=0 foldnestmax=99
  autocmd FileType neosnippet setlocal noexpandtab
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
  autocmd VimResized * if &diff | wincmd = | endif
  autocmd FocusGained * :checktime
augroup end
