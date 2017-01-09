" needed because auto-pairs remaps letters х, ъ, э
function RusKeymap()
    setlocal keymap=russian-jcukenwin
    setlocal iminsert=0
    setlocal imsearch=-1
endfunction
autocmd BufEnter * :call RusKeymap()
