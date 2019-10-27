if exists('g:did_coc_loaded') || v:version < 800 || !(isdirectory($PLUGDIR . '/coc.nvim'))
  finish
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h ' . expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add status line support, fir integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Colors
highlight default link CocFloating DiffChange
highlight default link CocErrorHighlight SpellBad
highlight default link CocWarningHighlight SpellLocal
highlight default CocErrorSign ctermfg=red guifg=#ad2b52
highlight default link CocWarningSign Type
highlight default link CocInfoSign String
highlight default link CocHintSign PreProc

" mappings
inoremap <silent> <expr> <tab>
      \ pumvisible() ? '<c-n>' :
      \ <sid>check_back_space() ? (col('.') == 1 ? '<esc>ddO' : '<tab>') :
      \ coc#refresh()
inoremap <expr> <s-tab> pumvisible() ? '<c-p>' : '<s-tab>'

augroup cocMaps
  autocmd Filetype javascript,json,typescript,vue nmap <silent> [g <plug>(coc-diagnostic-prev)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> ]g <plug>(coc-diagnostic-next)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> [ge <plug>(coc-diagnostic-prev-error)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> ]ge <plug>(coc-diagnostic-next-error)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gd <plug>(coc-definition)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gds :<c-u>call CocAction('jumpDefinition', 'split')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gdv :<c-u>call CocAction('jumpDefinition', 'vsplit')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gdt :<c-u>call CocAction('jumpDefinition', 'tabe')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gt <plug>(coc-type-definition)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gts :<c-u>call CocAction('jumpTypeDefinition', 'split')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gtv :<c-u>call CocAction('jumpTypeDefinition', 'vsplit')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gtt :<c-u>call CocAction('jumpTypeDefinition', 'tabe')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gi <plug>(coc-implementation)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gis :<c-u>call CocAction('jumpImplementation', 'split')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>giv :<c-u>call CocAction('jumpImplementation', 'vsplit')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>git :<c-u>call CocAction('jumpImplementation', 'tabe')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gr <plug>(coc-references)
  autocmd Filetype javascript,json,typescript,vue nnoremap <silent> K :call <sid>show_documentation()<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <leader>pf :<c-u>echo CocAction('getCurrentFunctionSymbol')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <leader>ss :<c-u>call CocAction('workspaceSymbols')<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <leader>cr <plug>(coc-rename)
  " Format selected region (coc-prettier required)
  autocmd Filetype javascript,json,typescript,vue vmap <leader>cf <plug>(coc-format-selected)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>cf <plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leaderaap` for current paragraph
  autocmd Filetype javascript,json,typescript,vue vmap <leader>ca <plug>(coc-codeaction-selected)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>ca <plug>(coc-codeaction-selected)
  " do codeAction of current line
  autocmd Filetype javascript,json,typescript,vue nmap <leader>cca <plug>(coc-codeaction)
  " Fix autofix problem of current line
  autocmd Filetype javascript,json,typescript,vue nmap <leader>cqf <plug>(coc-fix-current)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>cfh <plug>(coc-float-hide)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>crf <plug>(coc-refactor)
  " Mappings for function text object, requires document symbols feature of languageserver.
  " Mapping to <plug>(coc-funcobj-i) for some reason doesn't work.
  autocmd Filetype javascript,json,typescript,vue onoremap if :<c-u>call coc#rpc#request('selectFunction', [v:true, ''])<cr>
  autocmd Filetype javascript,json,typescript,vue vnoremap if :<c-u>call coc#rpc#request('selectFunction', [v:true, visualmode()])<cr>
  autocmd Filetype javascript,json,typescript,vue onoremap af :<c-u>call coc#rpc#request('selectFunction', [v:false, ''])<cr>
  autocmd Filetype javascript,json,typescript,vue vnoremap af :<c-u>call coc#rpc#request('selectFunction', [v:false, visualmode()])<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <leader>af <plug>(coc-funcobj-a)
  " Use <c-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <c-d> <plug>(coc-range-select)
  autocmd Filetype javascript,json,typescript,vue xmap <silent> <c-d> <plug>(coc-range-select)

  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>cld :<c-u>CocList diagnostics<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>cle :<c-u>CocList extensions<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>clc :<c-u>CocList commands<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>clo :<c-u>CocList outline<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>cls :<c-u>CocList -I symbols<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>cn :<c-u>CocNext<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>cp :<c-u>CocPrev<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>clr :<c-u>CocListResume<cr>
  " Often coc-vetur doesn't update diagnostic info with no kick
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>rv :<c-u>call CocAction('reloadExtension', 'coc-vetur')<cr>
  " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  nmap <silent> <leader>ch :<c-u>call CocActionAsync('highlight')<cr>
augroup end

augroup cocCommands
  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
  " Use `:OR` for organize import of current buffer
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
augroup end

augroup cocAutoCommands
  autocmd!
  " Setup formatter
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

an 1.125 PopUp.-SEP5- <Nop>

" <Plug>(coc-diagnostic-info)
anoremenu 1.130 PopUp.Coc.DiagnosticInfo :<c-u>call CocActionAsync('diagnosticInfo')<cr>
" <Plug>(coc-diagnostic-next)
anoremenu 1.130 PopUp.Coc.DiagnosticNext :<c-u>call CocActionAsync('diagnosticNext')<cr>
" <Plug>(coc-diagnostic-prev)
anoremenu 1.130 PopUp.Coc.DiagnosticPrev :<c-u>call CocActionAsync('diagnosticPrevious')<cr>
" <Plug>(coc-diagnostic-next-error)
anoremenu 1.130 PopUp.Coc.DiagnosticNextError :<c-u>call CocActionAsync('diagnosticNext', 'error')<cr>
" <Plug>(coc-diagnostic-prev-error)
anoremenu 1.130 PopUp.Coc.DiagnosticPrevError :<c-u>call CocActionAsync('diagnosticPrevious', 'error')<cr>
" <Plug>(coc-definition)
anoremenu 1.130 PopUp.Coc.Definition :<c-u>call CocAction('jumpDefinition')<cr>
" <Plug>(coc-declaration)
anoremenu 1.130 PopUp.Coc.Declaration :<c-u>call CocAction('jumpDeclaration')<cr>
" <Plug>(coc-implementation)
anoremenu 1.130 PopUp.Coc.Implementation :<c-u>call CocAction('jumpImplementation')<cr>
" <Plug>(coc-type-definition)
anoremenu 1.130 PopUp.Coc.TypeDefinition :<c-u>call CocAction('jumpTypeDefinition')<cr>
" <Plug>(coc-references)
anoremenu 1.130 PopUp.Coc.References :<c-u>call CocAction('jumpReferences')<cr>
" <Plug>(coc-format-selected)
vnoremenu 1.130 PopUp.Coc.FormatSelected :<c-u>call CocActionAsync('formatSelected', visualmode())<cr>
" <Plug>(coc-format)
anoremenu 1.130 PopUp.Coc.FormatDocument :<c-u>call CocActionAsync('format')<cr>
" <Plug>(coc-rename)
anoremenu 1.130 PopUp.Coc.Rename :<c-u>call CocActionAsync('rename')<cr>
" <Plug>(coc-codeaction)
anoremenu 1.130 PopUp.Coc.CodeAction :<c-u>call CocActionAsync('codeAction', '')<cr>
" <Plug>(coc-codeaction-selected)
vnoremenu 1.130 PopUp.Coc.CodeActionSelected :<c-u>call CocActionAsync('codeAction', visualmode())<cr>
" <Plug>(coc-openlink)
anoremenu 1.130 PopUp.Coc.OpenLink :<c-u>call CocActionAsync('openLink')<cr>
" <Plug>(coc-codelens-action)
anoremenu 1.130 PopUp.Coc.CodelensAction :<c-u>call CocActionAsync('codeLensAction')<cr>
" <Plug>(coc-fix-current)
anoremenu 1.130 PopUp.Coc.FixCurrent :<c-u>call CocActionAsync('doQuickfix')<cr>
" <Plug>(coc-float-hide)
anoremenu 1.130 PopUp.Coc.FloatHide :<c-u>call coc#util#float_hide()<cr>
" <Plug>(coc-float-jump)
anoremenu 1.130 PopUp.Coc.FloatJump :<c-u>call coc#util#float_jump()<cr>
" <Plug>(coc-refactor)
anoremenu 1.130 PopUp.Coc.Refactor :<c-u>call CocActionAsync('refactor')<cr>
" <Plug>(coc-range-select)
anoremenu 1.130 PopUp.Coc.RangeSelect :<c-u>call CocAction('rangeSelect', '', v:true)<cr>
vnoremenu 1.130 PopUp.Coc.RangeSelect :<c-u>call CocAction('rangeSelect', visualmode(), v:true)<cr>
" <Plug>(coc-range-select-backward)
vnoremenu 1.130 PopUp.Coc.RangeSelectBackward :<c-u>call CocAction('rangeSelect', visualmode(), v:false)<cr>
" <Plug>(coc-funcobj-i)
anoremenu 1.130 PopUp.Coc.SelectInsideFunction :<c-u>call coc#rpc#request('selectFunction', [v:true, ''])<cr>
vnoremenu 1.130 PopUp.Coc.SelectInsideFunction :<c-u>call coc#rpc#request('selectFunction', [v:true, visualmode()])<cr>
" <Plug>(coc-funcobj-a)
anoremenu 1.130 PopUp.Coc.SelectFunction :<c-u>call coc#rpc#request('selectFunction', [v:false, ''])<cr>
vnoremenu 1.130 PopUp.Coc.SelectFunction :<c-u>call coc#rpc#request('selectFunction', [v:false, visualmode()])<cr>
