let s:bookmarks_file = '~/.vim/bookmarks'

function! s:OpenBookmarkFile() abort
  execute 'edit' fnameescape(s:bookmarks_file)
endfunction

function! s:OpenBookmark(cmd) abort
  let path = trim(getline('.'))
  if path == '' || path[0] == '#'
    return
  endif
  execute a:cmd fnameescape(path)
endfunction

function! s:SetupBookmarkBuffer() abort
  setlocal nobuflisted bufhidden=wipe
  " mapping <cr> to gf breaks on file names with spaces.
  nnoremap <buffer> <silent> <cr> :call <sid>OpenBookmark('edit')<cr>
  nnoremap <buffer> <silent> <s-cr> :call <sid>OpenBookmark('split')<cr>
endfunction

augroup bookmarks
  autocmd!
  execute 'autocmd BufRead,BufNewFile' s:bookmarks_file 'call <sid>SetupBookmarkBuffer()'
augroup end

nnoremap <silent> <leader>ob :call <sid>OpenBookmarkFile()<cr>
