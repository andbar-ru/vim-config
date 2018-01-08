let NERDTreeWinSize=30
let NERDTreeChDirMode=1  " do not change curdir
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc', '\.swp$']

let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabNoCompleteAfter = ['\s', ':', ')', ']', '}', "'", '"', '^']

let g:python_pep8_indent_multiline_string=-1
let g:python_highlight_all = 1

let g:gitgutter_signs = 0

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
let g:rooter_change_directory_for_non_project_files = 'current'
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

" denite.nvim
call denite#custom#var('file_rec', 'command', [$VIMRCDIR . '/bin/denite-file_rec.sh'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

" jedi-vim
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>jg"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>jr"

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1

" neosnippets
let g:neosnippet#snippets_directory="$VIMRCDIR/snippets"
let g:neosnippet#disable_runtime_snippets = {
\ '_': 1,
\ }
