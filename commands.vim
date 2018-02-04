command! ConvertUnicodeEscapeSequences :%s/\v\\u[0-9a-f]{4}/\=eval('"'.submatch(0).'"')
command! RemoveTrailingSpaces :%s/\s\+$//
command! ReloadSyntax :syntax sync fromstart
command! HiGroupUnderCursor :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

command! FormatXml :%!xmllint -format -
command! FormatJson :%!python -m json.tool
command! RefineChessMoves :silent s/ {[^}]*}//<bar>s/\(\d\.\)\@<= //

command! ToggleDashInIskeyword if &iskeyword !~ 45 | setlocal iskeyword+=45 | else | setlocal iskeyword-=45 | endif
command! ToggleMenu if &guioptions=~"m" | set guioptions-=m | else | set guioptions+=m | endif
command! ToggleScrollbar if &guioptions=~"r" | set guioptions-=r | else | set guioptions+=r | endif
command! ClearAndSave :execute "normal gg0dG" | :update
command! SyntaxSync :syntax sync fromstart
command! SetColumnsAsLongestLine :silent let &columns = max(map(getline(1, '$'), 'len(v:val)'))
command! ClearAllRegs for i in range(34, 122) | silent! call setreg(nr2char(i), []) | endfor
