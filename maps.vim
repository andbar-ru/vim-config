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

map <F5> :ToggleBufExplorer<CR>
imap <F5> <C-o>:ToggleBufExplorer<CR>
map <S-F5> :BufExplorerVerticalSplit<CR>
imap <S-F5> <C-o>:BufExplorerVerticalSplit<CR>
map <C-F5> :buffers<CR>:edit #
imap <C-F5> <Esc>:buffers<CR>:edit #

map <F6> :NERDTreeToggle<CR>
imap <F6> <C-o>:NERDTreeToggle<CR>

map <F7> :TagbarToggle<CR>
imap <F7> <C-o>:TagbarToggle<CR>
map <S-F7> :ALEToggleBuffer<CR>
imap <S-F7> <C-o>:ALEToggleBuffer<CR>

map <F8> :marks abcdefghijklmnopqrstuvwxyz<CR>:'
imap <F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyz<CR>:'
map <S-F8> :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'
imap <S-F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'
map <C-F8> :syntax sync fromstart<CR>
imap <C-F8> <C-o>:syntax sync fromstart<CR>

map <F9> :GitGutterSignsToggle<CR>
map <S-F9> :GitGutterLineHighlightsToggle<CR>

map <S-F10> :ToggleMenu<CR>
imap <S-F10> <C-o>:ToggleMenu<CR>

map <Esc> :nohlsearch<CR>

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
map <C-S-PageUp> :tabm -<CR>
imap <C-S-PageUp> <C-o>:tabm -<CR>
map <C-S-PageDown> :tabm +<CR>
imap <C-S-PageDown> <C-o>:tabm +<CR>

nnoremap <expr> <CR> (&ft == 'qf' ? '<CR>' : 'o<Esc>')
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
nnoremap <silent> <A-j> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m+<bar>let &fdm=prev_fdm<CR>
nnoremap <silent> <A-Down> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m+<bar>let &fdm=prev_fdm<CR>
nnoremap <silent> <A-k> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>
nnoremap <silent> <A-Up> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>
inoremap <silent> <A-j> <Esc>:let prev_fdm=&fdm<bar>set fdm=manual<bar>m+<bar>let &fdm=prev_fdm<CR>gi
inoremap <silent> <A-Down> <Esc>:let prev_fdm=&fdm<bar>set fdm=manual<bar>m+<bar>let &fdm=prev_fdm<CR>gi
inoremap <silent> <A-k> <Esc>:let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>gi
inoremap <silent> <A-Up> <Esc>:let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>gi
vnoremap <silent> <A-j> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m'>+<bar>let &fdm=prev_fdm<CR>gvgv
vnoremap <silent> <A-Down> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m'>+<bar>let &fdm=prev_fdm<CR>gvgv
vnoremap <silent> <A-k> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>gvgv
vnoremap <silent> <A-Up> :let prev_fdm=&fdm<bar>set fdm=manual<bar>m-2<bar>let &fdm=prev_fdm<CR>gvgv
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

map <A-h> :let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>' <Bar> set hlsearch<CR>
imap <A-h> <C-o>:let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>' <Bar> set hlsearch<CR>
nmap <Space> za
nmap <S-Space> zA

map <A-0> :vertical resize 100<CR>
imap <A-0> <C-o>:vertical resize 100<CR>

nnoremap Q @@
map Y y$
map <A-y> "+y
vmap gy y`]
map <S-A-y> :%y+<CR>
imap <C-v> <A-p><C-o>"*p<A-p><Esc>v']=']a
" Заменить выделенный текст скопированным (из-за set clipboard=unnamed)
vnoremap p ""p

map <A-t> :tabnew<CR>
imap <A-t> <Esc>:tabnew<CR>
map <S-A-t> :exe "tabnew" . expand('%:p:h') . '/'<CR>
imap <S-A-t> <Esc>:exe "tabnew" . expand('%:p:h') . '/'<CR>
map <A-e> :exe "e" . expand('%:p:h') . '/'<CR>
imap <A-e> <Esc>:exe "e" . expand('%:p:h') . '/'<CR>
map <A-c> :bw<CR>
imap <A-c> <Esc>:bw<CR>
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
" Удалить весь вызов функции:
map <Leader>daf vf(%d
" Удаление окружающих тегов
map <Leader>dt dit"_datP
map <A--> :ToggleDashInIskeyword<CR>
imap <A--> <C-o>:ToggleDashInIskeyword<CR>
" Удаление журналирующего блока
map <Leader>dl ?\v^\s*.+ begin #{40,}$<CR>v/\v^\s*.+ end #{40,}$<CR>Vd

"Поиск выделенного текста в соседних окнах
vmap <Leader>/h <C-w>h/<C-r>*<CR>
vmap <Leader>/j <C-w>j/<C-r>*<CR>
vmap <Leader>/k <C-w>k/<C-r>*<CR>
vmap <Leader>/l <C-w>l/<C-r>*<CR>

" Сколько раз слово под курсором встречается в файле
nmap <Leader>* *<C-o>:%s///n<CR><C-o>

"Django, Jinja, Vue templates
imap <A-{> {{<Space><Space><Left>
imap <A-%> {%%<Left><Space><Space><Left>

" Commands
map <Leader>gd :silent !gvimdiff -n % -c "Gvdiff"<CR>
map <A-d> :ClearAndSave<CR>

" Включение/выключение правого скроллбара
map <A-s> :ToggleScrollbar<CR>

" Установить ширину окна по самой длинной строке
map <A-l> :SetColumnsAsLongestLine<CR>


" Plugins
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" fugitive
map <Leader>gb :Gblame<CR>

" vim-bookmarks
map <Leader>mm <Plug>BookmarkToggle
map <Leader>mi <Plug>BookmarkAnnotate
map <Leader>mn <Plug>BookmarkNext
map <Leader>mp <Plug>BookmarkPrev
map <Leader>ma <Plug>BookmarkShowAll
map <Leader>mc <Plug>BookmarkClear
map <Leader>mx <Plug>BookmarkClearAll
map <Leader>ms <Plug>BookmarkSave
map <Leader>ml <Plug>BookmarkLoad
map <Leader>mkk <Plug>BookmarkMoveUp
map <Leader>mjj <Plug>BookmarkMoveDown
