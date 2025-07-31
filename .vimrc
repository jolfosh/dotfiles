set nocompatible
set timeout timeoutlen=500 ttimeoutlen=100
set clipboard=unnamed,unnamedplus
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set number
set relativenumber
set smartcase
set nowrap
set hlsearch
set splitbelow
set splitright
let mapleader = ' '

" Because I must
inoremap jk <Esc>

" Set Absolute & Relative line numbers
nnoremap <leader>na :set rnu!<CR>

" Clear search highlights
nnoremap <Esc> :nohl<CR>

" Set Save & Quit
nnoremap <leader>w :w<cr>
vnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
vnoremap <leader>q :q<cr>

" VsVim Specific
if !has('nvim')
  nnoremap <leader>ki :vsc Edit.QuickInfo<CR>
  nnoremap <leader>kp :vsc Edit.ParameterInfo<CR>
  nnoremap gcc :vsc Edit.ToggleLineComment<CR>
	vnoremap gcc :vsc Edit.CommentSelection<CR>
	vnoremap gcu :vsc Edit.UncommentSelection<CR>
  nnoremap <leader>] :vsc Edit.NextMethod<CR>
  nnoremap <leader>[ :vsc Edit.PreviousMethod<CR>
endif
