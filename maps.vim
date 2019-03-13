" Сделать пробел <leader>ом
nnoremap <Space> <nop>
let mapleader = " "

noremap <silent> <F2> :silent update<CR>
inoremap <silent> <F2> <Esc>:silent update<CR>
nnoremap <S-F2> :wa<CR>
nnoremap <C-S-F2> :wa<Bar>exe "mksession! " . v:this_session<CR>

" Переключение языка и переход к парному буферу
inoremap <F3> 
cnoremap <F3> 
inoremap  <Esc>
if isdirectory($VIMRCDIR . '/plugged/vim-indent-guides')
  noremap <A-F3> <leader>ig
  inoremap <A-F3> <C-o><leader>ig
endif
" Подсветка непечатаемых символов
noremap <S-F3> :set list!<CR>
inoremap <S-F3> <C-o>:set list!<CR>
" Подсветка пробелов в конце строк
noremap <C-S-F3> :call ToggleHiTrail()<CR>
inoremap <C-S-F3> <C-o>:call ToggleHiTrail()<CR>

" Нумерация
noremap <silent> <F4> :set nu!<CR>
inoremap <silent> <F4> <C-o>:set nu!<CR>
noremap <silent> <S-F4> :set relativenumber!<CR>
inoremap <silent> <S-F4> <C-o>:set relativenumber!<CR>

if isdirectory($VIMRCDIR . '/plugged/bufexplorer')
  noremap <F5> :ToggleBufExplorer<CR>
  inoremap <F5> <Esc>:ToggleBufExplorer<CR>
  noremap <S-F5> :BufExplorerVerticalSplit<CR>
  inoremap <S-F5> <Esc>:BufExplorerVerticalSplit<CR>
endif
noremap <C-F5> :buffers<CR>:b 
inoremap <C-F5> <Esc>:buffers<CR>:b 

if isdirectory($VIMRCDIR . '/plugged/nerdtree')
  noremap <F6> :NERDTreeToggle<CR>
  inoremap <F6> <C-o>:NERDTreeToggle<CR>
endif

if isdirectory($VIMRCDIR . '/plugged/tagbar')
  noremap <F7> :TagbarToggle<CR>
  inoremap <F7> <C-o>:TagbarToggle<CR>
endif
if isdirectory($VIMRCDIR . '/plugged/ale')
  noremap <S-F7> :ALEToggleBuffer<CR>
  inoremap <S-F7> <C-o>:ALEToggleBuffer<CR>
endif

noremap <F8> :marks abcdefghijklmnopqrstuvwxyz<CR>:'
inoremap <F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyz<CR>:'
noremap <S-F8> :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'
inoremap <S-F8>   <Esc>:marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:'
noremap <C-F8> :syntax sync fromstart<CR>
inoremap <C-F8> <C-o>:syntax sync fromstart<CR>

if isdirectory($VIMRCDIR . '/plugged/vim-gitgutter')
  noremap <F9> :GitGutterSignsToggle<CR>
  noremap <S-F9> :GitGutterLineHighlightsToggle<CR>
endif

noremap <S-F10> :ToggleMenu<CR>
inoremap <S-F10> <C-o>:ToggleMenu<CR>

" Перечитать настройки
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap <expr> zz match(getline('.'), '^\s*$')+1 ? '<esc>zzddO' : '<c-o>zz'

" Управление окнами, буферами, вкладками
" В перечислении включены только операции, которые имеет смысл выполнять неоднократно 
" Остальные через <C-W>char
for c in ["h","j","k","l","s","v","c","p","r","+","-"]
    exe "noremap <C-A-" . c . "> <C-w>" . c
    exe "inoremap <C-A-" . c . "> <Esc><C-w>" . c
endfor
noremap <Char-172> <C-w><
inoremap <Char-172> <Esc><C-w><
noremap <Char-174> <C-w>>
inoremap <Char-174> <Esc><C-w>>
for c in ["1","2","3","4","5","6","7","8"]
    exe "noremap <A-" . c . "> " . c . "gt"
    exe "inoremap <A-" . c . "> <Esc>" . c . "gt"
endfor
noremap <A-9> :tablast<CR>
inoremap <A-9> <Esc>:tablast<CR>
noremap <C-S-PageUp> :tabm -<CR>
inoremap <C-S-PageUp> <C-o>:tabm -<CR>
noremap <C-S-PageDown> :tabm +<CR>
inoremap <C-S-PageDown> <C-o>:tabm +<CR>

