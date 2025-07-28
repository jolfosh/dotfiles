set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.config/nvim/plugged') 
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'jlcrochet/vim-razor'
Plug 'christoomey/vim-tmux-navigator'
Plug 'trixnz/sops.nvim'
"Plug 'qvalentin/helm-ls.nvim', { 'ft': 'helm' }
call plug#end()

lua require('nvim-tree').setup()
"lua require('helm-ls').setup()

lua << EOF
require'nvim-treesitter.configs'.setup {
	hightlight = { enable = true }
}
EOF

let mapleader = ' '

set background=dark
colorscheme gruvbox

nnoremap <leader>, :NvimTreeToggle<CR>,
nnoremap ,, :NvimTreeToggle<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>" 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>64e viWc<c-r>=system('base64 -w 0', @")<cr><esc>
nnoremap <leader>64d viWc<c-r>=system('base64 --decode', @")<cr><esc>
vnoremap <leader>64e c<c-r>=system('base64 -w 0', @")<cr><esc>
vnoremap <leader>64d c<c-r>=system('base64 --decode', @")<cr><esc>

source ~/.vimrc
