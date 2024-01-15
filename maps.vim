" Сделать пробел <leader>ом
nnoremap <Space> <nop>
let mapleader = " "

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

noremap <F8> :syntax sync fromstart<cr>
inoremap <F8> <c-o>:syntax sync fromstart<cr>
noremap <expr> <S-F8> &syntax == 'OFF' ? ':setlocal syntax=ON<cr>' : ':setlocal syntax=OFF<cr>'

noremap <S-F10> :ToggleMenu<CR>
inoremap <S-F10> <C-o>:ToggleMenu<CR>

nmap <F11> <plug>ToggleSearchMode

" Перечитать настройки
nnoremap <leader>sv :source $MYVIMRC<cr>

" Redraw line at center of window in insert mode. Discarded 'zz' because of confusing when typing 'я'.
inoremap <a-z> <c-o>zz

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

" vim cmdline window has ft='vim', and <cr> in it executes the command-line under the cursor.
nnoremap <expr> <cr> (index(['qf', 'vim'], &ft) >= 0 ? '<CR>' : 'o<Esc>')

imap <expr> <cr> pumvisible() ? '<c-y>' : '<cr><Plug>AutoPairsReturn'
nnoremap <S-CR> O<Esc>
inoremap <S-CR> <END><CR>
inoremap <C-S-CR> <C-O>O
inoremap <c-cr> <cr><esc>yypkC<tab>
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
" Select entire comment (vac is occupied by "select a class")
nnoremap vam :call SelectComment()<cr>
" Toggle block comment manually
vnoremap <leader>bc :<c-u>call ToggleBlockComment(1)<cr>
nnoremap <leader>bc :call ToggleBlockComment(0)<cr>
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
inoremap <c-s-del> <c-\><c-o>D
" Delete the closing tag because I sometimes forget to close opening tag with <a->>
" when I don't want vim-closetag to add closing tag automatically.
inoremap <a-<> <c-o>da>
noremap <del> "_d
noremap <c-del> "_c

" Undo
inoremap <C-z> <C-o>u

noremap <A-w> :setlocal wrap!<CR>

