-- Plugin setup and configuration

-- Notify
require('notify').setup({
    stages = 'slide',  -- Just slide in/out, no fade
    timeout = 3000,
    render = 'compact',
})
vim.notify = require('notify')

-- NvimTree
require('nvim-tree').setup()

-- Treesitter
require('nvim-treesitter.configs').setup({
    highlight = { enable = true }
})
