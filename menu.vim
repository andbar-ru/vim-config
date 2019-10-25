an 1.105 PopUp.-SEP3- <Nop>

anoremenu 1.110 PopUp.Close\ Tab :tabclose<CR>

an 1.115 PopUp.-SEP4- <Nop>

let lines = readfile($VIMRCDIR . '/commands.vim')
for line in lines
  let items = split(line)
  if len(items) && items[0] == 'command!'
    let command = items[1]
    execute 'anoremenu 1.120 PopUp.Commands.' . command . ' :' . command . '<cr>'
  endif
endfor

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
anoremenu 1.130 PopUp.Coc.FormatSelected :<c-u>call CocActionAsync('formatSelected', visualmode())<cr>
" <Plug>(coc-format)
anoremenu 1.130 PopUp.Coc.Format :<c-u>call CocActionAsync('format')<cr>

