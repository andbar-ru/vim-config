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
imap <silent> <expr> <tab>
      \ pumvisible() ? '<c-n>' :
      \ <sid>check_back_space() ? '<tab>' :
      \ coc#refresh()
imap <expr> <s-tab> pumvisible() ? '<c-p>' : '<s-tab>'

let s:cocFiletypes = "javascript,json,typescript,vue,python,go"
augroup cocMaps
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>cld :<c-u>CocList diagnostics<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> [g <plug>(coc-diagnostic-prev)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> ]g <plug>(coc-diagnostic-next)"
  " execute 'autocmd Filetype ' . s:cocFiletypes . ' nmap <silent> [ge <plug>(coc-diagnostic-prev-error)'
  " execute 'autocmd Filetype ' . s:cocFiletypes . ' nmap <silent> ]ge <plug>(coc-diagnostic-next-error)'
  "
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gdd <plug>(coc-definition)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> gD <plug>(coc-definition)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gds :<c-u>call CocAction('jumpDefinition', 'split')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gdv :<c-u>call CocAction('jumpDefinition', 'vsplit')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gdt :<c-u>call CocAction('jumpDefinition', 'tabe')<cr>"

  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gt <plug>(coc-type-definition)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gts :<c-u>call CocAction('jumpTypeDefinition', 'split')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gtv :<c-u>call CocAction('jumpTypeDefinition', 'vsplit')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gtt :<c-u>call CocAction('jumpTypeDefinition', 'tabe')<cr>"

  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gi <plug>(coc-implementation)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gis :<c-u>call CocAction('jumpImplementation', 'split')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>giv :<c-u>call CocAction('jumpImplementation', 'vsplit')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>git :<c-u>call CocAction('jumpImplementation', 'tabe')<cr>"

  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>gr <plug>(coc-references)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>grs :<c-u>call CocAction('jumpReferences', 'split')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>grv :<c-u>call CocAction('jumpReferences', 'vsplit')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>grt :<c-u>call CocAction('jumpReferences', 'tabe')<cr>"

  execute "autocmd Filetype " . s:cocFiletypes . " nnoremap <silent> K :call <sid>show_documentation()<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nnoremap <silent> <leader>csh :<c-u>call CocActionAsync('showSignatureHelp')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>pf :<c-u>echo CocAction('getCurrentFunctionSymbol')<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>cr <plug>(coc-rename)"
  " Format entire document (coc-prettier required)
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>cff <plug>(coc-format)"
  " Format selected region (coc-prettier required)
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>cf <plug>(coc-format-selected)"
  execute "autocmd Filetype " . s:cocFiletypes . " vmap <leader>cf <plug>(coc-format-selected)"
  " Remap for do codeAction of selected region, ex: `<leader>ap` for current paragraph
  execute "autocmd Filetype " . s:cocFiletypes . " vmap <leader>ca <plug>(coc-codeaction-selected)"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>ca <plug>(coc-codeaction-selected)"
  " do codeAction of current line
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>cca <plug>(coc-codeaction)"
  " Fix autofix problem of current line
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>cqf <plug>(coc-fix-current)"
  " execute 'autocmd Filetype ' . s:cocFiletypes . ' nmap <leader>chf <plug>(coc-float-hide)'
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <leader>crf <plug>(coc-refactor)"
  " Mappings for function text object, requires document symbols feature of languageserver.
  execute "autocmd Filetype " . s:cocFiletypes . " xmap if <plug>(coc-funcobj-i)"
  execute "autocmd Filetype " . s:cocFiletypes . " omap if <plug>(coc-funcobj-i)"
  execute "autocmd Filetype " . s:cocFiletypes . " xmap af <plug>(coc-funcobj-a)"
  execute "autocmd Filetype " . s:cocFiletypes . " omap af <plug>(coc-funcobj-a)"
  execute "autocmd Filetype " . s:cocFiletypes . " xmap ic <plug>(coc-classobj-i)"
  execute "autocmd Filetype " . s:cocFiletypes . " omap ic <plug>(coc-classobj-i)"
  execute "autocmd Filetype " . s:cocFiletypes . " xmap ac <plug>(coc-classobj-a)"
  execute "autocmd Filetype " . s:cocFiletypes . " omap ac <plug>(coc-classobj-a)"
  " Use <c-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <c-s> :<c-u>call CocAction('rangeSelect', '', v:true)<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " xmap <silent> <c-s> :<c-u>call CocAction('rangeSelect', visualmode(), v:true)<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " xmap <silent> <c-a-s> :<c-u>call CocAction('rangeSelect', visualmode(), v:false)<cr>"
  
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>cle :<c-u>CocList extensions<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>clc :<c-u>CocList commands<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>clo :<c-u>CocList outline<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>cls :<c-u>CocList -I symbols<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>cn :<c-u>CocNext<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>cp :<c-u>CocPrev<cr>"
  execute "autocmd Filetype " . s:cocFiletypes . " nmap <silent> <leader>clr :<c-u>CocListResume<cr>"

  " Highlight symbol under cursor on CursorHold
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  nmap <silent> <leader>ch :<c-u>call CocActionAsync('highlight')<cr>

  """"""""""""""""""""""""""""""""""""""""""""""""""
  " Coc extensions
  """"""""""""""""""""""""""""""""""""""""""""""""""
  " Often coc-vetur doesn't update diagnostic with no kick
  autocmd Filetype javascript,json,typescript,vue,python nmap <silent> <leader>rv :<c-u>call CocAction('reloadExtension', 'coc-vetur')<cr>
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
anoremenu 1.130 PopUp.Coc.Diagnostic.List<tab><leader>cld :<c-u>call CocActionAsync('diagnosticList')<cr>
" <Plug>(coc-diagnostic-prev)
anoremenu 1.130 PopUp.Coc.Diagnostic.Prev<tab>[g :<c-u>call CocActionAsync('diagnosticPrevious')<cr>
" <Plug>(coc-diagnostic-next)
anoremenu 1.130 PopUp.Coc.Diagnostic.Next<tab>]g :<c-u>call CocActionAsync('diagnosticNext')<cr>
" <Plug>(coc-diagnostic-prev-error)
anoremenu 1.130 PopUp.Coc.Diagnostic.Prev\ Error :<c-u>call CocActionAsync('diagnosticPrevious', 'error')<cr>
" <Plug>(coc-diagnostic-next-error)
anoremenu 1.130 PopUp.Coc.Diagnostic.Next\ Error :<c-u>call CocActionAsync('diagnosticNext', 'error')<cr>
anoremenu 1.130 PopUp.Coc.Diagnostic.Info :<c-u>call CocActionAsync('diagnosticInfo')<cr>
anoremenu 1.130 PopUp.Coc.Diagnostic.Toggle :<c-u>call CocActionAsync('diagnosticToggle')<cr>

