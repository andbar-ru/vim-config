command! ClearAllRegs for i in range(34, 122) | silent! call setreg(nr2char(i), []) | endfor
command! ClearAndSave :execute "normal gg0dG" | :update
command! ConvertUnicodeEscapeSequences :%s/\v\\u[0-9a-f]{4}/\=eval('"'.submatch(0).'"')
command! FormatJson :execute "%!python3 -c 'import sys,json; print(json.dumps(json.loads(sys.stdin.read()), ensure_ascii=False, indent=2, sort_keys=True))'" | normal zR
command! FormatXml :%!xmllint -format -
command! HiGroupUnderCursor :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
command! RefineChessMoves :silent s/ {[^}]*}//<bar>s/\(\d\.\)\@<= //
command! RemoveTrailingSpaces :%s/\s\+$//
command! SetColumnsAsLongestLine :silent let &columns = max(map(getline(1, '$'), 'len(v:val)'))
command! SyntaxSync :syntax sync fromstart
command! ToggleDashInIskeyword if &iskeyword !~ 45 | setlocal iskeyword+=45 | else | setlocal iskeyword-=45 | endif
command! ToggleMenu if &guioptions=~"m" | set guioptions-=m | else | set guioptions+=m | endif
command! ToggleScrollbar if &guioptions=~"r" | set guioptions-=r | else | set guioptions+=r | endif
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

if isdirectory($VIMRCDIR . '/plugged/vim-go')
  augroup goCommands
    autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  augroup end
endif
