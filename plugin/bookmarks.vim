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
  nnoremap <buffer> <silent> <cr> :call <sid>OpenBookmark('edit')<cr>
  nnoremap <buffer> <silent> <s-cr> :call <sid>OpenBookmark('split')<cr>
  nnoremap <buffer> <silent> <leader>a :put =fnamemodify(expand('#:p'), ':~')<cr>
endfunction

augroup bookmarks
  autocmd!
  execute 'autocmd BufRead,BufNewFile' s:bookmarks_file 'call <sid>SetupBookmarkBuffer()'
augroup end

" bo stands for 'bookmarks: open'
nnoremap <silent> <leader>bo :call <sid>OpenBookmarkFile()<cr>
