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
  autocmd BufRead rules setlocal noexpandtab  " debian/rules
  autocmd FileType python setlocal ts=4 sw=4 cc=100,120 completeopt-=preview
  autocmd FileType go setlocal ts=4 sw=4 noet
  autocmd FileType java setlocal ts=4 sw=4 et
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
  autocmd VimResized * if &diff | wincmd = | endif
augroup end

if isdirectory($PLUGDIR . '/coc.nvim')
  augroup coc
    autocmd!
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Setup formatter
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
endif
