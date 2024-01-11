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

if isdirectory($PLUGDIR . '/coc.nvim')
  let g:coc_node_path = '~/Programs/nvm/versions/node/v18.13.0/bin/node'
  " Desactivate coc by default, activate only for certain conditions.
  let g:coc_start_at_startup = 0
  if stridx(expand('%:p'), $HOME . '/Projects') == 0 || stridx(expand('%:p'), $HOME . '/Coding/typescript') == 0 || stridx(expand('%:p'), $HOME . '/Coding/Go') == 0 || expand('%:t') == 'coc-settings.json'
    let $NODE_ENV = 'development'
    let g:coc_start_at_startup = 1
  endif

	" Disable coc in node_modules.
  if stridx(expand('%:p'), 'node_modules') != -1
    let g:coc_start_at_startup = 0
  endif

  if &diff
    let g:coc_start_at_startup = 0
  endif
  " All coc-specific settings in plugin/coc.vim.
endif

if isdirectory($PLUGDIR . '/vim-vue-plugin')
  let g:vim_vue_plugin_config = {
    \'syntax': {
      \'template': ['html'],
      \'script': ['leafgarland_typescript'],
      \'style': ['scss'],
    \},
  \}
endif
