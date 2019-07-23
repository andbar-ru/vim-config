if has('win32')
    set guifont=Consolas:h8
else
    set guifont=Dejavu\ Sans\ Mono\ 8
endif
set guioptions-=m
set guioptions-=T
"Disable scrollbars
set guioptions-=L
set guioptions-=r
set guicursor+=a:blinkon0

set mousefocus
set mousemodel=popup

" Initial size of gvim window
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == 'asus'
    set lines=25 columns=100
    set gfn=Dejavu\ Sans\ Mono\ 7.5
else
    set lines=23 columns=104
endif

runtime menu.vim
