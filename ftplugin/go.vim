let s:highlightReferences = 0

" See available settings in plugged/govim/cmd/govim/config/config.go::type Config
call govim#config#Set('HighlightReferences', s:highlightReferences)

" See available commands in plugged/govim/cmd/govim/config/config.go::type Command
nnoremap <silent> <buffer> K :<c-u>call GOVIMHover()<cr>
nnoremap <silent> <buffer> <leader>gr :GOVIMReferences<cr>
nnoremap <silent> <buffer> <leader>gn :GOVIMRename<cr>
nnoremap <silent> <buffer> <leader>gsf :GOVIMSuggestedFixes<cr>
nnoremap <silent> <buffer> <leader>gt :GOVIMGoToTypeDef<cr>

function! s:toggleHighlightReferences()
  if s:highlightReferences
    execute 'GOVIMClearReferencesHighlights'
    let s:highlightReferences = 0
  else
    execute 'GOVIMHighlightReferences'
    let s:highlightReferences = 1
  endif
endfunction

nnoremap <silent> <buffer> <leader>gh :<c-u>call <SID>toggleHighlightReferences()<cr>

nnoremap <silent> <buffer> <leader>gsh :GOVIMExperimentalSignatureHelp<cr>
inoremap <silent> <buffer> <a-g>s <c-o>:GOVIMExperimentalSignatureHelp<cr>
nnoremap <silent> <buffer> <leader>gfs :GOVIMFillStruct<cr>
inoremap <silent> <buffer> <a-g>f <c-o>:GOVIMFillStruct<cr>

set wildcharm=<tab>
nnoremap <buffer> <leader>gv :GOVIM<tab>

