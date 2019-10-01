" Trick to trigger tcomment's autoload.
let s:temp = g:tcomment#syntax#substitute
unlet s:temp

" Add `echom syntax_name` into function tcomment#syntax#GetSyntaxName to output syntax name.
let g:tcomment#syntax#substitute['foldBraces'] = {'sub': 'typescript'}
