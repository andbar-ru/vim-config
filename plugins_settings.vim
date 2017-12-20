let NERDTreeWinSize=30
let NERDTreeChDirMode=1  " do not change curdir
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc', '\.swp$']

let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabNoCompleteAfter = ['\s', ':', ')', ']', '}', "'", '"', '^']

let g:python_pep8_indent_multiline_string=-1
let g:python_highlight_all = 1

let g:gitgutter_signs = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["python"],
    \ "passive_filetypes": [] }
if executable('python3.6')
  let g:syntastic_python_python_exec = 'python3.6'
else
  let g:syntastic_python_python_exec = 'python3'
endif

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue'

" bufexplorer
let g:bufExplorerSplitRight=0

" vim-bookmarks
let g:bookmark_auto_close = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_no_default_key_mappings = 1

" vim-rooter
let g:rooter_targets = '*'
let g:rooter_pattern = ['.git/']
let g:rooter_silent_chdir = 1

" fzf.vim
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
