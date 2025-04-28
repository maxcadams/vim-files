imap jf <Esc>

"set nocompatible  "Kill vi-compatibility
"set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding
"
"" Indent 4 spaces
set tabstop=4  "4 space tabs
set shiftwidth=4  "4 space shift
set softtabstop=4  "Tab spaces in no hard tab mode
"set expandtab  " Expand tabs into spaces
"set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set ruler  "Show bottom ruler

set equalalways  "Split windows equal size

set formatoptions=croq  "Enable comment line auto formatting

set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately


set scrolloff=5  "Never scroll off
"set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
"set backspace=indent,eol,start  "Better backspacing
"set linebreak  "Intelligently wrap long files
"set ttyfast  "Speed up vim
"set nostartofline "Vertical movement preserves horizontal position
set nu
set mouse=a

noremap <C-a> g^
noremap <C-e> g_
noremap <C-k> d$
noremap <leader>f :FZF<CR>
noremap <leader>w :w<CR>
noremap <leader>n :noh<CR>
noremap <leader>v <C-w>v
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k


" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e
"
"" Syntax highlighting and stuff
syntax enable
filetype plugin indent on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Vim Plug stuff
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"" Color scheme
autocmd vimenter * ++nested colorscheme gruvbox
