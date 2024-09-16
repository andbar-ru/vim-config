if isdirectory($PLUGDIR . '/vim-closetag')
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.tmpl'
  let g:closetag_filetypes = 'html'
  let g:closetag_close_shortcut = '<a->>'
  " let g:closetag_regions = {
  "   \ 'vue': 'htmlTagN',
  "   \ }
endif

if isdirectory($PLUGDIR . '/bufexplorer')
  let g:bufExplorerSplitRight=0
endif

if isdirectory($PLUGDIR . '/fzf.vim')
  " CTRL-A CTRL-Q to select all and build quickfix list
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{"filename": v:val}'))
    copen
    cc
  endfunction

  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'ctrl-q': function('s:build_quickfix_list') }

  let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
endif

if isdirectory($PLUGDIR . '/neosnippet.vim')
  let g:neosnippet#snippets_directory="$VIMRCDIR/snippets"
  let g:neosnippet#disable_runtime_snippets = {
  \ '_': 1,
  \ }
endif

if isdirectory($PLUGDIR . '/auto-pairs')
  let g:AutoPairsCenterLine = 0
  let g:AutoPairsMultilineClose = 0
  let g:AutoPairsMapCR = 0
endif

if isdirectory($PLUGDIR . '/vim-rooter')
  let g:rooter_patterns = ['.git', 'go.mod', 'Makefile', 'package.json']
endif

if isdirectory($PLUGDIR . '/asyncomplete.vim')
  let g:asyncomplete_auto_popup = 0

  function! Omni()
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
          \ 'name': 'omni',
          \ 'whitelist': g:omni_filetypes,
          \ 'completor': function('asyncomplete#sources#omni#completor')
          \ }))
  endfunction

  au VimEnter * :call Omni()
endif
