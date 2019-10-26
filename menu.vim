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

if isdirectory($PLUGDIR . '/coc.nvim')
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
endif