nnoremap <expr> <CR> (&ft == 'qf' ? '<CR>' : 'o<Esc>')
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <END><CR>
inoremap <C-S-CR> <C-O>O
inoremap <C-CR> <CR><CR><UP><TAB>
inoremap <s-tab> <esc>ddO
" Отступы в режиме выделения с сохранением выделения
vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap <a->> :norm I <cr><esc>gv
vnoremap <a-<> :norm ^hx<cr>gv
nmap <a->> V<a->><esc>
nmap <a-<> V<a-<><esc>
imap <a->> <esc><a->>la
imap <a-<> <esc><a-<>i

inoremap <C-S-Left> <Esc>vb
inoremap <C-S-Right> <Esc>lve
inoremap <silent> <C-Right> <C-o>E
inoremap <silent> <C-Left> <C-o>B
" Выделение последнего вставленного текста
nnoremap <expr> <A-v> '`[' . strpart(getregtype(), 0, 1) . '`]'
inoremap <expr> <A-v> '<Esc>`[' . strpart(getregtype(), 0, 1) . '`]'
" Select entire comment
nnoremap vac :call SelectComment()<cr>
" Выполнение команды для каждой выделенной строки
vnoremap <A-n> :norm<Space>
" Перемещение строк вверх и вниз (на предмет соответствия отступам см. ==)
nnoremap <A-j> :call MoveLines('down', 'n')<CR>
nnoremap <A-Down> :call MoveLines('down', 'n')<CR>
nnoremap <A-k> :call MoveLines('up', 'n')<CR>
nnoremap <A-Up> :call MoveLines('up', 'n')<CR>
inoremap <A-j> <C-o>:call MoveLines('down', 'i')<CR>
inoremap <A-Down> <C-o>:call MoveLines('down', 'i')<CR>
inoremap <A-k> <C-o>:call MoveLines('up', 'i')<CR>
inoremap <A-Up> <C-o>:call MoveLines('up', 'i')<CR>
vnoremap <A-j> :call MoveLines('down', 'v')<CR>
vnoremap <A-Down> :call MoveLines('down', 'v')<CR>
vnoremap <A-k> :call MoveLines('up', 'v')<CR>
vnoremap <A-Up> :call MoveLines('up', 'v')<CR>
" Удаление
inoremap <S-BS> <C-W>
cnoremap <S-BS> <C-W>
inoremap <S-Del> <C-o>de
cnoremap <S-Del> <S-Right><C-W>
inoremap <C-BS> <Esc>dBxs
inoremap <C-Del> <Esc>ldEs
inoremap <C-l> <C-o>dd
inoremap <C-S-Del> <c-\><c-o>D
inoremap <C-z> <C-o>u

inoremap <MiddleMouse> <LeftMouse><MiddleMouse>

noremap <A-w> :set wrap!<CR>

noremap <silent> <A-h> :set hlsearch!<CR>
inoremap <silent> <A-h> <C-o>:set hlsearch!<CR>
noremap <silent> <S-A-h> :let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>' <Bar> set hls<CR>
inoremap <silent> <S-A-h> <C-o>:let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>' <Bar> set hls<CR>

noremap <A-0> :vertical resize 100<CR>
inoremap <A-0> <C-o>:vertical resize 100<CR>

