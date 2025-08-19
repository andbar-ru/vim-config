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
if &diff
    set lines=100 columns=220
    winpos 333 0 " aligns in center
    set number
else
    set lines=23 columns=104 " 100 + line numbers gutter (4)
endif

" Vifm doesn't accept default TERM=linux
call setenv('TERM', 'xterm-256color')

runtime menu.vim
