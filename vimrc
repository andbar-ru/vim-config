let g:plug_window='topleft'
silent! call plug#begin()
" colorschemes
Plug 'andbar-ru/vim-unicon'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
if executable('git')
  silent! system('git rev-parse --is-inside-work-tree')
  if !v:shell_error
    Plug 'tpope/vim-fugitive'
  endif
endif
Plug 'tomtom/tcomment_vim'
Plug 'danro/rename.vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
if version >= 740
  Plug 'jlanzarotta/bufexplorer'
endif
Plug 'jeetsukumaran/vim-indentwise'
Plug 'simnalamburt/vim-mundo'
Plug 'AndrewRadev/splitjoin.vim'
if version >= 800
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
endif
if has('unix') && version >= 800 && $USER != 'root'
  Plug 'junegunn/fzf', { 'dir': '~/Programs/fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
endif
Plug 'airblade/vim-rooter'
Plug 'govim/govim'
call plug#end()

runtime defaults.vim
" Cancel BufReadPost autocmd in defaults.vim. My BufReadPost autocmd is in ./autocmds.vim.
if &diff
  autocmd! vimStartup BufReadPost
endif

if has('win32')
  let $LANG = 'en'
  set encoding=utf-8  " To enable maps with Alt key
endif

packadd! matchit

" Global variables
let g:hostname = substitute(system('hostname'), '\n', '', '')
let g:highlightTrailingSpace = 1
" <Ctrl-6> should go to the last file, not to netrw.
let g:netrw_altfile = 1
" from autoload/netrw.vim -nonu +relativenumber
let g:netrw_bufsettings = "noma nomod nobl nowrap ro relativenumber"
let g:indentLine_enabled=0

" Language specific settings <<END
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"
" Do not increase indent for these tags.
let g:html_indent_autotags = "html,body,head"

" Customize go syntax
let g:go_highlight_operators = 1
" END

" Includes
let $VIMRCDIR = expand('<sfile>:p:h')
let $PLUGDIR = expand('<sfile>:p:h') . '/plugged'
runtime plugins_settings.vim
runtime functions.vim
runtime commands.vim
runtime maps.vim
runtime abbrs.vim
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
set viminfo='1000,<100,s10,h,:10000
set showmatch
set noignorecase
set nohlsearch
set nobackup
set nowritebackup
set autowrite
set splitbelow
set splitright
set display=lastline
set title
set lazyredraw
" set clipboard=unnamed " Команды копирования и удаления помещают в регистр "*
set wildmode=list:longest
set cursorline
set visualbell
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set hidden
set nostartofline
set whichwrap+=<,>,[,]
set listchars=tab:»\ ,trail:·,eol:¶
set showbreak=↳\ 
set gdefault
set pastetoggle=<a-p>
set directory=$VIMRCDIR/swapfiles/
set switchbuf=usetab
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set backspace=indent,eol,start " =2
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
set regexpengine=0

" Set/changed according to the recommendations in govim documentation: plugged/govim/cmd/govim/config/minimal.[g]vimrc
set noswapfile
set ttymouse=sgr
set updatetime=500 " default 4000
set balloondelay=250 " default 600
set completeopt+=popup
set completepopup=align:menu,border:off,highlight:Pmenu

" nvim or not
if has('nvim')
  set inccommand=nosplit
elseif version >= 800
  set cryptmethod=blowfish2
endif