" <Plug>(coc-definition)
anoremenu 1.130 PopUp.Coc.Definition.Current\ Buffer<tab><leader>gd :<c-u>call CocAction('jumpDefinition')<cr>
anoremenu 1.130 PopUp.Coc.Definition.Split<tab><leader>gds :<c-u>call CocAction('jumpDefinition', 'split')<cr>
anoremenu 1.130 PopUp.Coc.Definition.Vertical\ Split<tab><leader>gdv :<c-u>call CocAction('jumpDefinition', 'vsplit')<cr>
anoremenu 1.130 PopUp.Coc.Definition.New\ Tab<tab><leader>gdt :<c-u>call CocAction('jumpDefinition', 'tabe')<cr>

" <Plug>(coc-declaration)
anoremenu 1.130 PopUp.Coc.Declaration.Current\ Buffer :<c-u>call CocAction('jumpDeclaration')<cr>
anoremenu 1.130 PopUp.Coc.Declaration.Split :<c-u>call CocAction('jumpDeclaration', 'split')<cr>
anoremenu 1.130 PopUp.Coc.Declaration.Vertical\ Split :<c-u>call CocAction('jumpDeclaration', 'vsplit')<cr>
anoremenu 1.130 PopUp.Coc.Declaration.New\ Tab :<c-u>call CocAction('jumpDeclaration', 'tabe')<cr>

