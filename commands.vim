command ConvertUnicodeEscapeSequences :%s/\v\\u[0-9a-f]{4}/\=eval('"'.submatch(0).'"')
command RemoveTrailingSpaces :%s/\s\+$//
command ReloadSyntax :syntax sync fromstart
command HiGroupUnderCursor :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
command XmlFormat :%!xmllint -format -
command ToggleDashInIskeyword if &iskeyword !~ 45 | set iskeyword+=45 | else | set iskeyword-=45 | endif
command ClearAndSave :execute "normal gg0dG" | :w
