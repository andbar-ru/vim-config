let s:highlight_references = 0

setlocal updatetime=500 " default 4000
setlocal balloondelay=500 " default 600
" I didn't find a way to make diagnostics only on save.
" Without these options permanent diagnostics make editor twitching all along.
setlocal number
set signcolumn=number

" See available settings in plugged/govim/cmd/govim/config/config.go::type Config
call govim#config#Set('HighlightReferences', s:highlight_references)

" See available commands in plugged/govim/cmd/govim/config/config.go::type Command
nnoremap <silent> <buffer> K :<c-u>call GOVIMHover()<cr>
nnoremap <silent> <buffer> <leader>gr :GOVIMReferences<cr>
nnoremap <silent> <buffer> <leader>gn :GOVIMRename<cr>
nnoremap <silent> <buffer> <leader>gsf :GOVIMSuggestedFixes<cr>
nnoremap <silent> <buffer> <leader>gt :GOVIMGoToTypeDef<cr>

function! s:ToggleHighlightReferenses()
  if s:highlight_references
    execute 'GOVIMClearReferencesHighlights'
    let s:highlight_references = 0
  else
    execute 'GOVIMHighlightReferences'
    let s:highlight_references = 1
  endif
endfunction

nnoremap <silent> <buffer> <leader>gh :<c-u>call <sid>ToggleHighlightReferenses()<cr>

nnoremap <silent> <buffer> <leader>gsh :GOVIMExperimentalSignatureHelp<cr>
inoremap <silent> <buffer> <a-g>s <c-o>:GOVIMExperimentalSignatureHelp<cr>
nnoremap <silent> <buffer> <leader>gfs :GOVIMFillStruct<cr>
inoremap <silent> <buffer> <a-g>f <c-o>:GOVIMFillStruct<cr>

set wildcharm=<tab>
nnoremap <buffer> <leader>gv :GOVIM<tab>

let s:disable_diagnostics_until_save = 0

function! s:DisableDiagnostics(until_save)
  call govim#config#Set('QuickfixSigns', 0)
  call govim#config#Set('HighlightDiagnostics', 0)
  if a:until_save
    let s:disable_diagnostics_until_save = 1
  endif
endfunction

function! s:EnableDiagnostics(force)
  if s:disable_diagnostics_until_save && !a:force
    return
  endif

  call govim#config#Set('QuickfixSigns', 1)
  call govim#config#Set('HighlightDiagnostics', 1)
  set number
endfunction

nnoremap <buffer> <leader>gdd :<c-u>call <sid>DisableDiagnostics(1)<cr>

let s:autocmds_loaded = 0
if !s:autocmds_loaded
  autocmd InsertEnter  *.go call <sid>DisableDiagnostics(0)
  autocmd InsertLeave  *.go call <sid>EnableDiagnostics(0)
  autocmd BufWritePost *.go call <sid>EnableDiagnostics(1)
  let s:autocmds_loaded = 1
endif

" Adjust highlights to colorscheme
highlight GOVIMErr  gui=underline
highlight GOVIMWarn gui=underline
highlight GOVIMInfo gui=underline
highlight GOVIMHint gui=underline
highlight link GOVIMSignErr  Error
highlight link GOVimSignWarn Type
highlight link GOVIMSignInfo String
highlight link GOVIMSignHint PreProc