nnoremap Q @@
noremap Y y$
noremap <A-y> "+y
noremap <S-A-y> :%y+<CR>
vnoremap y y`]
vnoremap gy y
nnoremap _ ggyy``p==
nnoremap g_ ggyy``P==
inoremap <C-v> <A-p><C-o>"*p<A-p><Esc>v']=']a
" Заменить выделенный текст скопированным (из-за set clipboard=unnamed)
vnoremap p ""p

noremap <A-t> :tabnew<CR>
inoremap <A-t> <Esc>:tabnew<CR>
noremap <S-A-t> :exe "tabnew" . expand('%:p:h') . '/'<CR>
inoremap <S-A-t> <Esc>:exe "tabnew" . expand('%:p:h') . '/'<CR>
noremap <A-e> :exe "e" . expand('%:p:h') . '/'<CR>
" inoremap <A-e> mapped by auto-pairs
noremap <A-c> :bw<CR>
inoremap <A-c> <Esc>:bw<CR>
noremap <S-F11> :tabprevious<CR>
noremap <S-F12> :tabnext<CR>
inoremap <S-F11> <Esc>:tabprevious<CR>i
inoremap <S-F12> <Esc>:tabnext<CR>i
noremap <F11> :bprevious<CR>
noremap <F12> :bnext<CR>
inoremap <F11> <Esc>:bprevious<CR>i
inoremap <F12> <Esc>:bnext<CR>i

" Удаление обрачивания в функцию: func(smth) -> smth
map <leader>df dt(ds(
" Удалить весь вызов функции:
noremap <leader>daf vf(%d
" Удаление окружающих тегов
noremap <leader>dt dit"_datP
noremap <A--> :ToggleDashInIskeyword<CR>
inoremap <A--> <C-o>:ToggleDashInIskeyword<CR>
" Удаление журналирующего блока
noremap <leader>dl ?\v^\s*.+ begin #{40,}$<CR>v/\v^\s*.+ end #{40,}$<CR>Vd
" Удаление оборачивающего блока
nmap <leader>dw [-jd]-]pkdk

" Поиск
"Поиск слова под курсором в соседних окнах
nnoremap <leader>/h yiw<C-w>h/<C-r>"<CR>
nnoremap <leader>/j yiw<C-w>j/<C-r>"<CR>
nnoremap <leader>/k yiw<C-w>k/<C-r>"<CR>
nnoremap <leader>/l yiw<C-w>l/<C-r>"<CR>
"Поиск выделенного текста в соседних окнах
vnoremap <leader>/h y<C-w>h/<C-r>"<CR>
vnoremap <leader>/j y<C-w>j/<C-r>"<CR>
vnoremap <leader>/k y<C-w>k/<C-r>"<CR>
vnoremap <leader>/l y<C-w>l/<C-r>"<CR>
" Сколько раз слово под курсором встречается в файле
nnoremap <leader>* *<C-o>:%s///n<CR>
" Следующее/предыдущее вхождение выделенного фрагмента (в пределах строки)
" (http://vim.wikia.com/wiki/Search_for_visually_selected_text)
vnoremap <expr> <leader>8 'y/\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader>* 'y/\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader>3 'y?\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader># 'y?\V' . escape(@",'\') . '<cr>'
" Последний поиск, но слово целиком
nnoremap <a-?> /\<<c-r>/\><cr>

"Django, Jinja, Vue templates
inoremap <A-{> {{<space><space>}}<left><left><left>
inoremap <A-%> {%<space><space>%}<left><left><left>

" Commands
noremap <leader>gd :silent !gvimdiff -n % -c "Gvdiff"<CR>
noremap <A-d> :ClearAndSave<CR>

" Включение/выключение правого скроллбара
noremap <A-s> :ToggleScrollbar<CR>

" Установить ширину окна по самой длинной строке
noremap <A-l> :SetColumnsAsLongestLine<CR>

noremap <leader>dg :diffget<CR>

" Навигация
nnoremap <up> gk
nnoremap <down> gj
" Добавить позицию в jumplist при навигации с помощью мыши
nnoremap <LeftMouse> m'<LeftMouse>
" Smart Home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-o><Home>
nnoremap <silent> [gi :call GoToLineWithWordAndMininalIndent()<CR>

" Swap words (cursor on delimiter)
nnoremap <leader>sw v?\w<CR>bo/\w<CR>e:s/\%V\(\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/g<CR>``
nnoremap <leader>sW v?\S<CR>Bo/\S<CR>E:s/\%V\(\S\+\)\(\s\+\)\(\S\+\)/\3\2\1/g<CR>``
vnoremap <leader>sw "1d"1db"1de"2P"4p"3p
vnoremap <leader>sW "1d"1dB"1dE"2P"4p"3p

cnoremap <A-,> \<\><left><left>

nnoremap <leader>snm :set nomodifiable<cr>
nnoremap <leader>sm :set modifiable<cr>

" Commands
nnoremap <leader>cfj :FormatJson<cr>

" Plugins
if isdirectory($VIMRCDIR . '/plugged/vim-fugitive')
  noremap <leader>gb :Gblame<CR>
endif

if isdirectory($VIMRCDIR . '/plugged/vim-bookmarks')
  nmap <leader>mm <Plug>BookmarkToggle
  nmap <leader>mi <Plug>BookmarkAnnotate
  nmap <leader>mn <Plug>BookmarkNext
  nmap <leader>mp <Plug>BookmarkPrev
  nmap <leader>ma <Plug>BookmarkShowAll
  nmap <leader>mc <Plug>BookmarkClear
  nmap <leader>mx <Plug>BookmarkClearAll
  nmap <leader>ms <Plug>BookmarkSave
  nmap <leader>ml <Plug>BookmarkLoad
  nmap <leader>mkk <Plug>BookmarkMoveUp
  nmap <leader>mjj <Plug>BookmarkMoveDown
endif

if isdirectory($VIMRCDIR . '/plugged/neosnippet')
  imap <C-j> <Plug>(neosnippet_expand_or_jump)
  smap <C-j> <Plug>(neosnippet_expand_or_jump)
  xmap <C-j> <Plug>(neosnippet_expand_target)
endif

if isdirectory($VIMRCDIR . '/plugged/tcomment_vim')
  nmap <A-/> <Plug>TComment_<c-_><c-_>
endif

if isdirectory($VIMRCDIR . '/plugged/auto-pairs')
  " Дополнение к Fast Wrap <M-e>
  inoremap <S-A-e> <c-o>x<end><c-r>*
endif
