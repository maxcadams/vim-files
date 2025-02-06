imap jf <Esc>

"easier autocomplete w/ lsp
inoremap ;l <C-x><C-o>

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

let mapleader = "["

noremap <C-a> g^

"noremap <C-s> <Esc>:w
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

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
:nmap <leader>ff :py3f /opt/homebrew/Cellar/clang-format/15.0.5/bin/clang-format.py<cr>

"" Vim Plug stuff
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" LSP stuff and autocomplete
Plug 'neovim/nvim-lspconfig'
call plug#end()

"" Syntax highlighting and stuff
set background=dark
colorscheme gruvbox
filetype plugin indent on

if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
endif

"jset verbose=20

"" for VimTex
"let g:vimtex_view_general_viewer = 'Firefox'
"exists('gvscode')
"" LUA stuff w Plug
lua require('treesitter')
"lua require('lspconfig').ccls.setup{init_options = {clang = {extraArgs = {"-std=c++17", "-stdlib=libc++", "-I/usr/local/include", "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1", "-I/Library/Developer/CommandLineTools/usr/lib/clang/14.0.3/include", "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include", "-I/Library/Developer/CommandLineTools/usr/include", "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks", "-fcolor-diagnostics", "-ferror-limit=100", "c++", "gcc-toolchain=/usr/bin/g++"}}}}

lua require'lspconfig'.rust_analyzer.setup({})
lua require('lsp')
