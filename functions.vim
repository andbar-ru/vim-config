function HiTrail(on)
    if a:on == 1
        highlight! link trailingSpace CursorLine
        match trailingSpace /\\\@<![\u3000[:space:]]\+$/
    else
        match none
    endif
endfunction

function ToggleHiTrail()
    if !exists('g:highlightTrailingSpace')
        let g:highlightTrailingSpace = 0
    endif
    if g:highlightTrailingSpace == 1
        let g:highlightTrailingSpace = 0
    else
        let g:highlightTrailingSpace = 1
    endif
    call HiTrail(g:highlightTrailingSpace)
endfunction

" Set bookmarks file .git/bookmarks for plugin vim-bookmarks
function g:BMWorkDirFileLocation()
  let filename = 'bookmarks'
  let location = ''
  if isdirectory('.git')
    " Current work dir is git's work tree
    let location = getcwd() . '/.git'
  else
    " Look upwards (at parents) for a directory named '.git'
    let location = finddir('.git', '.;')
  endif
  if len(location) > 0
    return location . '/' . filename
  else
    return "$VIMRCDIR/bookmarks/default"
  endif
endfunction
