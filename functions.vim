function! HiTrail(on)
    if a:on == 1
        highlight! link trailingSpace CursorLine
        match trailingSpace /\\\@<![\u3000[:space:]]\+$/
    else
        match none
    endif
endfunction

function! ToggleHiTrail()
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
function! g:BMWorkDirFileLocation()
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
  " http://vim.wikia.com/wiki/Moving_lines_up_or_down
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

" From http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
  let buf = bufnr("%")
  if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

" Go to the line with minimal indent containing word under cursor
function! GoToLineWithWordAndMininalIndent()
  let lines = execute('normal [I')
  let lines = split(lines, '\n')[1:]
  let lineNumberWithMinimalIndent = line('.')
  let minimalIndent = 1000

  for line in lines
    let parts = split(line)
    let lineNumber = parts[1]
    let lineIndent = indent(lineNumber)
    if lineIndent < minimalIndent
      let minimalIndent = lineIndent
      let lineNumberWithMinimalIndent = lineNumber
    endif
  endfor

  execute('normal ' . lineNumberWithMinimalIndent . 'G')
endfunction

" Returns translated name of the current syntax item.
function! SynName(line, col)
  return synIDattr(synIDtrans(synID(a:line, a:col, 1)), 'name')
endfunction

" Returns line indent in chars rather than in spaces.
function! IndentChars(line)
  return match(getline(a:line), '\S') + 1
endfunction

" Select entire comment line-wise.
function! SelectComment()
  let initLine = line('.')
  let firstNonBlankCharacterCol = IndentChars('.') + 1
  if SynName(initLine, firstNonBlankCharacterCol) != 'Comment'
    return
  endif
  let beginLine = initLine
  let endLine = initLine
  let curLine = initLine
  " backward
  while curLine > 0
    let curLine -= 1
    if SynName(curLine, IndentChars(curLine)+1) != 'Comment'
      let beginLine = curLine + 1
      break
    endif
  endwhile
  " forward
  let curLine = initLine
  while curLine <= line('$')
    let curLine += 1
    if SynName(curLine, IndentChars(curLine)+1) != 'Comment'
      let endLine = curLine - 1
      break
    endif
  endwhile
  execute('normal ' . beginLine . 'GV' . endLine . 'G')
endfunction

" Скопировать и вставить строку после или вместо текущей.
function! CopyLine(count, relative, relativeDown)
  if a:count == 0
    if a:relative
      return
    endif
    " Если строка пустая или состоит из пробельных символов.
    if match(getline('.'), '^\s*$') == 0
      execute '-1yank'
    else
      execute '.yank'
    endif
  else
    if a:relative
      if a:relativeDown
        execute '+' . a:count . 'yank'
      else
        execute '-' . a:count . 'yank'
      endif
    else
      execute a:count . 'yank'
    endif
  endif
  " Если строка пустая или состоит из пробельных символов.
  if match(getline('.'), '^\s*$') == 0
    execute 'normal "_ddP=='
  else
    execute 'normal p=='
  endif
endfunction
