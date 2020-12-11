" Disable 'sensible' in polyglot because it sets 'noswapfile'.
let g:polyglot_disabled = ['sensible', 'typescript']

let g:plug_window='topleft'
silent! call plug#begin()
" colorschemes
Plug 'andbar-ru/vim-unicon'
Plug 'mswift42/vim-themes'
Plug 'morhetz/gruvbox'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
if executable('git')
  silent! system('git rev-parse --is-inside-work-tree')
  if !v:shell_error
    Plug 'tpope/vim-fugitive'
    " Plug 'airblade/vim-gitgutter'
  endif
endif
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'danro/rename.vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
if version >= 740
  Plug 'jlanzarotta/bufexplorer'
endif
Plug 'jeetsukumaran/vim-indentwise'
Plug 'simnalamburt/vim-mundo'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'voithos/vim-python-matchit'
if version >= 800
  " If one add {'for':'go'}, vim-go/syntax/go.vim loads later than builtin syntax/go.vim.
  " Plug 'fatih/vim-go', {'do':':GoInstallBinaries'}
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
endif
if has('unix') && version >= 800 && $USER != 'root'
  Plug 'junegunn/fzf', { 'dir': '~/Programs/fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Useful optional dependencies: watchman
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
if has('nvim')
  Plug 'equalsraf/neovim-gui-shim'
endif

Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'dzeban/vim-log-syntax'
" Plug 'posva/vim-vue'
" Plug 'groenewege/vim-less'
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'vim-python/python-syntax'
" Plug 'jparise/vim-graphql'
call plug#end()

runtime defaults.vim

if has('win32')
  let $LANG = 'en'
  set encoding=utf-8  " To enable maps with Alt key
endif

packadd! matchit

let g:hostname = substitute(system('hostname'), '\n', '', '')
let g:highlightTrailingSpace = 1
" <Ctrl-6> should go to the last file, not to netrw.
let g:netrw_altfile = 1
" from autoload/netrw.vim -nonu +relativenumber
let g:netrw_bufsettings = "noma nomod nobl nowrap ro relativenumber"

" Includes
let $VIMRCDIR = expand('<sfile>:p:h')
let $PLUGDIR = expand('<sfile>:p:h') . '/plugged'
runtime plugins_settings.vim
runtime functions.vim
runtime commands.vim
runtime maps.vim
runtime autocmds.vim

" Colorscheme
if $USER == 'root'
  set background=dark
else
  set background=light
endif
if isdirectory($PLUGDIR . '/vim-unicon')
  colorscheme unicon
else
  " Set builtin colorscheme
  set background=dark
  colorscheme blue
endif
" Could not set colorscheme (e.g in tty)
if !exists('g:colors_name')
  " Set builtin colorscheme
  set background=dark
  colorscheme blue
endif

let g:indentLine_enabled=0

if version >= 800
  if executable('tput') && system('tput colors') >= 256
    set termguicolors
  endif
  set breakindent
  set breakindentopt=shift:4
endif

set mouse=a
set colorcolumn=100
set encoding=utf-8
set history=10000
set showmatch
set noignorecase
set nohlsearch
set nobackup
set nowritebackup
set autowrite
set autochdir
set splitbelow
set splitright
set display=lastline
set title
set lazyredraw
set clipboard=unnamed " Команды копирования и удаления помещают в регистр "*
set wildmode=list:longest
set cursorline
set visualbell
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set copyindent
set hidden
set nostartofline
set whichwrap+=<,>,[,]
set listchars=tab:»\ ,trail:·,eol:¶
set showbreak=↳\ 
set updatetime=300
set gdefault
set pastetoggle=<a-p>
set directory=$VIMRCDIR/swapfiles/
set switchbuf=usetab
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set backspace=indent,eol,start
set nofoldenable
set foldmethod=indent
set foldminlines=3
set foldnestmax=4
set foldopen+=jump
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,globals
set statusline=%<%n:%f\ %h%m%r%w%=%l,%c%V\ %P " default + buffer number
set rulerformat=%=%l,%c%V\ %P
if version >= 801
  set diffopt+=vertical,indent-heuristic,algorithm:patience,iwhiteall
else
  set diffopt+=vertical
endif
set complete-=t " exclude tags, for tags <c-x><c-]>
set scrolloff=0
set noautoread
set linespace=-1

" nvim or not
if has('nvim')
  set inccommand=nosplit
elseif version >= 800
  set cryptmethod=blowfish2
endif
