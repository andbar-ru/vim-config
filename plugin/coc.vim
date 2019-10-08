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
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gd <plug>(coc-definition)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gy <plug>(coc-type-definition)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gi <plug>(coc-implementation)
  autocmd Filetype javascript,json,typescript,vue nmap <silent> <leader>gr <plug>(coc-references)
  autocmd Filetype javascript,json,typescript,vue nnoremap <silent> K :call <sid>show_documentation()<cr>
  autocmd Filetype javascript,json,typescript,vue nmap <leader>rn <plug>(coc-rename)
  " Format selected region
  autocmd Filetype javascript,json,typescript,vue xmap <leader>f <plug>(coc-format-selected)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>f <plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leaderaap` for current paragraph
  autocmd Filetype javascript,json,typescript,vue xmap <leader>a <plug>(coc-action-selected)
  autocmd Filetype javascript,json,typescript,vue nmap <leader>a <plug>(coc-action-selected)
  " do codeAction of current line
  autocmd Filetype javascript,json,typescript,vue nmap <leader>ac <plug>(coc-codeaction)
  " Fix autofix problem of current line
  autocmd Filetype javascript,json,typescript,vue nmap <leader>qf <plug>(coc-fix-current)
  " Mappings for function text object, requires document symbols feature of languageserver.
  autocmd Filetype javascript,json,typescript,vue xmap <leader>if <plug>(coc-funcobj-i)
  autocmd Filetype javascript,json,typescript,vue xmap <leader>af <plug>(coc-funcobj-a)
  autocmd Filetype javascript,json,typescript,vue omap <leader>if <plug>(coc-funcobj-i)
  autocmd Filetype javascript,json,typescript,vue omap <leader>af <plug>(coc-funcobj-a)
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
