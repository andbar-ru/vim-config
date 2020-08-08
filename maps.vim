" Сделать пробел <leader>ом
nnoremap <Space> <nop>
let mapleader = " "
imap <s-space> <esc><space>

noremap <F2> :w<CR>
inoremap <F2> <Esc>:w<CR>
nnoremap <S-F2> :wa<CR>
nnoremap <C-S-F2> :wa<Bar>exe "mksession! " . v:this_session<CR>

if isdirectory($PLUGDIR . '/vim-mundo')
  nnoremap <silent> <F3> :MundoToggle<cr>
endif
if isdirectory($PLUGDIR . '/vim-indent-guides')
  noremap <A-F3> :IndentGuidesToggle<cr>
  inoremap <A-F3> <C-o>:IndentGuidesToggle<cr>
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

if isdirectory($PLUGDIR . '/bufexplorer')
  noremap <F5> :ToggleBufExplorer<CR>
  inoremap <F5> <Esc>:ToggleBufExplorer<CR>
  noremap <S-F5> :BufExplorerVerticalSplit<CR>
  inoremap <S-F5> <Esc>:BufExplorerVerticalSplit<CR>
endif

if isdirectory($PLUGDIR . '/nerdtree')
  noremap <F6> :NERDTreeToggle<CR>
  inoremap <F6> <C-o>:NERDTreeToggle<CR>
endif

if isdirectory($PLUGDIR . '/tagbar')
  noremap <F7> :TagbarToggle<CR>
  inoremap <F7> <C-o>:TagbarToggle<CR>
endif

" if isdirectory($PLUGDIR . '/ale')
"   noremap <S-F7> :ALEToggleBuffer<CR>
"   inoremap <S-F7> <C-o>:ALEToggleBuffer<CR>
" endif

noremap <F8> :syntax sync fromstart<CR>
inoremap <F8> <C-o>:syntax sync fromstart<CR>

if isdirectory($PLUGDIR . '/vim-gitgutter')
  noremap <F9> :GitGutterSignsToggle<CR>
  noremap <S-F9> :GitGutterLineHighlightsToggle<CR>
endif

noremap <S-F10> :ToggleMenu<CR>
inoremap <S-F10> <C-o>:ToggleMenu<CR>

" Перечитать настройки
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap <expr> zz match(getline('.'), '^\s*$')+1 ? '<esc>zzddO' : '<c-o>zz'

" Changing keyboard layout and go to alternate file.
inoremap <c-space> 
cnoremap <c-space> 
inoremap  <Esc>

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
imap <expr> <cr> pumvisible() ? '<c-y>' : '<cr><Plug>AutoPairsReturn'
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <END><CR>
inoremap <C-S-CR> <C-O>O
inoremap <c-cr> <cr><esc>yypks<tab>
" Отступы в режиме выделения с сохранением выделения
vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap <a->> :norm I <cr><esc>gv
vnoremap <a-<> :norm ^hx<cr>gv
nmap <a->> V<a->><esc>
nmap <a-<> V<a-<><esc>
imap <a-c-t> <esc><a->>la
imap <a-c-d> <esc><a-<>i

inoremap <C-S-Left> <Esc>vb
inoremap <C-S-Right> <Esc>lve
inoremap <silent> <c-right> <c-o>W
inoremap <silent> <c-left> <c-o>B
" Выделение последнего вставленного текста
nnoremap <expr> <A-v> '`[' . strpart(getregtype(), 0, 1) . '`]'
inoremap <expr> <A-v> '<Esc>`[' . strpart(getregtype(), 0, 1) . '`]'
" Select entire comment
nnoremap vac :call SelectComment()<cr>
" Выполнение команды для каждой выделенной строки
vnoremap <A-n> :norm<Space>
" Перемещение строк вверх и вниз (на предмет соответствия отступам см. ==)
" normal and visual modes
map <a-j> <Plug>MoveLinesDown
map <a-down> <Plug>MoveLinesDown
map <a-k> <Plug>MoveLinesUp
map <a-up> <Plug>MoveLinesUp
" insert mode
imap <a-j> <Plug>MoveLinesDown
imap <a-down> <Plug>MoveLinesDown
imap <a-k> <Plug>MoveLinesUp
imap <a-up> <Plug>MoveLinesUp
" Delete actions
inoremap <s-bs> <c-w>
cnoremap <s-bs> <c-w>
inoremap <s-del> <c-o>de
cnoremap <s-del> <s-right><c-w>
inoremap <c-bs> <esc>dBxs
inoremap <c-del> <esc>ldEs
inoremap <expr> <c-l> pumvisible() ? '<c-l>' : '<c-o>dd'
inoremap <c-s-del> <c-\><c-o>D
" Delete the closing tag because I sometimes forget to close opening tag with <a->>
" when I don't want vim-closetag to add closing tag automatically.
inoremap <a-<> <c-o>da>
nnoremap <del> "_d

