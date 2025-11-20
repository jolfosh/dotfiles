-- LSP configuration using mason.nvim and vim.lsp.config
-- Simple, table-driven approach with sensible defaults

-- Setup Mason
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- LSP server configurations
-- Add/remove servers here, settings are optional
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                }
            }
        }
    },
    bashls = {},
    gopls = {},
    clangd = {},
    yamlls = {},
    jedi_language_server = {},
    dockerls = {},
    helm_ls = {},
    intelephense = {},
    svelte = {},
    vimls = {},
    angularls = {},
    lemminx = {},
    biome = {},
    postgres_lsp = {},
    hyprls = {},
    jqls = {},
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                inlayHints = {
                    bindingModeHints = { enable = false },
                    chainingHints = { enable = true },
                    closingBraceHints = { enable = true, minLines = 25 },
                    closureReturnTypeHints = { enable = "never" },
                    lifetimeElisionHints = { enable = "never" },
                    parameterHints = { enable = true },
                    typeHints = { enable = true },
                },
            }
        }
    },
}

-- Setup mason-lspconfig for automatic installation
local server_names = vim.tbl_keys(servers)
require('mason-lspconfig').setup({
    ensure_installed = server_names,
    automatic_installation = true,
})

-- LSP progress notifications with fidget-like behavior
local progress_notifications = {}

local progress_handler = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local value = result.value

    if not client or not value then return end

    local token = result.token
    local kind = value.kind

    -- Create unique key for this progress item
    local key = string.format('%s_%s', client.id, token)

    if kind == 'begin' then
        local message = value.message or ''
        local title = string.format('%s: %s', client.name, value.title or '')

        -- Create new notification and store the reference
        local notif = vim.notify(message, vim.log.levels.INFO, {
            title = title,
            timeout = false,
            hide_from_history = true,
        })
        progress_notifications[key] = notif

    elseif kind == 'report' then
        local message = value.message or ''
        if value.percentage then
            message = string.format('%s (%.0f%%)', message, value.percentage)
        end

        -- Update existing notification
        if progress_notifications[key] then
            local title = string.format('%s: %s', client.name, value.title or '')
            progress_notifications[key] = vim.notify(message, vim.log.levels.INFO, {
                title = title,
                replace = progress_notifications[key],
                timeout = false,
                hide_from_history = true,
            })
        end

    elseif kind == 'end' then
        local message = value.message or 'Complete'

        -- Replace with completion message and auto-dismiss
        if progress_notifications[key] then
            local title = string.format('%s: %s', client.name, value.title or '')
            vim.notify(message, vim.log.levels.INFO, {
                title = title,
                replace = progress_notifications[key],
                timeout = 1000,
            })
            progress_notifications[key] = nil
        end
    end
end

vim.lsp.handlers['$/progress'] = progress_handler

-- LSP keybindings and inlay hints
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)

        -- Enable inlay hints if the server supports it
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})

-- Add LSP capabilities for nvim-cmp
local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = has_cmp and cmp_nvim_lsp.default_capabilities() or {}

-- Configure all servers
for server, config in pairs(servers) do
    -- Merge capabilities into each server config
    config.capabilities = vim.tbl_deep_extend('force', capabilities, config.capabilities or {})
    vim.lsp.config[server] = config
end

-- Enable all servers
vim.lsp.enable(server_names)