" <Plug>(coc-implementation)
anoremenu 1.130 PopUp.Coc.Implementation.Current\ Buffer<tab><leader>gi :<c-u>call CocAction('jumpImplementation')<cr>
anoremenu 1.130 PopUp.Coc.Implementation.Split<tab><leader>gis :<c-u>call CocAction('jumpImplementation', 'split')<cr>
anoremenu 1.130 PopUp.Coc.Implementation.Vertical\ Split<tab><leader>giv :<c-u>call CocAction('jumpImplementation', 'vsplit')<cr>
anoremenu 1.130 PopUp.Coc.Implementation.New\ Tab<tab><leader>git :<c-u>call CocAction('jumpImplementation', 'tabe')<cr>

" <Plug>(coc-type-definition)
anoremenu 1.130 PopUp.Coc.TypeDefinition.Current\ Buffer<tab><leader>gt :<c-u>call CocAction('jumpTypeDefinition')<cr>
anoremenu 1.130 PopUp.Coc.TypeDefinition.Split<tab><leader>gts :<c-u>call CocAction('jumpTypeDefinition', 'split')<cr>
anoremenu 1.130 PopUp.Coc.TypeDefinition.Vertical\ Split<tab><leader>gtv :<c-u>call CocAction('jumpTypeDefinition', 'vsplit')<cr>
anoremenu 1.130 PopUp.Coc.TypeDefinition.New\ Tab<tab><leader>gtt :<c-u>call CocAction('jumpTypeDefinition', 'tabe')<cr>

" <Plug>(coc-references)
anoremenu 1.130 PopUp.Coc.References.Current\ Buffer<tab><leader>gr :<c-u>call CocAction('jumpReferences')<cr>
anoremenu 1.130 PopUp.Coc.References.Split<tab><leader>grs :<c-u>call CocAction('jumpReferences', 'split')<cr>
anoremenu 1.130 PopUp.Coc.References.Vertical\ Split<tab><leader>grv :<c-u>call CocAction('jumpReferences', 'vsplit')<cr>
anoremenu 1.130 PopUp.Coc.References.New\ Tab<tab><leader>grt :<c-u>call CocAction('jumpReferences', 'tabe')<cr>

anoremenu 1.130 PopUp.Coc.Hover<tab>K :<c-u>call CocAction('doHover')<cr>
anoremenu 1.130 PopUp.Coc.Show\ Signature\ Help<tab><leader>csh :<c-u>call CocActionAsync('showSignatureHelp')<cr>
anoremenu 1.130 PopUp.Coc.Get\ Current\ Function\ Symbol<tab><leader>pf :<c-u>echo CocAction('getCurrentFunctionSymbol')<cr>
anoremenu 1.130 PopUp.Coc.Document\ Symbols :<c-u>echo CocAction('documentSymbols')<cr>
" <Plug>(coc-rename)
anoremenu 1.130 PopUp.Coc.Rename<tab><leader>cr :<c-u>call CocActionAsync('rename')<cr>

