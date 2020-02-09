if has('win32')
    set guifont=Consolas:h8
else
    set guifont=Dejavu\ Sans\ Mono\ 7
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
if g:hostname == 'asus'
    set lines=23 columns=100
    set linespace=-1
else
    set lines=23 columns=104
endif

runtime menu.vim
