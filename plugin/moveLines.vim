" MoveLines moves selected lines or current line toward `direction` v:count times.
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
function! s:MoveLines(direction, mode) range
  let l:count = v:count1
  let l:prev_fdm = &fdm
  set fdm=manual

  if a:direction == "up"
    " top bound
    if l:count >= a:firstline
      let l:count = a:firstline - 1
    endif
    let l:count += 1
    if a:mode == "v"
      execute "'<,'>move-" . l:count
    else
      execute "move-" . l:count
    endif
  elseif a:direction == "down"
    " bottom bound
    if a:lastline + l:count > line("$")
      let l:count = line("$") - a:lastline
    endif
    if a:mode == "v"
      let l:count += (a:lastline - a:firstline)
      execute "'<,'>move+" . l:count
    else
      execute "move+" . l:count
    endif
  endif

  if a:mode == "v"
    execute "normal gv"
  endif
  let &fdm = l:prev_fdm
endfunction

" Maps in different modes
nnoremap <silent> <Plug>MoveLinesDown :<c-u>call <SID>MoveLines("down", "n")<CR>
nnoremap <silent> <Plug>MoveLinesUp :<c-u>call <SID>MoveLines("up", "n")<CR>
inoremap <silent> <Plug>MoveLinesDown <c-o>:call <SID>MoveLines("down", "i")<CR>
inoremap <silent> <Plug>MoveLinesUp <c-o>:call <SID>MoveLines("up", "i")<CR>
vnoremap <silent> <Plug>MoveLinesDown :call <SID>MoveLines("down", "v")<CR>
vnoremap <silent> <Plug>MoveLinesUp :call <SID>MoveLines("up", "v")<CR>

