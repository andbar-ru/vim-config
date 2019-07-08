if isdirectory($VIMRCDIR . '/plugged/nerdtree')
  let NERDTreeWinSize=30
  let NERDTreeChDirMode=1  " do not change curdir
  let NERDTreeQuitOnOpen=1
  let NERDTreeIgnore=['\.pyc', '\.swp$']
endif

if isdirectory($VIMRCDIR . '/plugged/supertab')
  let g:SuperTabDefultCompletionType = "<c-p>"
  let g:SuperTabRetainCompletionDuration = "completion"
  let g:SuperTabNoCompleteAfter = ['\s', ':', ')', ']', '}', "'", '"', '^']
endif

if isdirectory($VIMRCDIR . '/plugged/vim-python-pep8-indent')
  let g:python_pep8_indent_multiline_string=-1
  let g:python_highlight_all = 1
endif

if isdirectory($VIMRCDIR . '/plugged/vim-gitgutter')
  let g:gitgutter_signs = 0
endif

if isdirectory($VIMRCDIR . '/plugged/vim-closetag')
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue'
endif

if isdirectory($VIMRCDIR . '/plugged/bufexplorer')
  let g:bufExplorerSplitRight=0
endif

if isdirectory($VIMRCDIR . '/plugged/fzf.vim')
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

" if isdirectory($VIMRCDIR . '/plugged/ale')
"   let g:ale_sign_error = 'E'
"   let g:ale_sign_warning = 'W'
"   let g:ale_lint_on_text_changed = 'never'
"   let g:ale_lint_on_enter = 0
"   let g:ale_open_list = 1
"   let g:ale_linters = {
"   \   'go': ['gofmt', 'golint']
"   \}
" endif

if isdirectory($VIMRCDIR . '/plugged/neosnippet.vim')
  let g:neosnippet#snippets_directory="$VIMRCDIR/snippets"
  let g:neosnippet#disable_runtime_snippets = {
  \ '_': 1,
  \ }
endif

if isdirectory($VIMRCDIR . '/plugged/auto-pairs')
  let g:AutoPairsCenterLine = 0
  let g:AutoPairsMultilineClose = 0
endif

if isdirectory($VIMRCDIR . '/plugged/gruvbox')
  let g:gruvbox_contrast_light = 'hard'
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_vert_split = 'bg3'
  let g:gruvbox_italicize_comments = 0
  let g:gruvbox_invert_selection = 0
endif

if isdirectory($VIMRCDIR . '/plugged/vim-go')
  let g:go_fmt_command = "goimports"
  let g:go_fmt_experimental = 1
  let g:go_metalinter_autosave = 1
endif

if isdirectory($VIMRCDIR . '/plugged/tagbar')
  " ctagsargs taken from tagbar.vim and modified to support roles.
  let g:tagbar_type_vue = {
    \'ctagstype': 'vue',
    \'kinds': [
      \'t:tags:0:1',
      \'o:objects:0:1',
      \'p:properties:0:0',
      \'n:names:0:0',
      \'f:functions:0:1',
      \'e:events:0:0'
    \],
    \'sro': '.',
    \'kind2scope': {
      \'o': 'object',
      \'p': 'property',
      \'n': 'name',
      \'f': 'function'
    \},
    \'sort': 0,
    \'ctagsargs': [
      \'-o',
      \'-',
      \'--format=2',
      \'--excmd=pattern',
      \'--fields=nksSafr',
      \'--extras=+r',
      \'--file-scope=yes',
      \'--sort=no',
      \'--append=no'
    \]
  \}
endif
