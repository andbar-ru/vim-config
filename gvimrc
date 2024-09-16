if has('win32')
    set guifont=Consolas:h8
else
    set guifont=Input\ Mono\ Narrow\ 8
    set linespace=1 " for this font only
endif
set guioptions-=m
set guioptions-=T
"Disable scrollbars
set guioptions-=L
set guioptions-=r
set guicursor+=a:blinkon0

set mousemodel=popup

" Initial size of gvim window
if g:hostname == 'asus'
    set lines=23 columns=100
elseif &diff
    set lines=100 columns=220
    winpos 333 16 " aligns in center if a screen size is 1920x1200
    set number
else
    set lines=23 columns=104
endif

runtime menu.vim
