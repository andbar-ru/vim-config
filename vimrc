let g:plug_window='topleft'
silent! call plug#begin()
" colorschemes
Plug 'mswift42/vim-themes'
Plug 'andbar-ru/vim-unicon'
Plug 'morhetz/gruvbox'

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
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'danro/rename.vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
if version >= 740
  Plug 'jlanzarotta/bufexplorer'
endif
Plug 'jeetsukumaran/vim-indentwise'
Plug 'dzeban/vim-log-syntax'
Plug 'PProvost/vim-ps1'
Plug 'posva/vim-vue'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'voithos/vim-python-matchit'
if version >= 800
  " If one add {'for':'go'}, vim-go/syntax/go.vim loads later than builtin syntax/go.vim.
  Plug 'fatih/vim-go', {'do':':GoInstallBinaries'}
endif
if executable('tsc')
  Plug 'leafgarland/typescript-vim'
endif
if version >= 800
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
endif
if has('unix') && version >= 800
  Plug 'junegunn/fzf', {'dir': '~/Programs/fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  " Plug 'w0rp/ale'
endif
if executable('ctags') && hostname() != 'asus'
  Plug 'ludovicchabant/vim-gutentags'
endif
call plug#end()

packadd! matchit

" From debian system vimrc
syntax on
filetype plugin indent on

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
source $VIMRCDIR/syntax.vim

call AddVenvSitePackages()

" Colorscheme
if $USER == 'root'
  set background=dark
else
  set background=light
endif
colorscheme unicon

let g:indentLine_enabled=0

if version >= 800
  if executable('tput') && system('tput colors') >= 256
    set termguicolors
  endif
  set breakindent
  set breakindentopt=shift:4
endif

set colorcolumn=100
set encoding=utf-8
set history=10000
set showcmd
set showmatch
set noignorecase
set incsearch
set nohlsearch
set autowrite
set autochdir
set mouse=a
set splitbelow
set splitright
set display=lastline
set title
set lazyredraw
set clipboard=unnamed " Команды копирования и удаления помещают в регистр "*
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
set nohidden
set nostartofline
set whichwrap+=<,>,[,]
set listchars=tab:»\ ,trail:·,eol:¶
set showbreak=↳\ 
set updatetime=1000
set gdefault
set pastetoggle=<a-p>
set directory=$VIMRCDIR/swapfiles/
set switchbuf=usetab
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set foldenable
set foldmethod=indent
set foldminlines=3
set foldnestmax=4
set foldopen+=jump
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if exists('g:gutentags_enabled')
  set statusline=%<%n:%f\ %h%m%r%w%=%{gutentags#statusline()}\ %l,%c%V\ %P " + gutentags
  set rulerformat=%=%{gutentags#statusline()}\ %l,%c%V\ %P
else
  set statusline=%<%n:%f\ %h%m%r%w%=%l,%c%V\ %P " default + buffer number
  set rulerformat=%=%l,%c%V\ %P
endif
set diffopt+=vertical,indent-heuristic,algorithm:histogram,iwhite

" nvim or not
if has('nvim')
  set inccommand=nosplit
elseif version >= 800
  set cryptmethod=blowfish2
endif