noremap <silent> <A-h> :set hlsearch!<CR>
noremap <silent> <S-A-h> :let @/ = '\V\<' . escape(expand('<cword>'), '\') . '\>' <Bar> set hls<CR>

noremap <A-0> :vertical resize 100<CR>
inoremap <A-0> <C-o>:vertical resize 100<CR>

" Macros
nnoremap \q q
nnoremap q <nop>
unmap Q
nnoremap Q @@

" Clear status line, e.g. to remove message 'search hit BOTTOM, continuing at TOP'
noremap \c :echo<cr>

" Copy
noremap Y y$
noremap <a-y> "+y
noremap <s-a-y> :%y+<cr>
vnoremap y y`]
vnoremap gy y
" Duplicate multiple lines.
nnoremap <silent> <expr> yp ':<c-u> normal ' . v:count1 . 'yy' . (v:count1 > 1 ? v:count1 - 1 . 'j' : '') . 'p<cr>'

" Копировать строку и вставить после или вместо текущей.
nnoremap <silent> _ :<c-u>call CopyLine(v:count, 0, 0)<cr>
nnoremap <silent> g_ :<c-u>call CopyLine(v:count, 1, 0)<cr>
nnoremap <silent> \_ :<c-u>call CopyLine(v:count, 1, 1)<cr>

" Copy|paste into|from clipboard
noremap <c-insert> "+y
noremap <expr> <s-insert> line('.') == 1 ? '"+P' : '"+p'
inoremap <s-insert> <c-r>+

" Toggle 'paste' mode. One could use 'set paste!' but that is not descriptive enough in the
" statusline.
nnoremap <expr> <a-p> &paste ? ':set nopaste<cr>' : ':set paste<cr>'
inoremap <expr> <a-p> &paste ? '<c-o>:set nopaste<cr>' : '<c-o>:set paste<cr>'
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
" Opens netrw at the current file's directory.
nmap <a-e> :E<cr>
" inoremap <A-e> mapped by auto-pairs
noremap [t :tprevious<cr>
noremap ]t :tnext<cr>
noremap [b :bprevious<cr>
noremap ]b :bnext<cr>
noremap [n :previous<cr>
noremap ]n :next<cr>

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
nnoremap <silent> dob :call DeleteOutWrapperBlock()<cr>

noremap <A--> :ToggleDashInIskeyword<CR>
inoremap <A--> <C-o>:ToggleDashInIskeyword<CR>
" Delete block(s) # begin #... # end #...
noremap <leader>ds :call DeleteSnippet()<cr>
noremap <leader>das :call DeleteAllSnippets()<cr>

" Search
" Search word under cursor in adjacent windows.
nnoremap <leader>/h yiw<c-w>h/\<<c-r>"\><cr>
nnoremap <leader>/j yiw<c-w>j/\<<c-r>"\><cr>
nnoremap <leader>/k yiw<c-w>k/\<<c-r>"\><cr>
nnoremap <leader>/l yiw<c-w>l/\<<c-r>"\><cr>
" Search selected fragment in adjacent windows.
vnoremap <leader>/h y<c-w>h/<c-r>"<cr>
vnoremap <leader>/j y<c-w>j/<c-r>"<cr>
vnoremap <leader>/k y<c-w>k/<c-r>"<cr>
vnoremap <leader>/l y<c-w>l/<c-r>"<cr>
" How many times word under cursor occurs in the file.
nnoremap <leader>* *<c-o>:%s///n<cr>
" Следующее/предыдущее вхождение выделенного фрагмента (в пределах строки)
" (http://vim.wikia.com/wiki/Search_for_visually_selected_text)
vnoremap <expr> <leader>8 'y/\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader>* 'y/\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader>3 'y?\V' . escape(@",'\') . '<cr>'
vnoremap <expr> <leader># 'y?\V' . escape(@",'\') . '<cr>'
" Case-insensitive search
nnoremap <c-/> /\c
" Search wordwise
nnoremap <a-/> /\<\><left><left>
" Repeat last search but wordwise.
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

" Navigation
nnoremap <up> gk
nnoremap <down> gj
" Add position into jumplist when clicking LMB and line number changes more than 10.
nnoremap <expr> <LeftMouse> abs(line(".") - line("''")) > 10 ? "m'<LeftMouse>" : "<LeftMouse>"
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

" Go to next merge conflict marker
let mergeConflictMarkerPattern = '\v^(\<{7}|\={7}|\>{7})'
nnoremap <silent> ], :<c-u>execute "keeppatterns /" . mergeConflictMarkerPattern<cr>0
nnoremap <silent> [, :<c-u>execute "keeppatterns ?" . mergeConflictMarkerPattern<cr>0
onoremap <silent> ], :<c-u>execute "keeppatterns /" . mergeConflictMarkerPattern<cr>dd
onoremap <silent> [, :<c-u>execute "keeppatterns ?" . mergeConflictMarkerPattern<cr>dd
" Could not apply keeppatterns here.
vnoremap <silent> ], /\v^(\<{7}\|\={7}\|\>{7})<cr>
vnoremap <silent> [, ?\v^(\<{7}\|\={7}\|\>{7})<cr>

" Go to next marker /* ---, e.g. /* --- DATA --- */, /* --- METHODS --- */
let vueGroupMarkerPattern = '^\s\+\/\*\s*---'
nnoremap <silent> ]v :<c-u>execute "keeppatterns /" . vueGroupMarkerPattern<cr>0
nnoremap <silent> [v :<c-u>execute "keeppatterns ?" . vueGroupMarkerPattern<cr>0
" Select group until next marker, excluding it
vnoremap <silent> ]v :<c-u>call search(vueGroupMarkerPattern, 'sW')<cr>kV''
" Select previous group and exclude current line
vnoremap <silent> [v 0:<c-u>call search(vueGroupMarkerPattern, 'bsW')<cr>V''k

" Go through the beginning of a block to its end. Mnemonics: f = function
let functionBeginning = '(.*).*{$'
nnoremap <silent> ]f :call search(functionBeginning, 'eW')<cr>%
onoremap <silent> ]f :call search(functionBeginning, 'eW') <bar> execute 'normal %j'<cr>
vnoremap <silent> ]f :<c-u>call search(functionBeginning, 'eWs')<cr>V''o%
" Go through the end of a block to its beginning.
let functionEnd = '^\s*}$'
nnoremap <silent> [f :call search(functionEnd, 'beW')<cr>%{
onoremap <silent> [f :call search(functionEnd, 'beW') <bar> execute 'normal %{'<cr>
vnoremap <silent> [f :<c-u>call search(functionEnd, 'beWs')<cr>V''o%{j

nnoremap <leader>pc :call popup_clear()<cr>

" Write .viminfo after setting a mark because git hooks can modify files resulting in vanishing marks.
nnoremap <silent> ma ma:wv<cr>
nnoremap <silent> mb mb:wv<cr>
nnoremap <silent> mc mc:wv<cr>
nnoremap <silent> md md:wv<cr>
nnoremap <silent> me me:wv<cr>
nnoremap <silent> mf mf:wv<cr>
nnoremap <silent> mg mg:wv<cr>
nnoremap <silent> mh mh:wv<cr>
nnoremap <silent> mi mi:wv<cr>
nnoremap <silent> mj mj:wv<cr>
nnoremap <silent> mk mk:wv<cr>
nnoremap <silent> ml ml:wv<cr>
nnoremap <silent> mm mm:wv<cr>
nnoremap <silent> mn mn:wv<cr>
nnoremap <silent> mo mo:wv<cr>
nnoremap <silent> mp mp:wv<cr>
nnoremap <silent> mq mq:wv<cr>
nnoremap <silent> mr mr:wv<cr>
nnoremap <silent> ms ms:wv<cr>
nnoremap <silent> mt mt:wv<cr>
nnoremap <silent> mu mu:wv<cr>
nnoremap <silent> mv mv:wv<cr>
nnoremap <silent> mw mw:wv<cr>
nnoremap <silent> mx mx:wv<cr>
nnoremap <silent> my my:wv<cr>
nnoremap <silent> mz mz:wv<cr>
nnoremap <silent> mA mA:wv<cr>
nnoremap <silent> mB mB:wv<cr>
nnoremap <silent> mC mC:wv<cr>
nnoremap <silent> mD mD:wv<cr>
nnoremap <silent> mE mE:wv<cr>
nnoremap <silent> mF mF:wv<cr>
nnoremap <silent> mG mG:wv<cr>
nnoremap <silent> mH mH:wv<cr>
nnoremap <silent> mI mI:wv<cr>
nnoremap <silent> mJ mJ:wv<cr>
nnoremap <silent> mK mK:wv<cr>
nnoremap <silent> mL mL:wv<cr>
nnoremap <silent> mM mM:wv<cr>
nnoremap <silent> mN mN:wv<cr>
nnoremap <silent> mO mO:wv<cr>
nnoremap <silent> mP mP:wv<cr>
nnoremap <silent> mQ mQ:wv<cr>
nnoremap <silent> mR mR:wv<cr>
nnoremap <silent> mS mS:wv<cr>
nnoremap <silent> mT mT:wv<cr>
nnoremap <silent> mU mU:wv<cr>
nnoremap <silent> mV mV:wv<cr>
nnoremap <silent> mW mW:wv<cr>
nnoremap <silent> mX mX:wv<cr>
nnoremap <silent> mY mY:wv<cr>
nnoremap <silent> mZ mZ:wv<cr>

" Expands active file name without extension
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:t:r') : '%%'
" Expands active file directory relative to cwd.
cnoremap <expr> %%% getcmdtype() == ':' ? expand('%:h')..'/' : '%%%'

" Yank successive ...Document, ...Query and ...Variables names to registers.
nnoremap <leader>dqv "dyiw+"qyiw+"vyiw
" Yank successive ...Document, ...Mutation and ...Variables names to registers.
nnoremap <leader>dmv "dyiw+"myiw+"vyiw

"=================================================
" Commands
"=================================================
" a is 'action'
nnoremap <leader>afj :FormatJson<cr>
nnoremap <leader>ags :GetSyntaxGroupUnderCursor<cr>
" fzf: search git files
nnoremap <leader>gf :GFiles<cr>
" Ripgrep word under cursor or selected fragment
nnoremap <expr> <leader>rg ":Rg -Fw '" . expand('<cword>') . "'<cr>"
vnoremap <leader>rg :<c-u>Rg -F '<c-r>*'<cr>

"=================================================
" Plugin specific
"=================================================
if isdirectory($PLUGDIR . '/vim-fugitive')
  nmap <leader>gb :Git blame -w -M -C<cr>
  nmap <leader>gw :Gwrite <bar> if &diff <bar> quitall <bar> endif<cr>
endif

if isdirectory($PLUGDIR . '/neosnippet.vim')
  imap <c-j> <Plug>(neosnippet_expand_or_jump)
  smap <c-j> <Plug>(neosnippet_expand_or_jump)
  xmap <c-j> <Plug>(neosnippet_expand_target)
  nmap <leader>rs :call neosnippet#variables#set_snippets({})<cr>
  " Wrap selected lines in begin-end block.
  vmap <leader>be <c-j>be<cr>
endif

if isdirectory($PLUGDIR . '/tcomment_vim')
  nmap <a-c> <plug>TComment_<c-_><c-_>
endif

if isdirectory($PLUGDIR . '/auto-pairs')
  " Дополнение к Fast Wrap <M-e>
  inoremap <a-$> <c-o>x<end><c-r>"
  inoremap <a-end> <c-o>x<end><c-r>"
  " Default <a-p> is for 'set paste!'
  let g:AutoPairsShortcutToggle = '<a-s-p>'
endif

if isdirectory($PLUGDIR . '/vim-indentwise')
  map [$ <Plug>(IndentWiseBlockScopeBoundaryBegin)
  map ]$ <Plug>(IndentWiseBlockScopeBoundaryEnd)
endif

" FileType specific mappings.
augroup maps
  autocmd!
  autocmd FileType vue,typescript nnoremap <buffer> gf :call GoToFile(expand('<cfile>'))<cr>
augroup end
