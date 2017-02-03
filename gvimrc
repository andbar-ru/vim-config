set guifont=Dejavu\ Sans\ Mono\ 8
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
    set lines=23 columns=80
else
    set lines=23 columns=100
endif
