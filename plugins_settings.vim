if isdirectory($VIMRCDIR . '/plugged/nerdtree')
  let NERDTreeWinSize = 30
  let NERDTreeChDirMode = 1  " do not change curdir
  let NERDTreeQuitOnOpen = 3
  let NERDTreeIgnore = ['\.pyc', '\.swp$']
  let NERDTreeHijackNetrw = 0
endif

if isdirectory($PLUGDIR . '/vim-gitgutter')
  let g:gitgutter_signs = 0
endif

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

if isdirectory($PLUGDIR . '/gruvbox')
  let g:gruvbox_contrast_light = 'hard'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_vert_split = 'bg3'
  let g:gruvbox_italicize_comments = 0
  let g:gruvbox_invert_selection = 0
endif

" if isdirectory($PLUGDIR . '/vim-go')
"   let g:go_fmt_command = "goimports"
"   let g:go_fmt_experimental = 1
"   let g:go_highlight_operators = 1
"   " Enable metalinter_autosave only in 'Projects' folder.
"   let g:go_metalinter_autosave = 0
"   if match(expand('%'), $HOME . '/Projects') == 0
"     let g:go_metalinter_autosave = 1
"   endif
"   let g:go_metalinter_enabled = ['govet', 'errcheck', 'golint', 'staticcheck']
"   let g:go_metalinter_autosave_enabled = ['govet', 'errcheck', 'golint', 'staticcheck']
"   " Disable snippets in vim-go.
"   let g:go_snippet_engine = ""
" endif

" if isdirectory($PLUGDIR . '/tagbar')
"   " ctagsargs taken from tagbar.vim and modified to support roles.
"   let g:tagbar_type_vue = {
"     \'ctagstype': 'vue',
"     \'kinds': [
"       \'t:tags:0:1',
"       \'o:objects:0:1',
"       \'p:properties:0:0',
"       \'n:names:0:0',
"       \'f:functions:0:1',
"       \'e:events:0:0',
"       \'v:variables:0:0',
"       \'c:style_classes:0:0',
"       \'i:style_ids:0:0',
"       \'s:style_selectors:0:0'
"     \],
"     \'sro': '.',
"     \'kind2scope': {
"       \'o': 'object',
"       \'p': 'property',
"       \'n': 'name',
"       \'f': 'function',
"     \},
"     \'sort': 0,
"     \'ctagsargs': [
"       \'-o',
"       \'-',
"       \'--format=2',
"       \'--excmd=pattern',
"       \'--fields=nksSafrE',
"       \'--extras=+rg',
"       \'--file-scope=yes',
"       \'--sort=no',
"       \'--append=no'
"     \]
"   \}
" endif

if isdirectory($PLUGDIR . '/coc.nvim')
  " let g:coc_node_path = '~/bin/node' " already in $PATH
  " Desactivate coc by default, activate only for certain conditions.
  let g:coc_start_at_startup = 0
  if stridx(expand('%:p'), $HOME . '/Projects') == 0 ||
   \ expand('%:t') == 'coc-settings.json'
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

if isdirectory($PLUGDIR . '/vim-polyglot')
  let g:go_highlight_operators = 1
endif
if isdirectory($PLUGDIR . '/vim-polyglot') || isdirectory($PLUGDIR . '/vim-vue')
  let g:vue_pre_processors = ['typescript']
  " let g:vue_debug_indent = v:true
endif
if isdirectory($PLUGDIR . '/vim-polyglot') || isdirectory($PLUGDIR . '/vim-python-pep8-indent')
  let g:python_pep8_indent_multiline_string=-1
  let g:python_highlight_all = 1
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