" Undo
inoremap <C-z> <C-o>u

noremap <A-w> :setlocal wrap!<CR>

noremap <silent> <A-h> :set hlsearch!<CR>
noremap <silent> <S-A-h> :let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>' <Bar> set hls<CR>

noremap <A-0> :vertical resize 100<CR>
inoremap <A-0> <C-o>:vertical resize 100<CR>

" Reset mapping defined in system defaults.vim.
unmap Q
nnoremap Q @@
noremap Y y$
noremap <a-y> "+y
noremap <s-a-y> :%y+<cr>
vnoremap y y`]
vnoremap gy y
" Duplicate multiple lines. gPP (not 2P) to be able select pasted.
nnoremap yp ddgPP']

" Копировать строку и вставить после или вместо текущей.
nnoremap <silent> _ :<c-u>call CopyLine(v:count, 0, 0)<cr>
nnoremap <silent> g_ :<c-u>call CopyLine(v:count, 1, 0)<cr>
nnoremap <silent> \_ :<c-u>call CopyLine(v:count, 1, 1)<cr>

nnoremap <a-p> :set paste!<cr>
inoremap <a-p> <c-o>:set paste!<cr>
" Paste and fix the indent.
inoremap <c-v> <c-r><c-p>"
inoremap <MiddleMouse> <c-r><c-p>*
" Вставить и отформатировать.
nnoremap <expr> =p IsLineEmpty('.') ? '"_ddP=`]`]' : 'p=`]`]'
nnoremap <expr> =P IsLineEmpty('.') ? '"_ddP=`]`]' : 'P=`]`]'
" quickfix
nnoremap <silent> <expr> [q ':<c-u>' . (v:count ? v:count : '') . 'cprevious<cr>'
nnoremap <silent> <expr> ]q ':<c-u>' . (v:count ? v:count : '') . 'cnext<cr>'
nnoremap <silent> <expr> [Q ':<c-u>' . (v:count ? v:count : '') . 'cfirst<cr>'
nnoremap <silent> <expr> ]Q ':<c-u>' . (v:count ? v:count : '') . 'clast<cr>'
nnoremap <leader>qc :cclose<cr>
nnoremap <leader>qo :copen<cr>
" location-list
nnoremap <silent> <expr> [l ':<c-u>' . (v:count ? v:count : '') . 'lprevious<cr>'
nnoremap <silent> <expr> ]l ':<c-u>' . (v:count ? v:count : '') . 'lnext<cr>'
nnoremap <silent> <expr> [L ':<c-u>' . (v:count ? v:count : '') . 'lfirst<cr>'
nnoremap <silent> <expr> ]L ':<c-u>' . (v:count ? v:count : '') . 'llast<cr>'
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>lo :lopen<cr>
nnoremap <leader>cc :CloseListWindows<cr>

noremap <A-t> :tabnew<CR>
inoremap <A-t> <Esc>:tabnew<CR>
noremap <S-A-t> :exe "tabnew" . expand('%:p:h') . '/'<CR>
inoremap <S-A-t> <Esc>:exe "tabnew" . expand('%:p:h') . '/'<CR>
nmap <a-e> :execute "e" . expand('%:p:h') . '/'<cr>Pj
" inoremap <A-e> mapped by auto-pairs
noremap <A-c> :bw<CR>
inoremap <A-c> <Esc>:bw<CR>
noremap [t :tprevious<cr>
noremap ]t :tnext<cr>
noremap [b :bprevious<cr>
noremap ]b :bnext<cr>

" Detach buffer to another viewport
nnoremap <leader>os <c-o>:split #<cr>
nnoremap <leader>ov <c-o>:vsplit #<cr>
nnoremap <leader>ot <c-o>:tabe #<cr>

" Delete/change/yank relative to wrapper `(),[],{}`. 'c' = cover, since w (wrapper) is busy.
" functionName(arg1, arg2) => functionName()
nnoremap <silent> dic :call DCYInWrapper('d')<cr>
nnoremap <silent> cic :call DCYInWrapper('d')<cr>i
nnoremap <silent> yic :call DCYInWrapper('y')<cr>
" functionName(arg1, arg2) =>
nnoremap <silent> <expr> dac DCYAWrapper('d')
nnoremap <silent> <expr> cac DCYAWrapper('c')
nnoremap <silent> <expr> yac DCYAWrapper('y')
" functionName(arg1, arg2) => arg1, arg2. nmap because of using vim-surround.
nmap <silent> doc :call DCYOutWrapper('d')<cr>
nmap <silent> coc :call DCYOutWrapper('d')<cr>i
nmap <silent> yoc :call DCYOutWrapper('y')<cr>

noremap <A--> :ToggleDashInIskeyword<CR>
inoremap <A--> <C-o>:ToggleDashInIskeyword<CR>
" Удаление блока # begin #... # end #... (delete snippet)
noremap <leader>ds ?\v^\s*.+ begin #{40,}$<cr>v/\v^\s*.+ end #{40,}$<cr>Vd

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
" Повторить последний поиск, но слово целиком
nnoremap <a-?> /\<<c-r>/\><cr>

"Django, Jinja, Vue templates
inoremap <A-{> {{<space><space>}}<left><left><left>
inoremap <A-%> {%<space><space>%}<left><left><left>

" Commands
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

" list registers
noremap <leader>lr :reg 0123456789<cr>:put
noremap <leader>lR :reg<cr>:put
" list marks
noremap <leader>lm :marks abcdefghijklmnopqrstuvwxyz<cr>:'
noremap <leader>lM :marks<cr>:'
" list buffers
noremap <leader>lb :buffers<cr>:b

" Copy file absolute path to clipboard.
nnoremap <leader>y% :let @+=expand('%:p')<cr>
" Implement clipboard=autoselect in nvim.
if has('nvim')
  vmap <LeftRelease> "*ygv
endif

inoremap <expr> <tab> SuperTab()
" For coc.nvim mode
inoremap <expr> <c-tab> SuperTab()

"=================================================
" Commands
"=================================================
" a is 'action'
nnoremap <leader>afj :FormatJson<cr>
nnoremap <leader>ags :GetSyntaxGroupUnderCursor<cr>

"=================================================
" Plugin specific
"=================================================
if isdirectory($PLUGDIR . '/vim-fugitive')
  nmap <leader>gb :Gblame -w -M<cr>
  nmap <leader>gw :Gwrite <bar> if &diff <bar> quitall <bar> endif<cr>
endif

if isdirectory($PLUGDIR . '/vim-go')
  augroup goMaps
    autocmd FileType go nmap <leader>gb :<c-u>call BuildGoFiles()<cr>
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
    autocmd FileType go nmap <leader>gtf <Plug>(go-test-func)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>gi <Plug>(go-info)
    autocmd FileType go nmap <a-s-h> :GoSameIdsAutoToggle<cr>
  augroup end
endif

if isdirectory($PLUGDIR . '/neosnippet.vim')
  imap <c-j> <Plug>(neosnippet_expand_or_jump)
  smap <c-j> <Plug>(neosnippet_expand_or_jump)
  xmap <c-j> <Plug>(neosnippet_expand_target)
  nmap <leader>rs :call neosnippet#variables#set_snippets({})<cr>
endif

if isdirectory($PLUGDIR . '/tcomment_vim')
  nmap <A-/> <Plug>TComment_<c-_><c-_>
endif

if isdirectory($PLUGDIR . '/auto-pairs')
  " Дополнение к Fast Wrap <M-e>
  inoremap <a-$> <c-o>x<end><c-r>*
  inoremap <a-end> <c-o>x<end><c-r>*
  " Default <a-p> is for 'set paste!'
  let g:AutoPairsShortcutToggle = '<a-s-p>'
endif

if isdirectory($PLUGDIR . '/splitjoin.vim')
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_join_mapping = ''
  nmap <leader>sjs :SplitjoinSplit<cr>
  nmap <leader>sjj :SplitjoinJoin<cr>
endif
