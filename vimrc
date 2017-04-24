let g:plug_window='topleft'
silent! call plug#begin()
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'
Plug 'andbar-ru/vim-unicon'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
if executable('git')
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
endif
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'andbar-ru/python-syntax'
Plug 'andbar-ru/vim-python-pep8-indent'
Plug 'tmhedberg/matchit'
Plug 'voithos/vim-python-matchit'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'sukima/xmledit'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'danro/rename.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'JarrodCTaylor/vim-reflection'
if version > 703  " 7.3
    Plug 'jlanzarotta/bufexplorer'
endif
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dzeban/vim-log-syntax'
Plug 'vim-syntastic/syntastic'
call plug#end()

let g:highlightTrailingSpace = 1

" Includes
source $HOME/.vim/functions.vim
source $HOME/.vim/commands.vim
source $HOME/.vim/maps.vim
source $HOME/.vim/autocmds.vim

"" Colorscheme
if $USER == 'root'
    set background=dark
else
    set background=light
endif
set t_Co=256
colorscheme unicon

let g:indentLine_enabled=0

set encoding=utf-8
set history=10000
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set nohlsearch
set autowrite
set mouse=a
set splitbelow
set splitright

" Команды копирования и удаления помещают в регистр "*
set clipboard=unnamed

set wildmenu
set wildmode=list:longest
set autochdir
set cursorline
set visualbell
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set copyindent
set nostartofline
set whichwrap+=<,>,[,]
set listchars=tab:»\ ,trail:·,eol:¶
set showbreak=↳\ 
set updatetime=1000
set gdefault
set pastetoggle=<A-p>
set directory=$HOME/.vim/swapfiles//

if exists('+colorcolumn')
    set colorcolumn=100
endif

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set foldenable
let b:filepath = expand('%:p')
if !has('gui_running') || ((b:filepath != '') && (winheight(0) > system('wc -l <' . b:filepath)))
    set foldlevelstart=99
endif
set foldmethod=indent
set foldminlines=3
set foldnestmax=3

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
" default + buffer number
set statusline=%<%n:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Plugin settings
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc', '\.swp$']

let g:SuperTabRetainCompletionDuration = "completion"
let g:SuperTabNoCompleteAfter = ['\s', ':', ')', ']', '}', "'", '"', '^']

let g:xmledit_enable_html = 1

let g:python_pep8_indent_multiline_string=-1
let g:python_highlight_all = 1

let g:gitgutter_signs = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3.6'
