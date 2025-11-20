-- Options configuration
local opt = vim.opt

-- Theme
opt.background = 'dark'
vim.cmd.colorscheme('gruvbox')

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable inlay hints globally
vim.lsp.inlay_hint.enable(true)

-- Detect Helm chart files
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*/templates/*.yaml', '*/templates/*.tpl', '*/templates/*.yml'},
    callback = function()
        vim.bo.filetype = 'helm'
    end,
})

-- Also detect based on Chart.yaml in parent directories
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.yaml', '*.yml'},
    callback = function()
        local path = vim.fn.expand('%:p:h')
        if vim.fn.findfile('Chart.yaml', path .. ';') ~= '' then
            vim.bo.filetype = 'helm'
        end
    end,
})