" <Plug>(coc-format)
anoremenu 1.130 PopUp.Coc.Format\ Document<tab><leader>cff :<c-u>call CocActionAsync('format')<cr>
" <Plug>(coc-format-selected)
vnoremenu 1.130 PopUp.Coc.Format\ Selected<tab><leader>cf :<c-u>call CocActionAsync('formatSelected', visualmode())<cr>
" <Plug>(coc-codeaction)
anoremenu 1.130 PopUp.Coc.CodeAction<tab><leader>ca :<c-u>call CocActionAsync('codeAction', '')<cr>
" <Plug>(coc-codeaction-selected)
vnoremenu 1.130 PopUp.Coc.CodeActionSelected<tab><leader>ca :<c-u>call CocActionAsync('codeAction', visualmode())<cr>
" <Plug>(coc-openlink)
anoremenu 1.130 PopUp.Coc.Open\ Link :<c-u>call CocActionAsync('openLink')<cr>
" <Plug>(coc-codelens-action)
anoremenu 1.130 PopUp.Coc.Codelens\ Action :<c-u>call CocActionAsync('codeLensAction')<cr>
" <Plug>(coc-fix-current)
anoremenu 1.130 PopUp.Coc.Fix\ Current<tab><leader>cqf :<c-u>call CocActionAsync('doQuickfix')<cr>
" <Plug>(coc-float-hide)
anoremenu 1.130 PopUp.Coc.Hide\ Float<tab><leader>chf :<c-u>call coc#util#float_hide()<cr>
anoremenu 1.130 PopUp.Coc.Highlight<tab><leader>ch :<c-u>call CocActionAsync('highlight')<cr>
" <Plug>(coc-float-jump)
anoremenu 1.130 PopUp.Coc.Float\ Jump :<c-u>call coc#float#jump()<cr>
" <Plug>(coc-refactor)
anoremenu 1.130 PopUp.Coc.Refactor<tab><leader>crf :<c-u>call CocActionAsync('refactor')<cr>
" <Plug>(coc-range-select)
anoremenu 1.130 PopUp.Coc.Range\ Select<tab><c-s> :<c-u>call CocAction('rangeSelect', '', v:true)<cr>
vnoremenu 1.130 PopUp.Coc.Range\ Select<tab><c-s> :<c-u>call CocAction('rangeSelect', visualmode(), v:true)<cr>
" <Plug>(coc-range-select-backward)
vnoremenu 1.130 PopUp.Coc.Range\ Select\ Backward<tab><c-a-s> :<c-u>call CocAction('rangeSelect', visualmode(), v:false)<cr>
" <Plug>(coc-funcobj-i)
anoremenu 1.130 PopUp.Coc.Select\ Inside\ Function<tab>vif :<c-u>call coc#rpc#request('selectFunction', [v:true, ''])<cr>
vnoremenu 1.130 PopUp.Coc.Select\ Inside\ Function<tab>if :<c-u>call coc#rpc#request('selectFunction', [v:true, visualmode()])<cr>
" <Plug>(coc-funcobj-a)
anoremenu 1.130 PopUp.Coc.Select\ Function<tab>vaf :<c-u>call coc#rpc#request('selectFunction', [v:false, ''])<cr>
vnoremenu 1.130 PopUp.Coc.Select\ Function<tab>af :<c-u>call coc#rpc#request('selectFunction', [v:false, visualmode()])<cr>

anoremenu 1.130 PopUp.Coc.List.Extensions<tab><leader>cle :<c-u>CocList extensions<cr>
anoremenu 1.130 PopUp.Coc.List.Commands<tab><leader>clc :<c-u>CocList commands<cr>
anoremenu 1.130 PopUp.Coc.List.Outline<tab><leader>clo :<c-u>CocList outline<cr>
anoremenu 1.130 PopUp.Coc.List.Symbols<tab><leader>cls :<c-u>CocList -I symbols<cr>
anoremenu 1.130 PopUp.Coc.List.Resume<tab><leader>clr :<c-u>CocListResume<cr>

anoremenu 1.130 PopUp.Coc.Next<tab><leader>cn :<c-u>CocNext<cr>
anoremenu 1.130 PopUp.Coc.Prev<tab><leader>cp :<c-u>CocPrev<cr>
