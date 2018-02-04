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

function! AddVenvSitePackages()
  if has('python3')
python3 << EOF
import os
venv_path = os.getenv('VIRTUAL_ENV')
if venv_path:
  lib_path = os.path.join(venv_path, 'lib')
  for item in os.listdir(lib_path):
    path = os.path.join(lib_path, item, 'site-packages')
    if os.path.isdir(path):
      sys.path.insert(0, path)
EOF
  endif
endfunction

function! MoveLines(direction, mode) range
  let l:prev_fdm = &fdm
  set fdm=manual
  let l:start_line = line('.')
  let l:end_line = line('.')
  if a:mode == 'v'
    let l:start_line = line("'<")
    let l:end_line = line("'>")
  endif
  if a:direction == 'up' && l:start_line != 1
    if a:mode == 'v'
      '<,'>m '<-2
    else
      m-2
    endif
  elseif a:direction == 'down' && l:end_line != line('$')
    if a:mode == 'v'
      '<,'>m '>+
    else
      m+
    endif
  endif
  if a:mode == 'v'
    exec "normal gv"
  endif
  let &fdm = l:prev_fdm
endfunction
