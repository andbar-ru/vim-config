" SearchMode cycles between 3 search modes:
" 1 Normal - no mappings: search next ans previous work as normal (default)
" 2 Scroll hit to middle if not on same page - no scrolling occurs if the next hit is after the
" first line and before the last line of the window; otherwise, the search hit is scrolled to the
" middle.
" 3 Scroll hit to middle - the search hit is always scrolled to the middle (when posiible).
" Modes 2 and 3 have the issue: message "search hit BOTTOM, continuing at TOP" disappears
" immediately when search wraps.
function! s:SearchMode(silent)
  if !exists('s:searchmode') || s:searchmode == 0
    if !a:silent
      echo 'Search next: scroll hit to middle if not on same page'
    endif
    nnoremap <silent> n n:call <sid>MaybeMiddle()<cr>
    nnoremap <silent> N N:call <sid>MaybeMiddle()<cr>
    nnoremap <silent> * *:call <sid>MaybeMiddle()<cr>
    nnoremap <silent> # #:call <sid>MaybeMiddle()<cr>
    nnoremap <silent> g* g*:call <sid>MaybeMiddle()<cr>
    nnoremap <silent> g# g#:call <sid>MaybeMiddle()<cr>
    let s:searchmode = 1
  elseif s:searchmode == 1
    if !a:silent
      echo 'Search next: scroll hit to middle'
    endif
    nnoremap <silent> n nzz
    nnoremap <silent> N Nzz
    nnoremap <silent> * *zz
    nnoremap <silent> # #zz
    nnoremap <silent> g* g*zz
    nnoremap <silent> g# g#zz
    let s:searchmode = 2
  else
    if !a:silent
      echo 'Search next: normal'
    endif
    nunmap n
    nunmap N
    nunmap *
    nunmap #
    nunmap g*
    nunmap g#
    let s:searchmode = 0
  endif
endfunction

" If cursor is in first or lat line of window, scroll to middle line.
function! s:MaybeMiddle()
  if winline() == 1 || winline() == winheight(0)
    normal! zz
  endif
endfunction

nnoremap <silent> <plug>ToggleSearchMode :<c-u>call <sid>SearchMode(0)<cr>
