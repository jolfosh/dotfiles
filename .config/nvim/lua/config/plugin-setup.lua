-- Plugin setup and configuration

-- Patch sops.nvim to support helm filetype
local sops_util = require("sops.util")
local original_is_sops_encrypted = sops_util.is_sops_encrypted

sops_util.is_sops_encrypted = function(bufnr)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

  -- Add helm support
  if filetype == "helm" then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for _, line in ipairs(lines) do
      if string.find(line, "mac: ENC[", nil, true) then
        return true
      end
    end
  end

  return original_is_sops_encrypted(bufnr)
end

-- Notify
require('notify').setup({
    stages = 'slide',  -- Just slide in/out, no fade
    timeout = 3000,
    render = 'compact',
})
vim.notify = require('notify')

-- NvimTree
require('nvim-tree').setup()

-- Treesitter (new main-branch API)
-- The plugin only installs parsers/queries now; highlighting is provided
-- by Neovim's built-in `vim.treesitter.start()`. Parsers are installed via
-- `:TSInstall <lang>` (or `:TSUpdate`) into stdpath('data')/site/parser.
require('nvim-treesitter').setup()

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- Mermaid ASCII rendering
-- require('nvim-mermaid').setup({
--     binary = '/home/josh/source/tmp/nvim-mermaid/mermaid-ascii',
-- })
