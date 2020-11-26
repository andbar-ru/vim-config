command! ClearAllRegs for i in range(34, 122) | silent! call setreg(nr2char(i), []) | endfor
command! ClearAndSave :execute "normal gg0dG" | :silent! update
command! ConvertUnicodeEscapeSequences :%s/\v\\u[0-9a-f]{4}/\=eval('"'.submatch(0).'"')
command! FormatJson :execute "%!python3 -c 'import sys,json; print(json.dumps(json.loads(sys.stdin.read()), ensure_ascii=False, indent=2, sort_keys=True))'" | normal zR
command! MinifyJson :execute "%!python3 -c 'import sys,json; print(json.dumps(json.loads(sys.stdin.read()), ensure_ascii=False))'"
command! FormatXml :%!xmllint -format -
command! GetSyntaxGroupUnderCursor :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
command! RefineChessMoves :silent s/ {[^}]*}//<bar>s/\(\d\.\)\@<= //
command! RemoveTrailingSpaces :%s/\s\+$//e
command! SetColumnsAsLongestLine :silent let &columns = max(map(getline(1, '$'), 'len(v:val)'))
command! SyntaxSync :syntax sync fromstart
command! ToggleDashInIskeyword if &iskeyword !~ 45 | setlocal iskeyword+=45 | else | setlocal iskeyword-=45 | endif
command! ToggleMenu if &guioptions=~"m" | set guioptions-=m | else | set guioptions+=m | endif
command! ToggleScrollbar if &guioptions=~"r" | set guioptions-=r | else | set guioptions+=r | endif
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
command! CloseListWindows windo if &buftype == 'quickfix' | lclose | cclose | endif
command! DeleteAllSnippets :call DeleteAllSnippets()

" if isdirectory($PLUGDIR . '/vim-go')
"   augroup goCommands
"     autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"     autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"     autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"     autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"   augroup end
" endif

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
