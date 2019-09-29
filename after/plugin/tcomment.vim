" First we must trigger autoload/tcomment.vim to be able to modify global variable.
let s:temp = g:tcomment#syntax_substitute
let g:tcomment#syntax_substitute['vue_typescript'] = {'sub': 'typescript'}
unlet s:temp
