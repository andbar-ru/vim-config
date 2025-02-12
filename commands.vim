command! ClearAllRegs for i in range(34, 122) | silent! call setreg(nr2char(i), []) | endfor
command! ClearAndSave :execute "normal gg0dG" | :silent! update
command! ConvertUnicodeEscapeSequences :%s/\v\\u[0-9a-f]{4}/\=eval('"'.submatch(0).'"')
command! FormatJson :execute "%!jq" | normal zR
command! FormatJsonSort :execute "%!jq -S" | normal zR
command! MinifyJson :execute "%!jq -c"
command! FormatXml :%!xmllint -format -
command! GetSyntaxGroupUnderCursor :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
command! RefineChessMoves :silent s/ {[^}]*}//<bar>s/\(\d\.\)\@<= //
command! RemoveTrailingSpaces :%s/\s\+$//e
command! SetColumnsAsLongestLine :silent let &columns = max(map(getline(1, '$'), 'len(v:val)'))
command! SyntaxSync :syntax sync fromstart
command! ToggleDashInIskeyword if &iskeyword !~ 45 | setlocal iskeyword+=45 | echom "iskeyword += '-'" | else | setlocal iskeyword-=45 | echom "iskeyword -= '-'" | endif
command! ToggleMenu if &guioptions=~"m" | set guioptions-=m | else | set guioptions+=m | endif
command! ToggleScrollbar if &guioptions=~"r" | set guioptions-=r | else | set guioptions+=r | endif
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
command! CloseListWindows windo if &buftype == 'quickfix' | lclose | cclose | endif
command! DeleteAllSnippets :call DeleteAllSnippets()
command! -nargs=1 GoSavNewMain :call GoSavNewMain("<args>")

if isdirectory($PLUGDIR . '/fzf.vim')
  " Do not show preview by default:
  " : fzf#vim#with_preview('right:50%:hidden', '?'),
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --smart-case ' . <q-args> . ' ' . system('git rev-parse --show-toplevel'), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%', '?'),
        \   <bang>0
        \ )
endif
