let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc', '\.swp$']

let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabNoCompleteAfter = ['\s', ':', ')', ']', '}', "'", '"', '^']

let g:xmledit_enable_html = 1

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

