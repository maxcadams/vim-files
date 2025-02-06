-- Neovim Lua Configuration with Vim-Plug (Packer code commented for future use)

-- Easier autocomplete with LSP
vim.api.nvim_set_keymap('i', 'jf', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', ';l', '<C-x><C-o>', { noremap = true, silent = true })

-- Set encoding and options
vim.o.encoding = 'utf-8'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.showmatch = true
vim.o.ruler = true
vim.o.equalalways = true
vim.o.formatoptions = 'croq'
vim.o.title = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.scrolloff = 5
vim.o.lazyredraw = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.nu = true
vim.o.mouse = 'a'

-- Map leader key
vim.g.mapleader = '['

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-a>', 'g^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':FZF<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })

-- Save with <C-s>
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Strip trailing whitespace on save
vim.cmd([[
  autocmd BufWritePre * :%s/\s\+$//e
]])

-- Plugin Management with Vim-Plug (Vim-Plug specific)
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'lervag/vimtex'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  -- LSP configuration and auto-completion
  Plug 'neovim/nvim-lspconfig'

  call plug#end()
]])

-- Packer set up below (swap to lazy)
--[[   
  require('packer').startup(function(use)
    use 'morhetz/gruvbox'
    use 'ErichDonGubler/vim-sublime-monokai'
    use 'lervag/vimtex'
    use 'junegunn/vim-easy-align'
    use 'tpope/vim-fugitive'
    use { 'junegunn/fzf', run = ':fzf#install()' }
    use 'junegunn/fzf.vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
  end)
]]

-- LSP setup (example: rust analyzer)
require'lspconfig'.rust_analyzer.setup({})

-- Treesitter setup
require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
})

-- Set colorscheme
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- Enable filetype plugin and indent
vim.cmd('filetype plugin indent on')

-- For VSCode extension compatibility
if vim.fn.exists('g:vscode') == 1 then
  -- VSCode-specific config
else
  -- Regular Neovim config
end
