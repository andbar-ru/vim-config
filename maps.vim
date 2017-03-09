map <silent> <F2> :silent update<CR>
imap <silent> <F2> <C-o>:silent update<CR>
nmap <S-F2> :wa<Bar>exe "mksession! " . v:this_session<CR>

" Переключение языка и переход к парному буферу
inoremap <F3> 
cnoremap <F3> 
inoremap  <C-o>
" Indent guides
map <A-F3> <Leader>ig
imap <A-F3> <C-o><Leader>ig
" Подсветка непечатаемых символов
map <S-F3> :set list!<CR>
imap <S-F3> <C-o>:set list!<CR>
" Подсветка пробелов в конце строк
map <C-S-F3> :call ToggleHiTrail()<CR>
imap <C-S-F3> <C-o>:call ToggleHiTrail()<CR>

" Нумерация
map <silent> <F4> :set nu!<CR>
imap <silent> <F4> <C-o>:set nu!<CR>
map <silent> <S-F4> :set relativenumber!<CR>
imap <silent> <S-F4> <C-o>:set relativenumber!<CR>

map <F5> :BufExplorer<CR>
imap <F5> <C-o>:BufExplorer<CR>
map <S-F5> :buffers<CR>:edit #
imap <S-F5> <Esc>:buffers<CR>:edit #

map <F6> :NERDTreeToggle<CR>
imap <F6> <C-o>:NERDTreeToggle<CR>

map <F7> :TagbarToggle<CR>
imap <F7> <C-o>:TagbarToggle<CR>

map <F8> :marks abcdefghijklmnopqrstuvwxyz<CR>:'
imap <F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyz<CR>:'
map <S-F8> :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'
imap <S-F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'

map <F9> :GitGutterSignsToggle<CR>
map <S-F9> :GitGutterLineHighlightsToggle<CR>

map <S-F10> :call Menu()<CR>
imap <S-F10> <C-o>:call Menu()<CR>


" Управление окнами, буферами, вкладками
" В перечислении включены только операции, которые имеет смысл выполнять неоднократно 
" Остальные через <C-W>char
for c in ["h","j","k","l","s","v","c","p","r","+","-"]
    exe "map <C-A-" . c . "> <C-w>" . c
    exe "imap <C-A-" . c . "> <Esc><C-w>" . c
endfor
map <Char-172> <C-w><
imap <Char-172> <Esc><C-w><
map <Char-174> <C-w>>
imap <Char-174> <Esc><C-w>>
for c in ["1","2","3","4","5","6","7","8"]
    exe "map <A-" . c . "> " . c . "gt"
    exe "imap <A-" . c . "> <Esc>" . c . "gt"
endfor
map <A-9> :tablast<CR>
imap <A-9> <Esc>:tablast<CR>

nmap <CR> o<Esc>
nmap <S-CR> O<Esc>
imap <S-CR> <END><CR>
imap <C-S-CR> <C-O>O
imap <C-CR> <CR><CR><UP><TAB>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <Space> :norm I <CR><Esc>gv
vnoremap <S-Space> :norm ^hx<CR>gv
imap <C-S-Left> <Esc>vb
imap <C-S-Right> <Esc>lve
inoremap <silent> <C-Right> <C-o>E
inoremap <silent> <C-Left> <C-o>B
" Выделение последнего вставленного текста
nnoremap <expr> <A-v> '`[' . strpart(getregtype(), 0, 1) . '`]'
inoremap <expr> <A-v> '<Esc>`[' . strpart(getregtype(), 0, 1) . '`]'
" Выполнение команды для каждой выделенной строки
vnoremap <A-n> :norm<Space>
" Перемещение строк вверх и вниз (на предмет соответствия отступам см. ==)
nnoremap <A-j> :m+<CR>
nnoremap <A-Down> :m+<CR>
nnoremap <A-k> :m-2<CR>
nnoremap <A-Up> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>gi
inoremap <A-Down> <Esc>:m+<CR>gi
inoremap <A-k> <Esc>:m-2<CR>gi
inoremap <A-Up> <Esc>:m-2<CR>gi
vnoremap <A-j> :m'>+<CR>gvgv
vnoremap <A-Down> :m'>+<CR>gvgv
vnoremap <A-k> :m-2<CR>gvgv
vnoremap <A-Up> :m-2<CR>gvgv
" Удаление
inoremap <S-BS> <C-W>
cnoremap <S-BS> <C-W>
inoremap <S-Del> <C-o>de
cnoremap <S-Del> <S-Right><C-W>
inoremap <C-BS> <Esc>dBxs
inoremap <C-Del> <Esc>ldEs
imap <C-l> <C-o>dd
imap <C-S-Del> <C-o>D
imap <C-z> <C-o>u

inoremap <MiddleMouse> <LeftMouse><MiddleMouse>

map <A-w> :set wrap!<CR>

map <A-h> :set hlsearch!<CR>
imap <A-h> <C-o>:set hlsearch!<CR>
nmap <Space> za
nmap <S-Space> zA

map <A-0> :vertical resize 100<CR>
imap <A-0> <C-o>:vertical resize 100<CR>

map Y y$
map <A-y> "+y
vmap gy y`]
imap <A-w> <Esc>yvb`]a
imap <S-A-w> <Esc>yvB`]a
imap <C-v> <A-p><C-o>"*p<A-p><Esc>v']=']a

map <A-t> :tabnew<CR>
imap <A-t> <Esc>:tabnew<CR>
map <S-F11> :tabprevious<CR>
map <S-F12> :tabnext<CR>
imap <S-F11> <Esc>:tabprevious<CR>i
imap <S-F12> <Esc>:tabnext<CR>i
map <F11> :bprevious<CR>
map <F12> :bNext<CR>
imap <F11> <Esc>:bprevious<CR>i
imap <F12> <Esc>:bNext<CR>i

" Удаление обрачивания в функцию: func(smth) -> smth
map <Leader>df dt(ds(
" Удаление окружающих тегов
map <Leader>dt dit"_datP
map <A--> :ToggleDashInIskeyword<CR>

"Поиск выделенного текста в соседних окнах
vmap <Leader>/h <C-w>h/<C-r>*<CR>
vmap <Leader>/j <C-w>j/<C-r>*<CR>
vmap <Leader>/k <C-w>k/<C-r>*<CR>
vmap <Leader>/l <C-w>l/<C-r>*<CR>

" Сколько раз слово под курсором встречается в файле
nmap <Leader>* *<C-o>:%s///n<CR><C-o>

"Django templates
imap <A-{> {{<Space>
imap <A-%> {%%<Left><Space><Space><Left>

" Commands
map <Leader>gd :silent !gvimdiff -n % -c "Gvdiff"<CR>
map <A-d> :ClearAndSave<CR>

" Plugins
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" fugitive
map <Leader>gb :Gblame<CR>A
