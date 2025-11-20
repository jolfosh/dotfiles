-- Main init.lua
-- Modern Neovim configuration in modular Lua

-- Load plugins (vim-plug)
require('config.plugins')

-- Load basic options
require('config.options')

-- Setup plugins
require('config.plugin-setup')

-- Load LSP configuration
require('config.lsp')

-- Load completion configuration
require('config.completion')

-- Load keymaps
require('config.keymaps')

-- Source legacy .vimrc if it exists
local vimrc = vim.fn.expand('~/.vimrc')
if vim.fn.filereadable(vimrc) == 1 then
    vim.cmd('source ' .. vimrc)
end
