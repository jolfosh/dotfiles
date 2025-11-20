-- Keymaps configuration
local keymap = vim.keymap.set

-- NvimTree
keymap('n', '<leader>,', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
keymap('n', ',,', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>', { desc = 'Find files' })
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { desc = 'Live grep' })
keymap('n', '<leader>fb', ':Telescope buffers<cr>', { desc = 'Find buffers' })
keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = 'Help tags' })

-- Yazi file manager
keymap('n', '<leader>-', function() require('yazi').yazi() end, { desc = 'Open Yazi' })

-- Base64 encoding/decoding
keymap('n', '<leader>64e', 'viWc<c-r>=system("base64 -w 0", @")<cr><esc>', { desc = 'Base64 encode' })
keymap('n', '<leader>64d', 'viWc<c-r>=system("base64 --decode", @")<cr><esc>', { desc = 'Base64 decode' })
keymap('v', '<leader>64e', 'c<c-r>=system("base64 -w 0", @")<cr><esc>', { desc = 'Base64 encode selection' })
keymap('v', '<leader>64d', 'c<c-r>=system("base64 --decode", @")<cr><esc>', { desc = 'Base64 decode selection' })
