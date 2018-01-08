let g:plug_window='topleft'
silent! call plug#begin()
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'andbar-ru/vim-unicon'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
if executable('git')
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
endif
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/matchit'
Plug 'voithos/vim-python-matchit'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'danro/rename.vim'
Plug 'alvan/vim-closetag'
"Plug 'jiangmiao/auto-pairs'
Plug 'JarrodCTaylor/vim-reflection'
if version > 703  " 7.3
    Plug 'jlanzarotta/bufexplorer'
endif
Plug 'jeetsukumaran/vim-indentwise'
Plug 'vim-python/python-syntax'
Plug 'dzeban/vim-log-syntax'
Plug 'PProvost/vim-ps1'
Plug 'posva/vim-vue'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', {'dir': '~/Programs/fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'  " for neosnippet
call plug#end()

if has('win32')
    source $VIMRUNTIME/defaults.vim
    let $LANG = 'en'
    set encoding=utf-8  " To enable maps with Alt key
endif

let g:highlightTrailingSpace = 1

" Includes
let $VIMRCDIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
source $VIMRCDIR/plugins_settings.vim
source $VIMRCDIR/functions.vim
source $VIMRCDIR/commands.vim
source $VIMRCDIR/maps.vim
source $VIMRCDIR/autocmds.vim

"" Colorscheme
if $USER == 'root'
    set background=dark
else
    set background=light
endif
set termguicolors
colorscheme unicon

let g:indentLine_enabled=0

set encoding=utf-8
set history=10000
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set autowrite
set autochdir
set mouse=a
set splitbelow
set splitright
set display=lastline
set title
set lazyredraw

" Команды копирования и удаления помещают в регистр "*
set clipboard=unnamed

set wildmenu
set wildmode=list:longest
set cursorline
set visualbell
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set copyindent
set nostartofline
set whichwrap+=<,>,[,]
set listchars=tab:»\ ,trail:·,eol:¶
set showbreak=↳\ 
set breakindent
set breakindentopt=shift:4
set updatetime=1000
set gdefault
set pastetoggle=<A-p>
set directory=$VIMRCDIR/swapfiles/
set switchbuf=usetab,newtab

if exists('+colorcolumn')
    set colorcolumn=100
endif

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set foldenable
let b:filepath = expand('%:p')
set foldmethod=indent
set foldminlines=3
set foldnestmax=3
set foldopen+=jump

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
" default + buffer number
set statusline=%<%n:%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" nvim or not
if has('nvim')
  set inccommand=nosplit
else
  set cryptmethod=blowfish2
endif

