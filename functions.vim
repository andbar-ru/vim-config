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

" Строка пустая или состоит из пробельных символов?
function! IsLineEmpty(line)
  if match(getline(a:line), '^\s*$') == 0
    return 1
  else
    return 0
  endif
endfunction

" Скопировать и вставить строку после или вместо текущей.
function! CopyLine(count, relative, relativeDown)
  if a:count == 0
    if a:relative
      return
    endif
    " Если строка пустая или состоит из пробельных символов.
    if IsLineEmpty('.')
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
  if IsLineEmpty('.')
    execute 'normal "_ddP=='
  else
    execute 'normal p=='
  endif
endfunction

" Delete/change/yank inside closest braces.
function! DCYInWrapper(action)
  let lineNo = search('[({[]', 'cW')
  if lineNo == 0
    return
  endif
  let braceChar = getline('.')[col('.')-1]
  execute 'normal ' . a:action . 'i' . braceChar
endfunction

" Delete/change/yank till closest brace and braces with content. Use with <expr>.
function! DCYAWrapper(action)
  let lineNo = search('[({[]', 'cW')
  if lineNo == 0
    return ''
  endif
  let braceChar = getline('.')[col('.')-1]
  return 'v/' . braceChar . '%' . a:action
endfunction

" Delete/change/yank till closest brace and braces but without content. Uses vim-surround.
function! DCYOutWrapper(action)
  let lineNo = search('[({[]', 'cWs')
  if lineNo == 0
    return
  endif
  let braceChar = getline('.')[col('.')-1]
  execute 'normal ' . a:action . '``'
  execute 'normal ds' . braceChar
endfunction

" Run :GoBuild or :GoTestCompile based on the go file.
function! BuildGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Indents if cursor is at the beginning of line. Else do completion.
function! SuperTab()
  let col = col('.')
  " Cursor is on the first column.
  if col == 1
    " Indentwise tab
    if IsLineEmpty('.')
      " If previous calling didn't take effect, just type <tab>.
      if exists('g:prevSuperTabCurPos') && g:prevSuperTabCurPos == getcurpos()
        return "\<tab>"
      endif
      let g:prevSuperTabCurPos = getcurpos()

      if line('.') == line('$')
        return "\<esc>ddo"
      else
        return "\<esc>ddO"
      endif
    else
      return "\<tab>"
    endif
  endif

  let char = getline('.')[col - 2]
  " There is an indentifier before the cursor, so complete the identifier.
  if char =~ '\k'
    return "\<c-p>"
  else
    return "\<tab>"
  endif
endfunction
