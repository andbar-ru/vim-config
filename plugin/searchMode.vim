" SearchMode cycles between 3 search modes:
" * Normal - no mappings: search next ans previous work as normal (default)
" * Scroll hit to middle if not on same page - no scrolling occurs if the next hit is after the
" first line and before the last line of the window; otherwise, the search hit is scrolled to the
" middle.
" * Scroll hit to middle - the search hit is always scrolled to the middle (when posiible).
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

" Activate default mode 'scroll hit to middle if not on same page'.
call <sid>SearchMode(1)

nnoremap <silent> <plug>ToggleSearchMode :<c-u>call <sid>SearchMode(0)<cr>
