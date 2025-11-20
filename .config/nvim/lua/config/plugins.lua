-- Plugin configuration using vim-plug
-- Set runtime paths for vim compatibility
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.o.packpath = vim.o.runtimepath

-- Initialize vim-plug
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- File explorer and icons
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')

-- LSP and language support
Plug('neovim/nvim-lspconfig')
Plug('mason-org/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- Completion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

-- Editing enhancements
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')

-- Fuzzy finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

-- Syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Theme
Plug('ellisonleao/gruvbox.nvim')

-- Language specific
Plug('jlcrochet/vim-razor')
Plug('cuducos/yaml.nvim')

-- Utilities
Plug('christoomey/vim-tmux-navigator')
Plug('trixnz/sops.nvim')
Plug('MeanderingProgrammer/render-markdown.nvim')
Plug('jbyuki/venn.nvim')
Plug('mikavilpas/yazi.nvim')
Plug('rcarriga/nvim-notify')

vim.call('plug#end')
