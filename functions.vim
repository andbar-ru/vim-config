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
  let firstNonBlankCharacterCol = IndentChars('.')
  if SynName(initLine, firstNonBlankCharacterCol) != 'Comment'
    return
  endif
  let beginLine = initLine
  let endLine = initLine
  let curLine = initLine
  " backward
  while curLine > 0
    let curLine -= 1
    if SynName(curLine, IndentChars(curLine)) != 'Comment'
      let beginLine = curLine + 1
      break
    endif
  endwhile
  " forward
  let curLine = initLine
  while curLine <= line('$')
    let curLine += 1
    if SynName(curLine, IndentChars(curLine)) != 'Comment'
      let endLine = curLine - 1
      break
    endif
  endwhile
  execute('normal ' . beginLine . 'GV' . endLine . 'G')
endfunction

" Comments selected lines as block in visual mode and uncomments in another mode.
" Mode is given by argument.
function! ToggleBlockComment(isVisualMode)
  if a:isVisualMode
    let line0 = line("'<")
    let indent = indent(line0)
    let line1 = line("'>")
    let indentStr = repeat(' ', indent)
    call append(line1, indentStr .. '*/')
    call append(line0 - 1, indentStr .. "/*")
  else
    let line0 = search('^\s*/\*', 'bcnW')
    let line1 = search('^\s*\*/', 'cnW')
    if line0 > 0 && line1 > 0
      execute line1 .. "d _"
      execute line0 .. "d _"
    endif
  endif
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

" Delete wrapping '{', '}' lines and undent inner content.
function! DeleteOutWrapperBlock()
  let pos = getcurpos()
  let ind = indent('.')
  let startLine = search('{$', 'bW')
  if startLine == 0
    return
  endif
  let startInd = indent('.')
  let indDiff = ind - startInd
  execute 'normal %'
  let endLine = line('.')
  if endLine - startLine <= 1
    return
  endif
  " undent inner content
  execute startLine+1 .. ',' .. (endLine-1) .. '<'
  execute endLine .. 'd'
  execute startLine .. 'd'
  let pos[1] -= 1
  let pos[2] -= indDiff
  call setpos('.', pos)
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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction

" Delete current snippet
function! DeleteSnippet()
  let lineNoBegin = search('^\v\s*.+ begin #{40,}$', 'bwc')
  if lineNoBegin == 0
    return 0
  endif
  let lineNoEnd = search('^\v\s*.+ end #{40,}$', 'W')
  if lineNoEnd == 0
    return 0
  endif
  let code = deletebufline('%', lineNoBegin, lineNoEnd)
  if code == 1
    return 0
  endif
  return lineNoEnd - lineNoBegin + 1
endfunction

" Delete all blocks # begin #... # end #... in file.
function! DeleteAllSnippets()
  let linesDeletedSum = 0
  while 1
    let lineNo = search('^\v\s*.+ begin #{40,}$', 'wc')
    if lineNo == 0
      break
    endif
    let linesDeleted = DeleteSnippet()
    if linesDeleted == 0
      break
    endif
    let linesDeletedSum += linesDeleted
  endwhile
  echo linesDeletedSum . ' fewer lines'
endfunction

" Tries to open non-standard path names.
function! GoToFile(path)
  let filepathOrig = ''
  if a:path[0] == '@'
    let filepathOrig = systemlist('git rev-parse --show-toplevel')[0] .. '/src' .. a:path[1:]
  else
    let filepathOrig = simplify(expand('%:h') .. '/' .. a:path)
  endif

  let filepath = filepathOrig
  if (!filereadable(filepath))
    let filepath ..= '.ts'
  endif
  if (!filereadable(filepath))
    echoerr "Can't find file \"" .. filepathOrig .. '"'
    return 0
  endif

  execute 'e ' .. filepath
endfunction

" Creates new package in the parent directory and saves current file as main.go in that package.
function! GoSavNewMain(name)
  let newDir = expand('%:p:h:h') .. '/' .. a:name
  call system('mkdir ' .. newDir)
  exec 'sav ' .. newDir .. '/main.go'
endfunction

function! WrappingCnext()
  try
    cnext
  catch /.*/
    cfirst
  endtry
endfunction

function! WrappingCprev()
  try
    cprev
  catch /.*/
    clast
  endtry
endfunction
